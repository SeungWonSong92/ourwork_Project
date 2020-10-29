package com.kh.ourwork.employee.model.vo;

import java.util.Date;

public class Work {
	private int wId;
	private Date wIn;
	private Date wOut;
	private String eId;
	
	public Work() {}

	public Work(int wId, Date wIn, Date wOut, String eId) {
		super();
		this.wId = wId;
		this.wIn = wIn;
		this.wOut = wOut;
		this.eId = eId;
	}

	public int getwId() {
		return wId;
	}

	public void setwId(int wId) {
		this.wId = wId;
	}

	public Date getwIn() {
		return wIn;
	}

	public void setwIn(Date wIn) {
		this.wIn = wIn;
	}

	public Date getwOut() {
		return wOut;
	}

	public void setwOut(Date wOut) {
		this.wOut = wOut;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	@Override
	public String toString() {
		return "Work [wId=" + wId + ", eId=" + eId + "]";
	}
	
	


}