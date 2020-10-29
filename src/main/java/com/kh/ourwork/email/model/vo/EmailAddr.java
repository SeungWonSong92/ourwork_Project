package com.kh.ourwork.email.model.vo;

import java.util.Date;

public class EmailAddr {
	private String eId;
	private int dId;
	private int rId;
	private String ePwd;
	private String eName;
	private String email;
	private String phone;
	private String address;
	private int salary;
	private Date joinDate;
	private Date leaveDate;
	private String status;
	private int holiday;
	private String eBirth;
	private String rName;
	private String dName;
	private int rNum;
	
	public EmailAddr() {}

	public EmailAddr(String eId, int dId, int rId, String ePwd, String eName, String email, String phone,
			String address, int salary, Date joinDate, Date leaveDate, String status, int holiday, String eBirth,
			String rName, String dName, int rNum) {
		super();
		this.eId = eId;
		this.dId = dId;
		this.rId = rId;
		this.ePwd = ePwd;
		this.eName = eName;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.salary = salary;
		this.joinDate = joinDate;
		this.leaveDate = leaveDate;
		this.status = status;
		this.holiday = holiday;
		this.eBirth = eBirth;
		this.rName = rName;
		this.dName = dName;
		this.rNum = rNum;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public int getdId() {
		return dId;
	}

	public void setdId(int dId) {
		this.dId = dId;
	}

	public int getrId() {
		return rId;
	}

	public void setrId(int rId) {
		this.rId = rId;
	}

	public String getePwd() {
		return ePwd;
	}

	public void setePwd(String ePwd) {
		this.ePwd = ePwd;
	}

	public String geteName() {
		return eName;
	}

	public void seteName(String eName) {
		this.eName = eName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public Date getJoinDate() {
		return joinDate;
	}

	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}

	public Date getLeaveDate() {
		return leaveDate;
	}

	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getHoliday() {
		return holiday;
	}

	public void setHoliday(int holiday) {
		this.holiday = holiday;
	}

	public String geteBirth() {
		return eBirth;
	}

	public void seteBirth(String eBirth) {
		this.eBirth = eBirth;
	}

	public String getrName() {
		return rName;
	}

	public void setrName(String rName) {
		this.rName = rName;
	}

	public String getdName() {
		return dName;
	}

	public void setdName(String dName) {
		this.dName = dName;
	}

	public int getrNum() {
		return rNum;
	}

	public void setrNum(int rNum) {
		this.rNum = rNum;
	}

	@Override
	public String toString() {
		return "EmailAddr [eId=" + eId + ", dId=" + dId + ", rId=" + rId + ", ePwd=" + ePwd + ", eName=" + eName
				+ ", email=" + email + ", phone=" + phone + ", address=" + address + ", salary=" + salary
				+ ", joinDate=" + joinDate + ", leaveDate=" + leaveDate + ", status=" + status + ", holiday=" + holiday
				+ ", eBirth=" + eBirth + ", rName=" + rName + ", dName=" + dName + ", rNum=" + rNum + "]";
	}

	
	
	
}
