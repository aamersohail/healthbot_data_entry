package com.healthbot.section.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.heathbot.beans.TblSection;
import com.heathbot.beans.TblStudy;

public class SectionDAO {

	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	// save section
	public int saveSection(TblSection tblSection) {
		int saveSection = (Integer) hibernateTemplate.save(tblSection);
		return saveSection;
	}
	
	//Fetch all section records
		public List<TblSection> getAllSection(){
				List<TblSection> sectionList = hibernateTemplate.loadAll(TblSection.class);
				return sectionList;
			}
			

}