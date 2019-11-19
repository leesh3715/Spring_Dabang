package com.sist.model;

import java.util.List;



public interface ShareeDAO {
	public List<ShareeDTO> getList(int page, int rowsize);
	public void insertBoard(ShareeDTO dto);
	public void replyinsertBoard(ShareeDTO dto);
	public void readCount(int s_no);
	public ShareeDTO content(int s_no);
	public void updateBoard(ShareeDTO dto);
	public void deleteBoard(int s_no);
	public List<ShareeDTO> search(String field, String name);
	public List<CommentsDTO> List_s_Comments(int s_no);
	public void insert_s_Comments(CommentsDTO dto);
	public void delete_s_Comments(int c_no);
	public void delete2_s_Comments(int c_no);
	public void update_s_Comments(CommentsDTO dto);
	public void insert_s_replyComments(CommentsDTO dto);
	public int delete_s_Commentscheck(int c_no);
	public CommentsDTO s_Commentscheck(int c_group);
	public int getcount();
	public int getSearchcount(String find_field,String find_name);
	public List<ShareeDTO> getSearchlist(String find_field,String find_name,int page,int rowsize);
	public int S_Comments_count(int s_no);
	public ShareeDTO S_next_Board(int s_no);
	public ShareeDTO S_pre_Board(int s_no);
	
}
