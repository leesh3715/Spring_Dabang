package com.sist.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class ShareeDAOimpl implements ShareeDAO {

	@Autowired
	private SqlSessionTemplate SqlSession;
	
	@Override
	public int getcount() {
		// TODO Auto-generated method stub
		
		return this.SqlSession.selectOne("s_countlist");
	}
	
	@Override
	public List<ShareeDTO> getList(int page, int rowsize) {
		// TODO Auto-generated method stub
		// 해당 페이지의 시작 글 번호
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);
		SearchDTO dto = new SearchDTO();
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		return this.SqlSession.selectList("s_list",dto);
	}
	
	@Override
	public int S_Comments_count(int s_no) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("s_comments_count",s_no);
	}
	
	@Override
	public void readCount(int s_no) {
		// TODO Auto-generated method stub
		this.SqlSession.update("s_count",s_no);
	}
	
	@Override
	public ShareeDTO content(int s_no) {
		
		return this.SqlSession.selectOne("s_cont", s_no);
	}
	
	
	@Override
	public void insertBoard(ShareeDTO dto) {
		this.SqlSession.insert("s_add",dto);
		 
	}
	

	@Override
	public void replyinsertBoard(ShareeDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("s_replyup",dto);
		this.SqlSession.insert("s_replyadd",dto);
	}
	
	@Override
	public void deleteBoard(int s_no) {
		// TODO Auto-generated method stub
		this.SqlSession.delete("s_delete",s_no);
		
	}
	
	@Override
	public void deleteBoard2(List<Integer> list) {
		// TODO Auto-generated method stub
		this.SqlSession.delete("s_delete2",list);
	}
	
	@Override
	public void updateBoard(ShareeDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("s_update",dto);
	}
	
	
	@Override
	public void insert_s_Comments(CommentsDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.insert("c_add",dto);
	}
	
	@Override
	public List<CommentsDTO> List_s_Comments(int s_no,int page, int rowsize) {
		// TODO Auto-generated method stub
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);

		SearchDTO dto = new SearchDTO();
		System.out.println(s_no);
		dto.setS_no(s_no);
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		return this.SqlSession.selectList("c_list",dto);
	}
	
	@Override
	public void delete_s_Comments(int c_no) {
		// TODO Auto-generated method stub
		this.SqlSession.delete("c_delete",c_no);
	}
	
	@Override
	public int delete_s_Commentscheck(int c_no) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("c_deletecheck",c_no);
	}
	
	
	@Override
	public CommentsDTO s_Commentscheck(int c_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("c_check",c_group);
	}
	
	@Override
	public void delete2_s_Comments(int c_no) {
		// TODO Auto-generated method stub
		this.SqlSession.update("c_delete2",c_no);
	}
	
	@Override
	public void update_s_Comments(CommentsDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("c_update",dto);
	}

	@Override
	public void insert_s_replyComments(CommentsDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.insert("c_radd",dto);
	}
	
	

	

	

	
	@Override
	public List<ShareeDTO> search(String field, String name) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getSearchcount(String find_field, String find_name) {
		// TODO Auto-generated method stub
		if(find_field.equals("title")){
			return this.SqlSession.selectOne("s_titlecount",find_name);
		}else if(find_field.equals("cont")){
			return this.SqlSession.selectOne("s_contentcount",find_name);
		}else if(find_field.equals("title_cont")){
			return this.SqlSession.selectOne("s_title_contcount",find_name);
		}else{
			return this.SqlSession.selectOne("s_writercount",find_name);			
		}
	}

	@Override
	public List<ShareeDTO> getSearchlist(String find_field, String find_name, int page, int rowsize) {
		// TODO Auto-generated method stub
		int startNo = ((page - 1) * rowsize) + 1;
		// 해당 페이지의 끝 글번호
		int endNo = (page * rowsize);
		SearchDTO dto = new SearchDTO();
		dto.setS_startNo(startNo);
		dto.setS_endNo(endNo);
		dto.setFind_name(find_name);
		if(find_field.equals("title")){
			return this.SqlSession.selectList("s_title",dto);
		}else if(find_field.equals("cont")){
			return this.SqlSession.selectList("s_content",dto);
		}else if(find_field.equals("title_cont")){
			return this.SqlSession.selectList("s_title_cont",dto);
		}else{
			return this.SqlSession.selectList("s_writer",dto);			
		}
	}

	@Override
	public ShareeDTO S_next_Board(int s_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("s_next",s_group);
	}

	@Override
	public ShareeDTO S_pre_Board(int s_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("s_pre",s_group);
	}

	@Override
	public void replyupdate(ShareeDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("s_replyupdate",dto);
	}

	@Override
	public void replyupdate2(ShareeDTO dto) {
		// TODO Auto-generated method stub
		this.SqlSession.update("s_replyupdate2",dto);
	}

	@Override
	public String replycheck(ShareeDTO dto) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("s_replycheck",dto);
	}

	@Override
	public int groupcount(int s_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectOne("s_groupcount",s_group);
	}

	@Override
	public List<ShareeDTO> groupList(int s_group) {
		// TODO Auto-generated method stub
		return this.SqlSession.selectList("s_grouplist",s_group);
	}

	




	


	

	

	

	

	

	

}
