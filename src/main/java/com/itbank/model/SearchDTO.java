package com.itbank.model;

import java.util.List;

public class SearchDTO {
	// 기본 검색을 위한 파라미터
	private String sido = "";
	private String gungu = "";
	private String keyword = "";
	private String lctcl = "";
	
	// 상세검색을 위한 파라미터
	private List<String> dtl_sido;
	private List<String> facltDivNm;
	private List<String> dtl_lctcl;
	private List<String> induty;
	private List<String> sbrsCl;
	private List<String> themaEnvrnCl;
	private String trlerAcmpnyAt;
	private String caravAcmpnyAt;
	private String animalCmgCl;
	
	public List<String> getThemaEnvrnCl() {
		return themaEnvrnCl;
	}
	public void setThemaEnvrnCl(List<String> themaEnvrnCl) {
		this.themaEnvrnCl = themaEnvrnCl;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGungu() {
		return gungu;
	}
	public void setGungu(String gungu) {
		this.gungu = gungu;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getLctcl() {
		return lctcl;
	}
	public void setLctcl(String lctcl) {
		this.lctcl = lctcl;
	}
	public List<String> getDtl_sido() {
		return dtl_sido;
	}
	public void setDtl_sido(List<String> dtl_sido) {
		this.dtl_sido = dtl_sido;
	}
	public List<String> getFacltDivNm() {
		return facltDivNm;
	}
	public void setFacltDivNm(List<String> facltDivNm) {
		this.facltDivNm = facltDivNm;
	}
	public List<String> getDtl_lctcl() {
		return dtl_lctcl;
	}
	public void setDtl_lctcl(List<String> dtl_lctcl) {
		this.dtl_lctcl = dtl_lctcl;
	}
	public List<String> getInduty() {
		return induty;
	}
	public void setInduty(List<String> induty) {
		this.induty = induty;
	}
	public List<String> getSbrsCl() {
		return sbrsCl;
	}
	public void setSbrsCl(List<String> sbrsCl) {
		this.sbrsCl = sbrsCl;
	}
	public String getTrlerAcmpnyAt() {
		return trlerAcmpnyAt;
	}
	public void setTrlerAcmpnyAt(String trlerAcmpnyAt) {
		this.trlerAcmpnyAt = trlerAcmpnyAt;
	}
	public String getCaravAcmpnyAt() {
		return caravAcmpnyAt;
	}
	public void setCaravAcmpnyAt(String caravAcmpnyAt) {
		this.caravAcmpnyAt = caravAcmpnyAt;
	}
	public String getAnimalCmgCl() {
		return animalCmgCl;
	}
	public void setAnimalCmgCl(String animalCmgCl) {
		this.animalCmgCl = animalCmgCl;
	}
	
}
