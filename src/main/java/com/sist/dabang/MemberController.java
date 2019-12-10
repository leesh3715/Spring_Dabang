package com.sist.dabang;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

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

import com.sist.api.AESCrypto;
import com.sist.api.Coolsms;
import com.sist.model.memDTO;
import com.sist.model.memService;

@Controller
public class MemberController {

	@Inject
	private memService mservice;
	
	@Autowired
	private JavaMailSender mailSender;

	
	private AESCrypto crypto;
	
	

	// 회원가입
	@RequestMapping(value = "/signup.do", method = RequestMethod.POST)
	public String signup(memDTO mdto) throws Exception {
		 mdto.setM_pwd(AESCrypto.encrypt(mdto.getM_pwd())); 		
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
			throws Exception {

		memDTO mdto = new memDTO();
		mdto.setM_email(input_email);
		mdto.setM_pwd(AESCrypto.encrypt(input_pwd));
		 System.out.println(AESCrypto.encrypt("1234")); 
		 System.out.println(AESCrypto.encrypt("0000"));
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
			session.setAttribute("m_email", mem.getM_email());
			mav.setViewName("../../index");
			return mav;
		}
	}

	@RequestMapping(value = "/logout.do")
	public String logout(HttpSession session) {
		mservice.logout(session);
		return "redirect:main_room.do";

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
	
	// 비밀번호 찾기 코드
	
		@RequestMapping(value = "pwd_find_ok.do")
		public String pwd_find_ok(memDTO mdto, HttpServletResponse response) throws Exception {
			memDTO mdto2 = new memDTO();
			
			if(this.mservice.findPwd(mdto)!=null) {
				mdto2=this.mservice.findPwd(mdto);
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				  out.println("<script>");
				  out.println("alert('이름과 전화번호를 확인하세요')");
				  out.println("history.back()");
				  out.println("</script>");
			}
			
			String decrypt_pwd = AESCrypto.decrypt(mdto2.getM_pwd());
			
			if(mdto2.getM_name()!=null)  {		
			String setfrom = "leesh3715@naver.com";
			String tomail = mdto2.getM_email(); // 받는 사람 이메일
			String title = "청년다방에서 알려드립니다."; // 제목
			String content = "안녕하세요.\r\n" + 
					"\r\n" + 
					"회원님의 비밀번호는 "+decrypt_pwd+" 입니다.\r\n" + 
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
				
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('"+mdto2.getM_email()+"로 비밀번호를 보냈습니다.확인 후 로그인을 진행하세요')");
				out.println("location.href='main_room.do'");
				out.println("</script>");
			} catch (Exception e) {
				System.out.println(e);
			}
			return null;
			
			}
			return null;
		}
		
		// mailSending 코드
		
		@RequestMapping(value = "email_find_ok.do")
		public String email_find_ok(memDTO mdto, HttpServletResponse response) throws Exception {
			memDTO mdto2 = new memDTO();
			
			if(this.mservice.findEmail(mdto)!=null) {
				mdto2=this.mservice.findEmail(mdto);
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('당신의 E-mail은 "+mdto2.getM_email()+"입니다. 로그인을 진행하세요')");
				out.println("location.href='main_room.do'");
				out.println("</script>");
			}else {
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('개인정보를 다시 확인하세요')");
				out.println("history.back()");
				out.println("</script>");
			}	
			
			return null;
		}
		
		@RequestMapping(value = "delete_member.do")
		public String delete_member(memDTO mdto, HttpServletResponse response, HttpSession session) throws Exception {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			mdto.setM_pwd(AESCrypto.encrypt(mdto.getM_pwd()));
			int result = this.mservice.deleteMember(mdto);
			 System.out.println(result);
			if(result ==1) {
				session.invalidate();
				out.println("<script>");
				out.println("alert('성공적으로 탈퇴 되었습니다.')");
				out.println("location.href='main_room.do'");
				out.println("</script>");
				return null;
				
			} else {
				out.println("<script>");
				out.println("alert('이메일과 비밀번호를 다시 확인해주세요')");
				out.println("history.back()");
				out.println("</script>");
				return null;
			}
			
		}
		
		@RequestMapping(value = "smsSend.do")
	      public String sms_send(HttpSession session, @RequestParam("send_text") String send_text,@RequestParam("send_nick") String send_nick, @RequestParam("send_phone") String send_phone, HttpServletResponse response) throws Exception {
	         
		  System.out.println(session.getAttribute("m_no"));
	      System.out.println("문자 보낼 내용 : "+send_text);
	      System.out.println("문자 수신인: "+ send_nick);
	      System.out.println("문자 수신 번호: "+ send_phone);
	      System.out.println("문자 발신인: "+session.getAttribute("m_nick"));
	      
	     
	    	    String value = "password1"; 
	    	    String valueEnc = AESCrypto.encrypt(value); 
	    	    String valueDec = AESCrypto.decrypt(valueEnc); 

	    	    System.out.println("Plain Text : " + value); 
	    	    System.out.println("Encrypted : " + valueEnc); 
	    	    System.out.println("Decrypted : " + valueDec); 
	    	
	    
		
		/*
		 * String test2 = crypto.encryptBase64(test); System.out.println("복호화된 문자열 = "
		 * +test2);
		 */
		 
	      
		
		  String api_key = "";
		  String api_secret ="";
		  Coolsms coolsms = new Coolsms(api_key, api_secret);
		  
		  
		  HashMap<String, String> set = new HashMap<String, String>();
		  set.put("to", "01024621908");  // 수신번호 
		  set.put("from", "01051573715"); // 발신번호
		  set.put("text", send_text); // 문자내용 set.put("type", "sms"); // 문자 타입
		  
		  System.out.println(set);
		  
		  
		  org.json.simple.JSONObject result = coolsms.send(set); // 보내기&전송결과받기
		  
		  if ((boolean)result.get("status") == true) { // 메시지 보내기 성공 및 전송결과 출력
		  System.out.println("성공"); System.out.println(result.get("group_id")); //그룹아이디
		  System.out.println(result.get("result_code")); // 결과코드
		  System.out.println(result.get("result_message")); // 결과 메시지
		  System.out.println(result.get("success_count")); // 메시지아이디
		  System.out.println(result.get("error_count")); // 여러개 보낼시 오류난 메시지 수 } else {
		  // 메시지 보내기 실패 System.out.println("실패");
		  System.out.println(result.get("code")); // REST API 에러코드
		  System.out.println(result.get("message")); // 에러메시지 }
		  
		  
		  }
		  
		    response.setContentType("text/html;charset=UTF-8");
	        PrintWriter out =  response.getWriter();
	     	out.println("<script>");
			out.println("alert('SMS 전송 완료')");
			out.println("history.back()");
			out.println("</script>");
	      
	        return null;
	      }
}
