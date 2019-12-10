package com.sist.model;

public class REPLYDTO {
	
	private int reply_no;
	private String reply_cont;
	private String reply_writer;
	private String reply_regdate;
	private String reply_pwd;
	private int myqna_reanswer;
				
	
	public String getReply_pwd() {
		return reply_pwd;
	}
	public void setReply_pwd(String reply_pwd) {
		this.reply_pwd = reply_pwd;
	}
	public int getReply_no() {
		return reply_no;
	}
	public void setReply_no(int reply_no) {
		this.reply_no = reply_no;
	}
	public String getReply_cont() {
		return reply_cont;
	}
	public void setReply_cont(String reply_cont) {
		this.reply_cont = reply_cont;
	}
	public String getReply_writer() {
		return reply_writer;
	}
	public void setReply_writer(String reply_writer) {
		this.reply_writer = reply_writer;
	}
	public String getReply_regdate() {
		return reply_regdate;
	}
	public void setReply_regdate(String reply_regdate) {
		this.reply_regdate = reply_regdate;
	}
	public int getMyqna_reanswer() {
		return myqna_reanswer;
	}
	public void setMyqna_reanswer(int myqna_reanswer) {
		this.myqna_reanswer = myqna_reanswer;
	}
	
	
}
