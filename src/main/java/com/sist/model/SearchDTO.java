package com.sist.model;

public class SearchDTO {
	
    private int s_startNo;
    private int s_endNo;
    private String find_field;
    private String find_name;
    
	public int getS_startNo() {
		return s_startNo;
	}
	public void setS_startNo(int s_startNo) {
		this.s_startNo = s_startNo;
	}
	public int getS_endNo() {
		return s_endNo;
	}
	public void setS_endNo(int s_endNo) {
		this.s_endNo = s_endNo;
	}
	public String getFind_field() {
		return find_field;
	}
	public void setFind_field(String find_field) {
		this.find_field = find_field;
	}
	public String getFind_name() {
		return find_name;
	}
	public void setFind_name(String find_name) {
		this.find_name = find_name;
	}
	
}