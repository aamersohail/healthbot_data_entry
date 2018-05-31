package com.healthbot.survey.dao;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.heathbot.beans.TblModules;
import com.heathbot.beans.TblSection;
import com.heathbot.beans.TblStudy;
import com.heathbot.beans.TblSurvey;
import com.heathbot.beans.TblUsers;

public class Client {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("healthbot-spring.cfg.xml");
		/*StudyBusiness studyBusiness = (StudyBusiness) context.getBean("studyBusiness");
		List<TblStudy> studyList = studyBusiness.getAllStudies();
		studyBusiness.getSingleStudy(16);*/
		
		SurveyDAO surveyDAO = (SurveyDAO) context.getBean("surveyDAO");
		
		// set values
		TblSurvey tblSurvey = new TblSurvey();
		tblSurvey.setQuestion("Q1");
		tblSurvey.setSurveyDescription("surveyDescription");
		
		//user
		TblUsers tblUsers = new TblUsers();
		tblUsers.setUserId(1);
		
		//study
		TblStudy tblStudy = new TblStudy();
		tblStudy.setStudyId(1);
		
		//module 
		TblModules tblModules = new TblModules();
		tblModules.setModuleId(1);
		
		//section
		TblSection tblSection = new TblSection();
		tblSection.setSectionId(1);
		
		//set all objects
		tblSurvey.setTblUsers(tblUsers);
		tblSurvey.setTblStudy(tblStudy);
		tblSurvey.setTblModules(tblModules);
		tblSurvey.setTblSection(tblSection);
		
		surveyDAO.saveStudy(tblSurvey);
		
		System.out.println("Survey saveed - this is in Client DAO ");
	}

}
