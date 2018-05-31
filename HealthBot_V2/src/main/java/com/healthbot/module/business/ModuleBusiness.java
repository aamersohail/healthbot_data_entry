package com.healthbot.module.business;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.healthbot.module.dao.ModuleDAO;
import com.heathbot.beans.TblModules;
import com.heathbot.beans.TblStudy;

public class ModuleBusiness {
	
	@Autowired
	@Qualifier("moduleDAO")
	ModuleDAO moduleDAO;
	
	public ModuleDAO getModuleDAO() {
		return moduleDAO;
	}

	public void setModuleDAO(ModuleDAO moduleDAO) {
		this.moduleDAO = moduleDAO;
	}

	
	// save
	public int saveModule(TblModules tblModules){
		int moduleId = moduleDAO.saveModule(tblModules);
		return moduleId;
	}

	// get all modules
	//Fetch all study details
		public List<TblModules> getAllModules(){
			List<TblModules> moduleList = moduleDAO.getAllModules();
			return moduleList;
		}
	
}
