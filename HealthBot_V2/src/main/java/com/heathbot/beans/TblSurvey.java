package com.heathbot.beans;

import static javax.persistence.GenerationType.IDENTITY;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_survey", catalog = "healthbot")
public class TblSurvey implements java.io.Serializable {

	private Integer surveyId;
	private String question;
	private Blob surveyImage;
	private String surveyDescription;
	private TblUsers tblUsers;
	private TblStudy tblStudy;
	private TblModules tblModules;
	private TblSection tblSection;
	
	// Default constructor
	public TblSurvey(){
		
	}
	
	// All parameters constructor
	public TblSurvey(Integer surveyId, String question, Blob surveyImage,
			String surveyDescription, TblUsers tblUsers, TblStudy tblStudy,
			TblModules tblModules) {
		super();
		this.surveyId = surveyId;
		this.question = question;
		this.surveyImage = surveyImage;
		this.surveyDescription = surveyDescription;
		this.tblUsers = tblUsers;
		this.tblStudy = tblStudy;
		this.tblModules = tblModules;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "survey_id", unique = true, nullable = false)
	public Integer getSurveyId() {
		return surveyId;
	}

	public void setSurveyId(Integer surveyId) {
		this.surveyId = surveyId;
	}

	@Column(name = "question")
	public String getQuestion() {
		return question;
	}

	public void setQuestion(String question) {
		this.question = question;
	}

	@Column(name = "survey_image")
	@Lob
	public Blob getSurveyImage() {
		return surveyImage;
	}

	public void setSurveyImage(Blob surveyImage) {
		this.surveyImage = surveyImage;
	}

	@Column(name = "survey_Description", length = 65535)
	public String getSurveyDescription() {
		return surveyDescription;
	}

	public void setSurveyDescription(String surveyDescription) {
		this.surveyDescription = surveyDescription;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id", nullable = false)
	public TblUsers getTblUsers() {
		return this.tblUsers;
	}

	public void setTblUsers(TblUsers tblUsers) {
		this.tblUsers = tblUsers;
	}
	
	@ManyToOne(fetch = FetchType.LAZY, targetEntity = TblStudy.class)
	@JoinColumn(name = "study_id")
	public TblStudy getTblStudy() {
		return this.tblStudy;
	}

	public void setTblStudy(TblStudy tblStudy) {
		this.tblStudy = tblStudy;
	}
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "module_id", nullable = false)
	public TblModules getTblModules() {
		return this.tblModules;
	}

	public void setTblModules(TblModules tblModules) {
		this.tblModules = tblModules;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "section_id", nullable = false)
	public TblSection getTblSection() {
		return tblSection;
	}

	public void setTblSection(TblSection tblSection) {
		this.tblSection = tblSection;
	}

	@Override
	public String toString() {
		return "TblSurvey [surveyId=" + surveyId + ", question=" + question
				+ ", surveyImage=" + surveyImage + ", surveyDescription="
				+ surveyDescription + ", tblUsers=" + tblUsers + ", tblStudy="
				+ tblStudy + ", tblModules=" + tblModules + ", tblSection="
				+ tblSection + "]";
	}
	
}
