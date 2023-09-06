package com.itbank.model;

import java.sql.Date;

public class ReportDTO {
	private String reported_user;
	private String formattedDate;
	private String reportedReason;
	private int reportCount;
	private Date reportedDate;
	
	public String getFormattedDate() {
		return formattedDate;
	}
	public void setFormattedDate(String formattedDate) {
		this.formattedDate = formattedDate;
	}
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public String getReported_user() {
		return reported_user;
	}
	public void setReported_user(String reported_user) {
		this.reported_user = reported_user;
	}
	public Date getReportedDate() {
		return reportedDate;
	}
	public void setReportedDate(Date reportedDate) {
		this.reportedDate = reportedDate;
	}
	public String getReportedReason() {
		return reportedReason;
	}
	public void setReportedReason(String reportedReason) {
		this.reportedReason = reportedReason;
	}
}
