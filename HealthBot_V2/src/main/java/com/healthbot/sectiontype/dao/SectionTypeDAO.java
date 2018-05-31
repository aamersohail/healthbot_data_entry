package com.healthbot.sectiontype.dao;

import org.springframework.orm.hibernate3.HibernateTemplate;

import com.heathbot.beans.TblSectionType;

public class SectionTypeDAO {

	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
		//save SectionType
			public int saveSectionType(TblSectionType sectionType){
				int sectionTypeId = (Integer) hibernateTemplate.save(sectionType);
			return sectionTypeId;
			}
	
}
