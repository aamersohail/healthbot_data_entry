package com.healthbot.module.dao;

import java.util.List;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.heathbot.beans.TblModules;
import com.heathbot.beans.TblStudy;
import com.heathbot.study.business.StudyBusiness;

public class Client {
	
	public static void main(String[] args) {
		
		ApplicationContext context = new ClassPathXmlApplicationContext("healthbot-spring.cfg.xml");
		StudyBusiness studyBusiness = (StudyBusiness) context.getBean("studyBusiness");
		List<TblStudy> studyList = studyBusiness.getAllStudies();
		studyBusiness.getSingleStudy(3);
		
		System.out.println("---");
		ModuleDAO moduleDAO = (ModuleDAO) context.getBean("moduleDAO");
		TblModules tblModules = moduleDAO.getModuleIds(2);
		//moduleDAO.getAllModules();
		System.out.println(tblModules.getGoals());
		
		//moduleDAO.getModuleIds2(2);
		
		//moduleDAO.getAllModulessss();
		
	}

}
