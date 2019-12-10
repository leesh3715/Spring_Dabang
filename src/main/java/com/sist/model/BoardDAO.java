package com.sist.model;


import java.util.List;



public interface BoardDAO {
	public List<BoardDTO> getList(int page, int rowsize, String b_head);
	public List<BoardDTO> getList(int page, int rowsize);
	public void insertBoard(BoardDTO dto);
	public void replyinsertBoard(BoardDTO dto);
	public void readCount(int b_no);
	public BoardDTO content(int b_no);
	public void updateBoard(BoardDTO dto);
	public void deleteBoard(int b_no);
	public void deleteBoard2(List<Integer> list);
	public List<BCommentsDTO> List_b_Comments(int b_no,int page, int rowsize);
	public void insert_b_Comments(BCommentsDTO dto);
	public void delete_b_Comments(int c_no);
	public void delete2_b_Comments(int c_no);
	public void update_b_Comments(BCommentsDTO dto);
	public void insert_b_replyComments(BCommentsDTO dto);
	public int delete_b_Commentscheck(int c_no);
	public BCommentsDTO b_Commentscheck(int c_group);
	public int getcount(String b_head);
	public int getcount();
	public int getSearchcount(String find_field,String find_name,String b_head);
	public int getSearchcount(String find_field,String find_name);
	public List<BoardDTO> getSearchlist(String find_field,String find_name,int page,int rowsize,String b_head);
	public List<BoardDTO> getSearchlist(String find_field,String find_name,int page,int rowsize);
	public int b_Comments_count(int b_no);
	public BoardDTO b_next_Board(int b_group);
	public BoardDTO b_pre_Board(int b_group);
	public BoardDTO b_next_Board(int b_group,String b_head);
	public BoardDTO b_pre_Board(int b_group,String b_head);
	public void replyupdate(BoardDTO dto);
	public void replyupdate2(BoardDTO dto);
	public String replycheck(BoardDTO dto);
	public int groupcount(int b_group);
	public List<BoardDTO> groupList(int b_group);
	/*
	 * public String nextcheck(BoardDTO dto); public String precheck(BoardDTO
	 * dto);
	 */
}
