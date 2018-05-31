package com.healthbot.controller;

import java.io.IOException;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.healthbot.module.business.ModuleBusiness;
import com.healthbot.section.dao.SectionDAO;
import com.healthbot.survey.dao.SurveyDAO;
import com.heathbot.beans.TblModules;
import com.heathbot.beans.TblSection;
import com.heathbot.beans.TblStudy;
import com.heathbot.beans.TblSurvey;
import com.heathbot.beans.TblUsers;
import com.heathbot.study.business.StudyBusiness;
import com.heathbot.user.business.UserBusiness;

@Controller
public class SurveyController {

	@Autowired
	@Qualifier("surveyDAO")
	SurveyDAO surveyDAO;
	public SurveyDAO getSurveyDAO() {
		return surveyDAO;
	}

	public void setSurveyDAO(SurveyDAO surveyDAO) {
		this.surveyDAO = surveyDAO;
	}

	@Autowired
	@Qualifier("sectionDAO")
	SectionDAO sectionDAO;
	public SectionDAO getSectionDAO() {
		return sectionDAO;
	}

	public void setSectionDAO(SectionDAO sectionDAO) {
		this.sectionDAO = sectionDAO;
	}

		// moduleBusiness for getting the last id of it and saving it to the database of section table
		@Autowired
		@Qualifier("moduleBusiness")
		ModuleBusiness moduleBusiness;
		
		public ModuleBusiness getModuleBusiness() {
			return moduleBusiness;
		}

		public void setModuleBusiness(ModuleBusiness moduleBusiness) {
			this.moduleBusiness = moduleBusiness;
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
	@Qualifier("userBusiness")
	public UserBusiness userBusiness;
	
	public UserBusiness getUserBusiness() {
		return userBusiness;
	}

	public void setUserBusiness(UserBusiness userBusiness) {
		this.userBusiness = userBusiness;
	}

	// Display section form, for filling the data first
	@RequestMapping("/surveyform")
		public ModelAndView showmoduleform() {
			//return new ModelAndView("section-form", "command", new TblSection());
			return new ModelAndView("survey-forms", "command", new TblSurvey());
		}
	
	// save form details
	@RequestMapping(value="/saveSurvey",method = RequestMethod.POST)  
    public ModelAndView saveSurvey(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("tblSurvey") TblSurvey tblSurvey,
			@RequestParam("file") MultipartFile file){  
    	
			String addQuestion = request.getParameter("addQuestion");
			String sectionDesc = request.getParameter("sectionDesc");
			
			// set values
			TblSurvey tblSurvey1 = new TblSurvey();
			tblSurvey1.setQuestion(addQuestion);
			tblSurvey1.setSurveyDescription(sectionDesc);
			// save image
			try {
				Blob imageBlob = Hibernate.createBlob(file.getInputStream());				
				//tblSectionType.setSectionTypeImage(imageBlob);
				tblSurvey1.setSurveyImage(imageBlob);
						
			
			//user
			 TblUsers tblUsers = new TblUsers();
		        List<TblUsers> user = userBusiness.getAllUser();
		        
		        //take a list for saving just user ids
		        List<Integer> user2 = new ArrayList<Integer>();
		        
		        for (TblUsers tblUsers2 : user) {
		        	user2.add(tblUsers2.getUserId());
				}
		        
		        //save the last user id in an integer variable
		        int lastUserId = user2.get(user2.size() - 1);
		        //System.out.println("last user id " + lastUserId);
		        tblUsers.setUserId(lastUserId);
		        
		        // save user to survey table
		        tblSurvey1.setTblUsers(tblUsers);
		      
		    //study
				TblStudy tblStudy = new TblStudy();
				List<TblStudy> studies = studyBusiness.getAllStudies();
				
				//take a list for saving just study ids
				List<Integer> study2 = new ArrayList<Integer>();
				
				for (TblStudy tblStudy2 : studies) {
					study2.add(tblStudy2.getStudyId());
				}
				
				//save the last study id in an integer variable
		        int lastStudyId = study2.get(study2.size() - 1);
				tblStudy.setStudyId(lastStudyId);
				
				// save study to survey table
				tblSurvey1.setTblStudy(tblStudy);
				
			//module 
				TblModules tblModules = new TblModules();
		            List<TblModules> module = moduleBusiness.getAllModules();
		            
		            	//take a list for saving just user ids
		            	List<Integer> module2 = new ArrayList<Integer>();
		            
		            	for (TblModules tblModules2 : module) {
		            		module2.add(tblModules2.getModuleId());
		            	}
		            
		            	//	save the last user id in an integer variable
		            	int lastModuleId = module2.get(module2.size() - 1);
		            	//set this last id to module bean
		            	tblModules.setModuleId(lastModuleId);
		            	// save module to survey table
						tblSurvey1.setTblModules(tblModules);
		          
		     //section
		        TblSection tblSections = new TblSection();
		        
		        List<TblSection> section = sectionDAO.getAllSection();
		        
		        	// take a list for saving just sectionIds
		        	List<Integer> section2 = new ArrayList<Integer>();
		        	
		        	for (TblSection tblSection2 : section) {
						section2.add(tblSection2.getSectionId());
					}
		        	
		        	// save the last section id in an integer vairable
		        	int lastSectionId = section2.get(section2.size() - 1);
		        	//set this last id to section bean
		        	tblSections.setSectionId(lastSectionId);
		        	
		        	// save section to survey table
					tblSurvey1.setTblSection(tblSections);
		        
		// NOW, save the tblSurvey1 into the database
					surveyDAO.saveStudy(tblSurvey1);
					System.out.println("Suvery saved in the database!!!");
					
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}	
		//return new ModelAndView("success");//will redirect to viewemp request mapping
			//return new ModelAndView("studypage");
			return new ModelAndView("redirect:/studies"); // it goes to StudyController and checks the studies url
    }  
	
}
