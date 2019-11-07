package com.sist.model;

public class CommentsDTO {
	private int c_no; 
	private int s_no; 
	private String c_id;
	private String c_replyid; 
	private String c_cont; 
	private String c_date; 
	private int c_group; 
	private int c_step; 
	private int c_indent;
	private int c_check1;
	
	
	
	public String getC_replyid() {
		return c_replyid;
	}
	public void setC_replyid(String c_replyid) {
		this.c_replyid = c_replyid;
	}
	public int getC_check1() {
		return c_check1;
	}
	public void setC_check1(int c_check1) {
		this.c_check1 = c_check1;
	}
	public int getC_no() {
		return c_no;
	}
	public void setC_no(int c_no) {
		this.c_no = c_no;
	}
	public int getS_no() {
		return s_no;
	}
	public void setS_no(int s_no) {
		this.s_no = s_no;
	}
	public String getC_id() {
		return c_id;
	}
	public void setC_id(String c_id) {
		this.c_id = c_id;
	}
	public String getC_cont() {
		return c_cont;
	}
	public void setC_cont(String c_cont) {
		this.c_cont = c_cont;
	}
	public String getC_date() {
		return c_date;
	}
	public void setC_date(String c_date) {
		this.c_date = c_date;
	}
	public int getC_group() {
		return c_group;
	}
	public void setC_group(int c_group) {
		this.c_group = c_group;
	}
	public int getC_step() {
		return c_step;
	}
	public void setC_step(int c_step) {
		this.c_step = c_step;
	}
	public int getC_indent() {
		return c_indent;
	}
	public void setC_indent(int c_indent) {
		this.c_indent = c_indent;
	} 
	
}
