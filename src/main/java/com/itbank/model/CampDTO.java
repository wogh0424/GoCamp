package com.itbank.model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class CampDTO {
	// 멀티파일
	private List<MultipartFile> featureImages;
	private List<String> imageSrc;
	
	// 대표이미지
	private MultipartFile imageFile;
	private String firstImageUrl;
	
	// 파라미터 하나
	private String contentId;
	private String facltNm;
	private String lineIntro;
	private String intro;
	private String featureNm;
	private String tel;
	private String homepage;
	private String tooltip;
	private String direction;
	private String sitedStnc = "0";
	
	// 주소관련
	private String doNm;
	private String sigunguNm;
	private String addr1;
	private String mapX;
	private String mapY;
	
	// 체크되지 않으면 N 값을 넣음
	private String trlerAcmpnyAt = "N";
	private String caravAcmpnyAt = "N";
	private String exprnProgrmAt = "N";
	private String clturEventAt = "N";
	
	// 선택이 하나
	private String brazierCl;
	private String animalCmgCl;
	private String facltDivNm;
	
	// textarea
	private String sbrsEtc;
	private String posblFcltyEtc;
	
	// 선택이 중복 가능
	private List<String> lctcl = null;
	private List<String> operPdcl;
	private List<String> operDecl;
	private List<String> resveCl;
	private List<String> induty;
	private List<String> sbrsCl;
	private List<String> themaEnvrnCl;
	private List<String> eqpmnLendCl;
	private List<String> posblFcltyCl;
	private List<String> tag;
	
	public List<MultipartFile> getFeatureImages() {
		return featureImages;
	}
	public void setFeatureImages(List<MultipartFile> featureImages) {
		this.featureImages = featureImages;
	}
	public List<String> getImageSrc() {
		return imageSrc;
	}
	public void setImageSrc(List<String> imageSrc) {
		this.imageSrc = imageSrc;
	}
	public String getBrazierCl() {
		return brazierCl;
	}
	public void setBrazierCl(String brazierCl) {
		this.brazierCl = brazierCl;
	}
	public String getSbrsEtc() {
		return sbrsEtc;
	}
	public void setSbrsEtc(String sbrsEtc) {
		this.sbrsEtc = sbrsEtc;
	}
	public String getPosblFcltyEtc() {
		return posblFcltyEtc;
	}
	public void setPosblFcltyEtc(String posblFcltyClEtc) {
		this.posblFcltyEtc = posblFcltyClEtc;
	}
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	public String getFirstImageUrl() {
		return firstImageUrl;
	}
	public void setFirstImageUrl(String firstImageUrl) {
		this.firstImageUrl = firstImageUrl;
	}
	public String getContentId() {
		return contentId;
	}
	public void setContentId(String contentId) {
		this.contentId = contentId;
	}
	public String getFacltNm() {
		return facltNm;
	}
	public void setFacltNm(String facltNm) {
		this.facltNm = facltNm;
	}
	public String getLineIntro() {
		return lineIntro;
	}
	public void setLineIntro(String lineIntro) {
		this.lineIntro = lineIntro;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
	public String getFeatureNm() {
		return featureNm;
	}
	public void setFeatureNm(String featureNm) {
		this.featureNm = featureNm;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getHomepage() {
		return homepage;
	}
	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}
	public String getTooltip() {
		return tooltip;
	}
	public void setTooltip(String tooltip) {
		this.tooltip = tooltip;
	}
	public String getDirection() {
		return direction;
	}
	public void setDirection(String direction) {
		this.direction = direction;
	}
	public String getSitedStnc() {
		return sitedStnc;
	}
	public void setSitedStnc(String sitedStnc) {
		this.sitedStnc = sitedStnc;
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
	public String getExprnProgrmAt() {
		return exprnProgrmAt;
	}
	public void setExprnProgrmAt(String exprnProgrmAt) {
		this.exprnProgrmAt = exprnProgrmAt;
	}
	public String getClturEventAt() {
		return clturEventAt;
	}
	public void setClturEventAt(String clturEventAt) {
		this.clturEventAt = clturEventAt;
	}
	public String getAnimalCmgCl() {
		return animalCmgCl;
	}
	public void setAnimalCmgCl(String animalCmgCl) {
		this.animalCmgCl = animalCmgCl;
	}
	public String getFacltDivNm() {
		return facltDivNm;
	}
	public void setFacltDivNm(String facltDivNm) {
		this.facltDivNm = facltDivNm;
	}
	public List<String> getLctcl() {
		return lctcl;
	}
	public void setLctcl(List<String> lctcl) {
		this.lctcl = lctcl;
	}
	public List<String> getOperPdcl() {
		return operPdcl;
	}
	public void setOperPdcl(List<String> operPdcl) {
		this.operPdcl = operPdcl;
	}
	public List<String> getOperDecl() {
		return operDecl;
	}
	public void setOperDecl(List<String> operDecl) {
		this.operDecl = operDecl;
	}
	public List<String> getResveCl() {
		return resveCl;
	}
	public void setResveCl(List<String> resveCl) {
		this.resveCl = resveCl;
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
	public List<String> getThemaEnvrnCl() {
		return themaEnvrnCl;
	}
	public void setThemaEnvrnCl(List<String> themaEnvrnCl) {
		this.themaEnvrnCl = themaEnvrnCl;
	}
	public List<String> getEqpmnLendCl() {
		return eqpmnLendCl;
	}
	public void setEqpmnLendCl(List<String> eqpmnLendCl) {
		this.eqpmnLendCl = eqpmnLendCl;
	}
	public List<String> getPosblFcltyCl() {
		return posblFcltyCl;
	}
	public void setPosblFcltyCl(List<String> posblFcltyCl) {
		this.posblFcltyCl = posblFcltyCl;
	}
	public List<String> getTag() {
		return tag;
	}
	public void setTag(List<String> tag) {
		this.tag = tag;
	}
	public String getDoNm() {
		return doNm;
	}
	public void setDoNm(String doNm) {
		this.doNm = doNm;
	}
	public String getSigunguNm() {
		return sigunguNm;
	}
	public void setSigunguNm(String sigunguNm) {
		this.sigunguNm = sigunguNm;
	}
	public String getAddr1() {
		return addr1;
	}
	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}
	public String getMapX() {
		return mapX;
	}
	public void setMapX(String mapX) {
		this.mapX = mapX;
	}
	public String getMapY() {
		return mapY;
	}
	public void setMapY(String mapY) {
		this.mapY = mapY;
	}
	
	
}
