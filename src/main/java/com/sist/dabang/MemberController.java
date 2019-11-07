package com.sist.dabang;

import java.io.IOException;
import java.io.PrintWriter;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.sist.model.memDTO;
import com.sist.model.memService;

@Controller
public class MemberController {

	@Inject
	private memService mservice;
	
	@Autowired
	private JavaMailSender mailSender;

	// mailSending 코드
	
	@RequestMapping(value = "pwd_find_ok.do")
	public String mailSending(memDTO mdto, HttpServletResponse response) throws Exception {
		memDTO mdto2 = new memDTO();
		
		if(this.mservice.selectMem(mdto)!=null) {
			mdto2=this.mservice.selectMem(mdto);
		}else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			  out.println("<script>");
			  out.println("alert('아이디와 비밀번호를 확인하세요')");
			  out.println("history.back()");
			  out.println("</script>");
		}
		
		
		
		if(mdto2.getM_name()!=null)  {		
		String setfrom = "leesh3715@naver.com";
		String tomail = mdto2.getM_email(); // 받는 사람 이메일
		String title = "청년다방에서 알려드립니다."; // 제목
		String content = "안녕하세요.\r\n" + 
				"\r\n" + 
				"회원님의 비밀번호는 "+mdto2.getM_pwd()+" 입니다.\r\n" + 
				"\r\n" + 
				"혹시 비밀번호를 모르시겠으면, 아래 링크를 이용해서 초기화 해주세요.\r\n" + 
				""; // 내용
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,
					true, "UTF-8");
			messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		return "../../index";
		
		}
		return null;
	}

	// 회원가입
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(memDTO mdto) {

		mservice.insertmem(mdto);
		return "redirect:/";
	}

	// 이메일 중복 체크 (ajax)
	@RequestMapping(value = "/checkemail.do", method = RequestMethod.POST)
	@ResponseBody
	public int checkemail(@RequestParam("mem_email") String m_email) {

		return mservice.checkemail(m_email);
	}

	// 이메일 중복 체크 (ajax)
	@RequestMapping(value = "/checknick.do", method = RequestMethod.POST)
	@ResponseBody
	public int checknick(@RequestParam("mem_nick") String m_nick) {

		return mservice.checknick(m_nick);

	}

	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
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

	@RequestMapping(value = "/logout.do")
	public ModelAndView logout(HttpSession session) {
		mservice.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("../../index");
		return mav;

	}
	
	@RequestMapping(value="/update_member_ok.do")
	public String update_member_ok(@RequestParam("m_pwd2") String m_pwd2,HttpSession session, memDTO mdto, HttpServletResponse response) throws IOException {
		System.out.println(session.getAttribute("m_no"));
		mdto.setM_no((int)session.getAttribute("m_no"));
		
		if(mdto.getM_pwd().equals(m_pwd2)) {
			this.mservice.updateMem(mdto);
			mservice.logout(session);			
			
			return "../../index";
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			  out.println("<script>");
			  out.println("alert('비밀번호를 확인하세요')");
			  out.println("history.back()");
			  out.println("</script>");
			  out.flush();
			  return null;
		}
		
	}

}
