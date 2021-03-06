package com.heathbot.beans;
// Generated Jan 18, 2018 5:18:56 PM by Hibernate Tools 3.4.0.CR1

import java.sql.Blob;
import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Lob;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * TblSectionType generated by hbm2java
 */
@Entity
@Table(name = "tbl_section_type", catalog = "healthbot")
public class TblSectionType implements java.io.Serializable {

	private Integer sectionTypeId;
	private Blob sectionTypeImage;
	private Blob sectionTypeVideo;
	private String sectionTypeText;
	private Set<TblSection> tblSections = new HashSet<TblSection>(0);

	// constructor
	public TblSectionType() {
	}

	// constructor with fields
	public TblSectionType(Integer sectionTypeId, Blob sectionTypeImage,
			Blob sectionTypeVideo, String sectionTypeText,
			Set<TblSection> tblSections) {
		super();
		this.sectionTypeId = sectionTypeId;
		this.sectionTypeImage = sectionTypeImage;
		this.sectionTypeVideo = sectionTypeVideo;
		this.sectionTypeText = sectionTypeText;
		this.tblSections = tblSections;
	}
	
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "section_type_id", unique = true, nullable = false)
	public Integer getSectionTypeId() {
		return this.sectionTypeId;
	}
	
	public void setSectionTypeId(Integer sectionTypeId) {
		this.sectionTypeId = sectionTypeId;
	}

	@Column(name = "section_type_image")
	@Lob
	public Blob getSectionTypeImage() {
		return sectionTypeImage;
	}

	public void setSectionTypeImage(Blob sectionTypeImage) {
		this.sectionTypeImage = sectionTypeImage;
	}
	
	@Column(name = "section_type_video")
	@Lob
	public Blob getSectionTypeVideo() {
		return this.sectionTypeVideo;
	}

	public void setSectionTypeVideo(Blob sectionTypeVideo) {
		this.sectionTypeVideo = sectionTypeVideo;
	}

	@Column(name = "section_type_text", length = 65535)
	public String getSectionTypeText() {
		return this.sectionTypeText;
	}

	public void setSectionTypeText(String sectionTypeText) {
		this.sectionTypeText = sectionTypeText;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "tblSectionType")
	public Set<TblSection> getTblSections() {
		return this.tblSections;
	}

	public void setTblSections(Set<TblSection> tblSections) {
		this.tblSections = tblSections;
	}

	// To string 
	@Override
	public String toString() {
		return "TblSectionType [sectionTypeId=" + sectionTypeId
				+ ", sectionTypeImage=" + sectionTypeImage
				+ ", sectionTypeVideo=" + sectionTypeVideo
				+ ", sectionTypeText=" + sectionTypeText + ", tblSections="
				+ tblSections + "]";
	}	
	
}
