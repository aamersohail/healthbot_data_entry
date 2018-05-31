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
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.healthbot.module.business.ModuleBusiness;
import com.healthbot.module.dao.ModuleDAO;
import com.healthbot.section.dao.SectionDAO;
import com.healthbot.sectiontype.dao.SectionTypeDAO;
import com.heathbot.beans.TblModules;
import com.heathbot.beans.TblSection;
import com.heathbot.beans.TblSectionType;
import com.heathbot.beans.TblStudy;
import com.heathbot.beans.TblUsers;

@Controller
public class SectionTypeController {

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


	// I am directly saving data from controller to dao. ignoring the business classes
	@Autowired
	@Qualifier("sectionTypeDAO")
	SectionTypeDAO sectionTypeDAO;
	
	public SectionTypeDAO getSectionTypeDAO() {
		return sectionTypeDAO;
	}

	public void setSectionTypeDAO(SectionTypeDAO sectionTypeDAO) {
		this.sectionTypeDAO = sectionTypeDAO;
	}

	@RequestMapping("/sectionTypeform")
	public ModelAndView showSectionForm() {
		return new ModelAndView("section-forms", "command", new TblSectionType());

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

	//save method
	@RequestMapping(value = "/savesectiontype", method = RequestMethod.POST)
	public ModelAndView save(Model model, HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("tblSectionType") TblSectionType tblSectionType,
			@RequestParam("file") MultipartFile file, @RequestParam("videoFile") MultipartFile videoFile) {
		
		// read the form values
		String sectionName = request.getParameter("sectionName");
		int sectionOrder = Integer.parseInt(request.getParameter("sectionOrder"));
		String sectionDesc = request.getParameter("sectionDesc");
			try {
				
				// save image
				Blob imageBlob = Hibernate.createBlob(file.getInputStream());				
				tblSectionType.setSectionTypeImage(imageBlob);
				
				
				// save video
				Blob videoBlob = Hibernate.createBlob(videoFile.getInputStream());
				tblSectionType.setSectionTypeVideo(videoBlob);
			
				// save text area
				String textFile = request.getParameter("textFile");
				tblSectionType.setSectionTypeText(textFile);
				
				} catch (IOException e) {
					e.printStackTrace();
				}
		try {
			
			TblSection tblSection = new TblSection();
			int sectionTypeId =  sectionTypeDAO.saveSectionType(tblSectionType);
			tblSectionType.setSectionTypeId(sectionTypeId);
			
			// now set sectionTypeId FK into the tblSection table
			tblSection.setTblSectionType(tblSectionType);
           
         // set tblSectionType into the tblSection table
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
            	
            	
            // get last id of module table and set it to section table
            	
            	tblSection.setTblModules(tblModules);
            
            // set all the section parameters into the section table 
            	tblSection.setSectionName(sectionName);
            	tblSection.setSectionOrder(sectionOrder);
            	tblSection.setSectionDescription(sectionDesc);
            	
            	// now save the tblSection into the database
            	int saveSectionId = sectionDAO.saveSection(tblSection);
            	
         } catch(Exception e) {
			e.printStackTrace();
		}
		return new ModelAndView("survey-forms");
	}	
}
