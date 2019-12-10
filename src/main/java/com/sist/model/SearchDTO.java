package com.sist.model;

public class SearchDTO {
	
    private int s_startNo;
    private int s_endNo;
    private String find_field;
    private String find_name;
    private int s_no; 
    private String b_head;
    private int b_no; 
    
    
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public String getB_head() {
		return b_head;
	}
	public void setB_head(String b_head) {
		this.b_head = b_head;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
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