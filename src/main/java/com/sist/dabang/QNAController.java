package com.sist.dabang;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.sist.model.QNADAO;
import com.sist.model.QNADTO;
import com.sist.model.REPLYDTO;
import com.sist.model.memDTO;



//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//
//import com.sist.model.BoardDAO;

@Controller
public class QNAController {

	@Autowired
	private QNADAO dao; //sqlsession template 객체
	
	/*
	 * @RequestMapping(value="/board_write_ok.do", method = RequestMethod.POST) 
	 * public String insertOk(BoardDTO dto){
	 * this.dao.insertBoard(dto);
	 * 
	 * return "redirect:board_list.do";
	 * 
	 * 
	 */
	
	@RequestMapping("/myqna_room.do")
	public String myqna_room(Model model, HttpSession session) {
		List<QNADTO> list = null;
		System.out.println(session.getAttribute("m_no"));
		String e_mail = (String)session.getAttribute("m_email");
		System.out.println("test>>>>"+e_mail);
		if(e_mail.equals("admin")) {
			list =  dao.getList2();	
		}else {
			list =  dao.getList(e_mail);
		}
		model.addAttribute("List", list);
		
		return "myqna_room";
	}	
	
	//글쓰기폼에서 작성완료버튼 누르면 작성한 글 내용 db에 저장하기		
	@RequestMapping(value="/myqna_write_ok.do", method=RequestMethod.POST)
	public void insertOk(QNADTO dto, HttpServletResponse response, HttpSession session) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		
		if(dto.getMyqna_cont().isEmpty()||dto.getMyqna_title().isEmpty()||dto.getMyqna_qtype().isEmpty()) {
			out.println("<script>");
			out.println("alert('다시 확인!!')");
			out.println("history.back()");
			out.println("</script>");
			return;
		}
		 String e_mail = (String) session.getAttribute("m_email");
		 
		dto.setMyqna_id(e_mail);
		System.out.println(e_mail);
		
		int res = this.dao.insertBoard(dto);
		if(res == 1) {
			out.println("<script>");
			out.println("location.href='myqna_room.do'");
			out.println("</script>");
		}
	}
	
	//글 제목 누르면 상세내용 보기		//?no=${i.myqna_no} 이렇게 넘기는게 get방식
	@RequestMapping(value="/myqna_content.do", method=RequestMethod.GET)
	public String myqna_content(@RequestParam("no") int no, Model model, HttpSession session) {
		QNADTO dto = this.dao.content(no); //상세내용 가져오기
		int answer = dao.isAnswer(no);
		model.addAttribute("cont", dto);
		model.addAttribute("answer", answer);
		model.addAttribute("loginid", session.getAttribute("m_email"));
		if(answer>0) {
			List<REPLYDTO> list = dao.getReplylist(no);
			model.addAttribute("answerlist", list);
		}
		return "myqna_content";
	}
	
	@RequestMapping(value="/myqna_edit.do", method=RequestMethod.GET)
	public String myqna_edit(@RequestParam("no") int no, Model model) {
		QNADTO dto = this.dao.content(no);
		model.addAttribute("modify", dto);

		return "myqna_edit";
	}

	@RequestMapping(value="/myqna_edit_ok.do", method=RequestMethod.POST)
	public String editOk(QNADTO dto, @RequestParam("myqna_no2") int no)  {

		dto.setMyqna_no(no);
		this.dao.updateBoard(dto);
				
		return "redirect:myqna_room.do";
	}
	
	@RequestMapping(value="/reply_edit.do", method=RequestMethod.GET)
	public String reply_edit(@RequestParam("no") int no, Model model) {
		REPLYDTO dto = this.dao.replycontent(no);
		
		System.out.println(dto.getReply_cont());
		
		
		model.addAttribute("replyEdit", dto);
		
		return "myqnareply_edit";
	}
	/*
	 * 	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam("input_email") String input_email,
			@RequestParam("input_pwd") String input_pwd, HttpServletRequest request, HttpServletResponse response)
			throws IOException {

		memDTO mdto = new memDTO();
		mdto.setM_email(input_email);
		mdto.setM_pwd(input_pwd);
		ModelAndView mav = new ModelAndView();
		HttpSession session = request.getSession();
		memDTO mem = mservice.login(mdto);

		if (mem == null) {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			  out.println("<script>");
			  out.println("alert('아이디와 비밀번호를 확인하세요')");
			  out.println("history.back()");
			  out.println("</script>");
			  out.flush();
			  return null;
		}
		else {
			session.setAttribute("member", mem);
			session.setAttribute("m_no", mem.getM_no());
			session.setAttribute("m_nick", mem.getM_nick());
			mav.setViewName("../../index");
			return mav;
		}
	}
	 */
	@RequestMapping(value="/reply_edit_ok.do", method=RequestMethod.POST)
	public void replyEditOk(REPLYDTO dto, HttpServletResponse response, HttpSession session) throws IOException {
		


		response.setContentType("text/html; charset=UTF-8");
		int res = this.dao.replyUpdate(dto);
		PrintWriter out = response.getWriter();

		if(res == 1) {
			out.println("<script>");
			out.println("alert('성공')");
			out.println("location.href='myqna_content.do?no="+dto.getReply_no()+"'");
			out.println("</script>");
		}else {
			
			out.println("<script>");
			out.println("alert('수정실패')");
			out.println("history.back()");
			out.println("</script>");
	     	}
		}
	
	
	
	/*
	 * //삭제버튼 누르면 삭제 폼 창으로 보내기
	 * 
	 * @RequestMapping(value="/myqna_delete.do", method=RequestMethod.GET) public
	 * String delete(@RequestParam("no") int no, Model model) {
	 * 
	 * DTO dto = this.dao.content(no);
	 * 
	 * model.addAttribute("delete", dto); 
	 * 
	 * return "myqna_delete";
	 * 
	 * }
	 */
	
	@RequestMapping(value="/myqna_delete.do.ok", method=RequestMethod.GET)
	public String deleteOk(@RequestParam("no") int no, QNADTO dto, Model model, HttpServletResponse response ) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		this.dao.deleteBoard(no);		
		return "redirect:myqna_room.do";

	}
	
	@RequestMapping(value="/qnaReply_delete.do.ok", method=RequestMethod.GET)
	public String replyDelete(@RequestParam("no") int no, REPLYDTO dto, Model model, HttpServletResponse response ) throws IOException {
		
		this.dao.replyDelete(no);		
		return "redirect:myqna_room.do";

	}
	
	
	@RequestMapping(value =  "/reply_write_ok.do",method = RequestMethod.POST)
	public String replyInsert(REPLYDTO dto,@RequestParam("no") int no) {
		dto.setReply_no(no);
		int res =dao.insertReply(dto);
		if(res==1) {
			dao.updateRecomplete(no);
		}
		return "redirect:myqna_room.do?no="+no;
	}
}
