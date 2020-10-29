package com.kh.ourwork.email.model.vo;

public class SearchEmail {
	private String eId;
	private String searchValue;
	
	public SearchEmail() {}

	public SearchEmail(String eId, String searchValue) {
		super();
		this.eId = eId;
		this.searchValue = searchValue;
	}

	public String geteId() {
		return eId;
	}

	public void seteId(String eId) {
		this.eId = eId;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	@Override
	public String toString() {
		return "SearchEmail [eId=" + eId + ", searchValue=" + searchValue + "]";
	}
	
	
	
	
}
