package com.healthbot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.heathbot.beans.TblSection;

@Controller
public class SectionController {
	
	// Display section form, for filling the data first
		@RequestMapping("/showsectionform")
		public ModelAndView showmoduleform() {

			return new ModelAndView("section-form", "command", new TblSection());

		}

}
