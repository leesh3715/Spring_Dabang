package com.sist.model;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class QNADAOimpl implements QNADAO {

	@Autowired
	private SqlSessionTemplate sqlSession; 
	//데이터소스, 매퍼 있음. root-context.xml 참고	
	
	@Override
	public List<QNADTO> getList(String e_mail) {
		return this.sqlSession.selectList("qnaList", e_mail); 
		// 기본적으로 sql세션에 selectList라는 메소드 있음. 
		// 전체내용  dto로 가져와서 List에 저장해줌
		//mapper의 id를 list로 지정해주면 매칭이 됨
	}
	
	@Override
	public List<QNADTO> getList2() {
		return this.sqlSession.selectList("qnaList2"); 
		// 기본적으로 sql세션에 selectList라는 메소드 있음. 
		// 전체내용  dto로 가져와서 List에 저장해줌
		//mapper의 id를 list로 지정해주면 매칭이 됨
	}

	@Override
	public int insertBoard(QNADTO dto) {
		return this.sqlSession.insert("qnaAdd", dto);
		
	}

	@Override
	public QNADTO content(int no) {
		//하나만 가져오는 메소드
		return this.sqlSession.selectOne("qnaCont", no);
	}

	@Override
	public int updateBoard(QNADTO dto) {
		return this.sqlSession.update("qnaUpdate", dto); // (키, 값)
		 
		
	}

	@Override
	public void deleteBoard(int no) {
		 this.sqlSession.delete("qnaDelete", no);
		
	}

	@Override
	public int insertReply(REPLYDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.insert("qnaReplyAdd", dto);
	}

	@Override
	public void updateRecomplete(int no) {
		this.sqlSession.update("qnaReplycomplete", no);
	}
	@Override
	public int isAnswer(int no) {
		return this.sqlSession.selectOne("qnaIsAnswer", no);
	}
	
	@Override
	public List<REPLYDTO> getReplylist(int no){
		return this.sqlSession.selectList("qnaReplylist", no);
	}

	@Override
	public REPLYDTO replycontent(int no) {
		// TODO Auto-generated method stub
		return this.sqlSession.selectOne("qnaReplyCont", no);
	}

	@Override
	public int replyUpdate(REPLYDTO dto) {
		// TODO Auto-generated method stub
		return this.sqlSession.update("qnaReplyUpdate", dto);
	}

	@Override
	public void replyDelete(int no) {
		
		this.sqlSession.delete("qnaReplyDelete", no);
	}
	
}
