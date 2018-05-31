package com.healthbot.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.healthbot.module.business.ModuleBusiness;
import com.heathbot.beans.TblModules;
import com.heathbot.beans.TblStudy;
import com.heathbot.beans.TblUsers;
import com.heathbot.study.business.StudyBusiness;
import com.heathbot.user.business.UserBusiness;


@Controller
public class ModuleController {
	
	// userBusiness is required for taking the last value of the userId
	@Autowired
	@Qualifier("userBusiness")
	public UserBusiness userBusiness;
	
	public UserBusiness getUserBusiness() {
		return userBusiness;
	}

	public void setUserBusiness(UserBusiness userBusiness) {
		this.userBusiness = userBusiness;
	}

	//studyBusiness is required for taking the last value of the studyId
	@Autowired
	@Qualifier("studyBusiness")
	public StudyBusiness studyBusiness; 
	
	public StudyBusiness getStudyBusiness() {
		return studyBusiness;
	}

	public void setStudyBusiness(StudyBusiness studyBusiness) {
		this.studyBusiness = studyBusiness;
	}

	
	@Autowired
	@Qualifier("moduleBusiness")
	ModuleBusiness moduleBusiness;
	
	public ModuleBusiness getModuleBusiness() {
		return moduleBusiness;
	}

	public void setModuleBusiness(ModuleBusiness moduleBusiness) {
		this.moduleBusiness = moduleBusiness;
	}

	// Display module form, for filling the data first
	@RequestMapping("/showmoduleform")
	public ModelAndView showmoduleform() {

		return new ModelAndView("module-form", "command", new TblModules());

	}
	
	
	// catch the data which comes from module-form.jsp
	@RequestMapping(value="/savemoduleform",method = RequestMethod.POST)  
    public ModelAndView saveModuleForm(Model model, HttpServletRequest request, HttpServletResponse response){ 
		System.out.println("This is Module table");
		
		String module_description = request.getParameter("module_description");
		String module_title = request.getParameter("module_title");
		String module_video_url = request.getParameter("module_video_url");
		String module_goal = request.getParameter("module_goal");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		//convert the string dates to Date format
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
		Date covertedStartDate = null;
		Date covertedEndtDate = null;
			try {
					covertedStartDate = dateFormat.parse(startDate);
					covertedEndtDate = dateFormat.parse(endDate);
				} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}	
			
			// get the last userID and studyID 
			//add the User information
	        TblUsers tblUsers = new TblUsers();
	        List<TblUsers> user = userBusiness.getAllUser();
	        
	        //take a list for saving just user ids
	        List<Integer> user2 = new ArrayList<Integer>();
	        
	        for (TblUsers tblUsers2 : user) {
	        	user2.add(tblUsers2.getUserId());
			}
	        
	        //save the last user id in an integer variable
	        int lastUserId = user2.get(user2.size() - 1);
	        
			
	        // now get the last studyId
			TblStudy tblStudy = new TblStudy();
			List<TblStudy> studies = studyBusiness.getAllStudies();
			
			//take a list for saving just study ids
			List<Integer> study2 = new ArrayList<Integer>();
			
			for (TblStudy tblStudy2 : studies) {
				study2.add(tblStudy2.getStudyId());
			}
			
			//save the last study id in an integer variable
	        int lastStudyId = study2.get(study2.size() - 1);
			//System.out.println("This is MODULE STUDY ID IS: " + lastStudyId);
			
			//Now, set the user id in userID table
			tblUsers.setUserId(lastUserId);
			
			//Now, set the study id in study table
			tblStudy.setStudyId(lastStudyId);
			
			// set the all values in TblModule
			// save the values into the TblModules bean
			TblModules tblModules = new TblModules();
			tblModules.setModuleDesc(module_description);
			tblModules.setModuleTitle(module_title);
			tblModules.setModuleVideoUrl(module_video_url);
			tblModules.setGoals(module_goal);
			tblModules.setStartTime(covertedStartDate);
			tblModules.setEndTime(covertedEndtDate);
			
			//Now, save userID and studyID primary keys into the table
			tblModules.setTblUsers(tblUsers);
			tblModules.setTblStudy(tblStudy);
			
			//now, save the tblModules,
			int saveModule = moduleBusiness.saveModule(tblModules);
			//System.out.println("In modulle controller : " + saveModule);
			
			
			
        //return new ModelAndView("redirect:/studies");//will redirect to viewemp request mapping
			return new ModelAndView("section-forms");
    }
	
	// take two global varibles to set the userIdForModule and studyIdForModule
	int userIdForModule;
	int studyIdForModule;
	
	@RequestMapping("/getUserIdStudId/{userId}/{studyId}")
	 public ModelAndView getUserIdStudId(@PathVariable("userId") Integer userId,@PathVariable("studyId") Integer studyId, Model model){
		
		System.out.println("In StudyController: user id is " + userId + " Study Id is : " + studyId );
		
		// set the userid to userIdForModule
		// set the studyid to studyIdForModule
		
		//System.out.println("Null: user id is " + userIdForModule + " Study Id is : " + studyIdForModule );
		
		userIdForModule = userId;
		studyIdForModule = studyId;
		
		//System.out.println("Values: user id is " + userIdForModule + " Study Id is : " + studyIdForModule );
		
		TblUsers tblUsers = new TblUsers();
		tblUsers.setUserId(userId);
		
		TblStudy tblStudy = new TblStudy();
		tblStudy.setStudyId(studyId);
		
		TblModules tblModules = new TblModules();
		tblModules.setTblUsers(tblUsers);
		tblModules.setTblStudy(tblStudy);
		
		return new ModelAndView("specific-module", "module", tblModules);
		
	}
	
	// create a method to save the moduleId with the new userIdForModule and studyIdForModule
	@RequestMapping(value="/saveSpecificModule",method = RequestMethod.POST)  
    public ModelAndView saveSpecificmodule( Model model, HttpServletRequest request, HttpServletResponse response){
	
		String userId = request.getParameter("userId");
		String studyId = request.getParameter("studyId");
		
		System.out.println("In saveSpecificmodule UUUUSER ID " + userId + "SSSSSID" + studyId );
		
		return null;
		
	}
	
	
	
}
