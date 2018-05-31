package com.healthbot.module.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.orm.hibernate3.HibernateTemplate;
import org.springframework.transaction.annotation.Transactional;

import com.heathbot.beans.TblModules;
public class ModuleDAO {

	//using private SessionFactory sessionFactory; for fetching the specfic record from the database
	/*@Autowired
	@Qualifier("sessionFactory")*/
	private SessionFactory sessionFactory;
	
	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	HibernateTemplate hibernateTemplate;

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}
	
	// save study
	public int saveModule(TblModules tblModules) {
		int saveModule = (Integer) hibernateTemplate.save(tblModules);
		return saveModule;
	}

	//	Fetch all Modules
	public List<TblModules> getAllModules(){
		List<TblModules> moduleList = hibernateTemplate.loadAll(TblModules.class);
			return moduleList;
		}
	
	// fetch the get the module ids from module table using the study id as a FK
	
	public TblModules getModuleIds(int studyId)  {
		
		List list = getHibernateTemplate().find("from TblModules where moduleId=?", studyId);
		
        return (TblModules) list.get(0);
    }
	
	public List<TblModules> getModuleIds2(int studyId)  {
		
		List list = getHibernateTemplate().find("select moduleId, moduleDesc, moduleTitle from TblModules where moduleId=?", studyId);
		
		
		
			System.out.println(list.get(0));
			System.out.println(list.get(1));
			System.out.println(list.get(2));
		
		
        return null;
    }
	
	
	
	@Transactional
	public List<TblModules> getAllModulessss(){
		
		System.out.println("in dao");
		Session session = sessionFactory.getCurrentSession();
		//Session session = sessionFactory.openSession();
		/*Query query = session.createQuery("select modulefrom TblModules where moduleId= :id");
		query.setLong("id", 3);
		TblModules tblModulesList = (TblModules) query.uniqueResult();
		System.out.println("THIS is : " + tblModulesList.getModuleTitle());*/
		
		List<Object> list = session.createQuery("select TblModules modulefrom.moduleId TblModules where moduleId= :id").list();
		
		List<TblModules> list2 = new ArrayList<TblModules>();
		
		for (Object object : list) {
			Object[] result = (Object[]) object;
			System.out.println(result[0]);
		}
		
		
		
		
		
		
		
		
		
		return null;
	}
	
	
	
	
}
