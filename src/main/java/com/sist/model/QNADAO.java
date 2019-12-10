package com.sist.model;

import java.util.List;

public interface QNADAO {

		public List<QNADTO> getList(String e_mail);  // 사용자용
		public List<QNADTO> getList2();  // 관리자용
		public int insertBoard(QNADTO dto);
		public QNADTO content(int no);
		public int updateBoard(QNADTO dto);
		public void deleteBoard(int no);
		public int insertReply(REPLYDTO dto);
		public void updateRecomplete(int no);
		public int isAnswer(int no);
		public List<REPLYDTO> getReplylist(int no);
		public REPLYDTO replycontent(int no);
		public int replyUpdate(REPLYDTO dto);
		
		public void replyDelete(int no);
}
