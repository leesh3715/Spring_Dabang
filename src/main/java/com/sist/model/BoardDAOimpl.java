package com.sist.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class BoardDAOimpl implements BoardDAO {

	@Autowired
	private SqlSessionTemplate SqlSession;
	
	@Override
	public int getcount(String b_head) {
		// TODO Auto-generated method stub
		
		return this.SqlSession.selectOne("b_countlist",b_head);
	}
	@Override
	public int getcount() {
		// TODO Auto-generated method stub
		String b_head="공지사항";
		return this.SqlSession.selectOne("b_countlist2",b_head);
	}
	
	@Override
	public List<BoardDTO> getList(int page, int rowsize, String b_head) {
		// TODO Auto-generated method stub
		// 해당 페이지의 시작 글 번호
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);
		SearchDTO dto = new SearchDTO();
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		dto.setB_head(b_head);
		return this.SqlSession.selectList("b_list",dto);
	}
	@Override
	public List<BoardDTO> getList(int page, int rowsize) {
		// TODO Auto-generated method stub
		// 해당 페이지의 시작 글 번호
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);
		SearchDTO dto = new SearchDTO();
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		dto.setB_head("공지사항");
		return this.SqlSession.selectList("b_list2",dto);
	}
	
	@Override
	public int b_Comments_count(int b_no) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("b_Comments_count",b_no);
	}
	
	@Override
	public void readCount(int b_no) {
		// TODO Auto-generated method stub
		this.SqlSession.update("b_count",b_no);
	}
	
	@Override
	public BoardDTO content(int b_no) {
		
		return this.SqlSession.selectOne("b_cont", b_no);
	}
	
	
	@Override
	public void insertBoard(BoardDTO dto) {
		this.SqlSession.insert("b_add",dto);
		 
	}
	

	@Override
	public void replyinsertBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		System.out.println("1");
		this.SqlSession.update("b_replyup",dto);
		System.out.println("2");
		System.out.println(dto.getB_head());
		this.SqlSession.insert("b_replyadd",dto);
	}
	
	@Override
	public void deleteBoard(int b_no) {
		// TODO Auto-generated method stub
		this.SqlSession.delete("b_delete",b_no);
		
	}
	
	@Override
	public void deleteBoard2(List<Integer> list) {
		// TODO Auto-generated method stub
		this.SqlSession.delete("b_delete2",list);
	}
	
	@Override
	public void updateBoard(BoardDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("b_update",dto);
	}
	
	
	@Override
	public void insert_b_Comments(BCommentsDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.insert("bc_add",dto);
	}
	
	@Override
	public List<BCommentsDTO> List_b_Comments(int b_no,int page, int rowsize) {
		// TODO Auto-generated method stub
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);

		SearchDTO dto = new SearchDTO();

		dto.setS_no(b_no);
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		return this.SqlSession.selectList("bc_list",dto);
	}
	
	@Override
	public void delete_b_Comments(int bc_no) {
		// TODO Auto-generated method stub
		this.SqlSession.delete("bc_delete",bc_no);
	}
	
	@Override
	public int delete_b_Commentscheck(int bc_no) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("bc_deletecheck",bc_no);
	}
	
	
	@Override
	public BCommentsDTO b_Commentscheck(int bc_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("bc_check",bc_group);
	}
	
	@Override
	public void delete2_b_Comments(int bc_no) {
		// TODO Auto-generated method stub
		this.SqlSession.update("bc_delete2",bc_no);
	}
	
	@Override
	public void update_b_Comments(BCommentsDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("bc_update",dto);
	}

	@Override
	public void insert_b_replyComments(BCommentsDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.insert("bc_radd",dto);
	}
	

	@Override
	public int getSearchcount(String find_field, String find_name,String b_head) {
		SearchDTO dto = new SearchDTO();
		dto.setFind_name(find_name);
		dto.setB_head(b_head);

		// TODO Auto-generated method stub
		if(find_field.equals("title")){
			return this.SqlSession.selectOne("b_titlecount",dto);
		}else if(find_field.equals("cont")){
			return this.SqlSession.selectOne("b_contentcount",dto);
		}else if(find_field.equals("title_cont")){
			return this.SqlSession.selectOne("b_title_contcount",dto);
		}else{
			return this.SqlSession.selectOne("b_writercount",dto);			
		}
	}

	@Override
	public int getSearchcount(String find_field, String find_name) {
		SearchDTO dto = new SearchDTO();
		dto.setFind_name(find_name);

		// TODO Auto-generated method stub
		if(find_field.equals("title")){
			return this.SqlSession.selectOne("b_titlecount2",dto);
		}else if(find_field.equals("cont")){
			return this.SqlSession.selectOne("b_contentcount2",dto);
		}else if(find_field.equals("title_cont")){
			return this.SqlSession.selectOne("b_title_contcount2",dto);
		}else{
			return this.SqlSession.selectOne("b_writercount2",dto);			
		}
	}
	
	@Override
	public List<BoardDTO> getSearchlist(String find_field, String find_name, int page, int rowsize,String b_head) {
		// TODO Auto-generated method stub
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);
		SearchDTO dto = new SearchDTO();

		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		dto.setFind_name(find_name);
		dto.setB_head(b_head);
		if(find_field.equals("title")){
			return this.SqlSession.selectList("b_title",dto);
		}else if(find_field.equals("cont")){
			
			return this.SqlSession.selectList("b_content",dto);
		}else if(find_field.equals("title_cont")){
			
			return this.SqlSession.selectList("b_title_cont",dto);
		}else{
			
			return this.SqlSession.selectList("b_writer",dto);			
		}
	}
	
	@Override
	public List<BoardDTO> getSearchlist(String find_field, String find_name, int page, int rowsize) {
		// TODO Auto-generated method stub
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);
		SearchDTO dto = new SearchDTO();
		
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		dto.setFind_name(find_name);
		if(find_field.equals("title")){
			return this.SqlSession.selectList("b_title2",dto);
		}else if(find_field.equals("cont")){
			
			return this.SqlSession.selectList("b_content2",dto);
		}else if(find_field.equals("title_cont")){
			
			return this.SqlSession.selectList("b_title_cont2",dto);
		}else{
			
			return this.SqlSession.selectList("b_writer2",dto);			
		}
	}

	@Override
	public BoardDTO b_next_Board(int b_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("b_next",b_group);
	}

	@Override
	public BoardDTO b_pre_Board(int b_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("b_pre",b_group);
	}
	
	@Override
	public BoardDTO b_next_Board(int b_group,String b_head) {
		// TODO Auto-generated method stub
		BoardDTO dto = new BoardDTO();
		dto.setB_group(b_group);
		dto.setB_head(b_head);
		return this.SqlSession.selectOne("b_next2",dto);
	}

	@Override
	public BoardDTO b_pre_Board(int b_group,String b_head) {
		// TODO Auto-generated method stub
		BoardDTO dto = new BoardDTO();
		dto.setB_group(b_group);
		dto.setB_head(b_head);
		return this.SqlSession.selectOne("b_pre2",dto);
	}
	@Override
	public void replyupdate(BoardDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("b_replyupdate",dto);
	}

	@Override
	public void replyupdate2(BoardDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("b_replyupdate2",dto);
	}

	@Override
	public String replycheck(BoardDTO dto) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("b_replycheck",dto);
	}

	@Override
	public int groupcount(int b_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("b_groupcount",b_group);
	}

	@Override
	public List<BoardDTO> groupList(int b_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectList("b_grouplist",b_group);
	}

	




	


	

	

	

	

	

	

}
