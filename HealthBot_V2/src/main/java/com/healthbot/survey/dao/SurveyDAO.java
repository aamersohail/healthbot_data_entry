package com.healthbot.survey.dao;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.heathbot.beans.TblSurvey;

public class SurveyDAO {
	
	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	//save survey
	public int saveStudy(TblSurvey tblSurvey){
	//System.out.println("In Dao" + tblStudy.getStudyDesc() + " D1 " + tblStudy.getStartDate() + " D2 " + tblStudy.getEndDate());		
		int saveSurvey = (Integer) hibernateTemplate.save(tblSurvey);
	return saveSurvey;
			}
		

}
