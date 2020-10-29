package com.kh.ourwork.approval.model.vo;

import java.sql.Date;

public class Draft {	//기안문, 품의서, 시말서
	private String aId;
	private Date effectiveDate;
	private String dContent;

	
	public Draft() {}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public Date getEffectiveDate() {
		return effectiveDate;
	}

	public void setEffectiveDate(Date effectiveDate) {
		this.effectiveDate = effectiveDate;
	}

	public String getdContent() {
		return dContent;
	}

	public void setdContent(String dContent) {
		this.dContent = dContent;
	}

	@Override
	public String toString() {
		return "Draft [aId=" + aId + ", effectiveDate=" + effectiveDate + ", dContent=" + dContent + "]";
	}

}
