package com.kh.ourwork.email.model.vo;

import java.util.Date;

public class Ereceiver {
	private int mId;
	private String eId;
	private int erLevel;
	private Date receiveDate;
	private String rStatus;
	
	public Ereceiver() {}

	public Ereceiver(int mId, String eId, int erLevel, Date receiveDate, String rStatus) {
		super();
		this.mId = mId;
		this.eId = eId;
		this.erLevel = erLevel;
		this.receiveDate = receiveDate;
		this.rStatus = rStatus;
	}

	public int getmId() {
		return mId;
	}

	public void setmId(int mId) {
		this.mId = mId;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public int getErLevel() {
		return erLevel;
	}

	public void setErLevel(int erLevel) {
		this.erLevel = erLevel;
	}

	public Date getReceiveDate() {
		return receiveDate;
	}

	public void setReceiveDate(Date receiveDate) {
		this.receiveDate = receiveDate;
	}

	public String getrStatus() {
		return rStatus;
	}

	public void setrStatus(String rStatus) {
		this.rStatus = rStatus;
	}

	@Override
	public String toString() {
		return "Ereceiver [mId=" + mId + ", eId=" + eId + ", erLevel=" + erLevel + ", receiveDate=" + receiveDate
				+ ", rStatus=" + rStatus + "]";
	}

	
	
	
}
