package com.sist.dabang;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.model.BCommentsDTO;
import com.sist.model.BoardDAO;
import com.sist.model.BoardDTO;
import com.sist.model.RoomDAO;
import com.sist.model.RoomTotalDTO;
import com.sist.model.SearchDTO;

@org.springframework.stereotype.Controller
public class Controller {
	
	@Autowired
	private RoomDAO rdao;
	
	@Autowired
	private BoardDAO dao;
	
	/*f
	 * public ModelAndView view_room_map() { ModelAndView mav = new ModelAndView();
	 * 
	 * List<RoomDTO> list = rdao.roomSelectAll();
	 * 
	 * mav.addObject("List", list); return mav; }
	 */
	
	
	@RequestMapping("/main_room.do")
	public String main_room() {

		return "../../index";
	}
	
	@RequestMapping("/view_room.do")
	public String view_room(Model model, HttpServletRequest request, HttpSession session) throws JsonProcessingException {			
		List <RoomTotalDTO> list = rdao.roomSelectAll();
		List<String> photosrc = new ArrayList<String>();
		
		for(int i = 0; i < list.size(); i++) {
			String arr[] = list.get(i).getR_photo().split("/");
			list.get(i).setR_photoOne(arr[0]);
		}

		model.addAttribute("List", list);
		model.addAttribute("Photosrc", photosrc);
		
		request.setAttribute("List2", list);
		model.addAttribute(request);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(list);
		model.addAttribute("json", jsonText);
		
		
		
		/*
		 * Random random = new Random(); System.out.println(random.nextInt(9999));
		 */
		
		return "view_room";
	}

	@RequestMapping("/rent_room.do")
	public String rent_room() {
		
		return "rent_room";
	}

	@RequestMapping("/upload_room.do")
	public String upload_room(Model model, HttpSession session, RoomTotalDTO tdto) {
		
		 System.out.println(session.getAttribute("m_no"));
		
		  RoomTotalDTO list = this.rdao.roomContent(tdto.getR_no());

		  model.addAttribute("tdto",list);
		 
		return "upload_room";
	}
	

	@RequestMapping("/upload_room_2.do")
	public String upload_room_2(Model model, HttpSession session, RoomTotalDTO tdto) {
		System.out.println(session.getAttribute("m_no"));
		
		  RoomTotalDTO list = this.rdao.roomContent(tdto.getR_no());
		  
		  model.addAttribute("tdto",list);
		 
		return "upload_room_2";
	}

	@RequestMapping("/upload_room_3.do")
	public String upload_room_3(Model model, HttpSession session, RoomTotalDTO tdto) {
		System.out.println(session.getAttribute("m_no"));
		
		  RoomTotalDTO list = this.rdao.roomContent(tdto.getR_no());
		  model.addAttribute("tdto",list);
		 
		return "upload_room_3";
	}

	/*
	 * @RequestMapping("/share_room.do") public String share_room() {
	 * 
	 * return "share_room"; }
	 */
	/*
	 * @RequestMapping("/share_room_upload.do") public String share_room_upload() {
	 * 
	 * return "share_room_upload"; }
	 */
	/*
	 * @RequestMapping("/customer_room.do") public String customer_room() {
	 * 
	 * return "customer_room"; }
	 */
	
	
	/*
	 * @RequestMapping("/myqna_room.do") public String myqna_room() {
	 * 
	 * return "myqna_room"; }
	 */
	
	@RequestMapping("/my_room_1.do")
	public String my_room_1(Model model, HttpServletRequest request, HttpSession session) throws JsonProcessingException {
			
			int m_no = (int)session.getAttribute("m_no");
			System.out.println(m_no);
			List <RoomTotalDTO> list = rdao.roomLikeAll(m_no);
			System.out.println(list);
			
			List<String> photosrc = new ArrayList<String>();
			
			for(int i = 0; i < list.size(); i++) {
				String arr[] = list.get(i).getR_photo().split("/");
				list.get(i).setR_photoOne(arr[0]);
			}

			model.addAttribute("List", list);
			model.addAttribute("Photosrc", photosrc);
			model.addAttribute(request);
			
			ObjectMapper mapper = new ObjectMapper();
			String jsonText = mapper.writeValueAsString(list);
			model.addAttribute("json", jsonText);
		
		return "my_room_1";
	}
	

	@RequestMapping("/my_room_3.do")
	public String my_room_3(Model model, HttpServletRequest request, HttpSession session) throws JsonProcessingException {

		int m_no = (int)session.getAttribute("m_no");
		
		List <RoomTotalDTO> list = rdao.myRoomList(m_no);
		
		List<String> photosrc = new ArrayList<String>();
		
		for(int i = 0; i < list.size(); i++) {
			String arr[] = list.get(i).getR_photo().split("/");
			list.get(i).setR_photoOne(arr[0]);
			/* System.out.println(list.get(i).getR_btype()); */
		}

		model.addAttribute("List", list);
		model.addAttribute("Photosrc", photosrc);
		model.addAttribute(request);
		
		ObjectMapper mapper = new ObjectMapper();
		String jsonText = mapper.writeValueAsString(list);
		model.addAttribute("json", jsonText);
		
		return "my_room_3";
	}
	
	@RequestMapping("/my_room_3_1.do")
	public String my_room_3_1() {

		return "my_room_3_1";
	}
	
	@RequestMapping("/my_room_4.do")
	public String my_room_4() {

		return "my_room_4";
	}

	
	@RequestMapping("/con4_1.do")
	public String con4_1() {

		return "con4_1";
	}
	
	@RequestMapping("/con4_2.do")
	public String con4_2() {

		return "con4_2";
	}
	
	@RequestMapping("/search_room.do")
	public String search_room(Model model, @RequestParam("search_text") String search_text, HttpSession session) throws JsonProcessingException {
		List<RoomTotalDTO> list =  this.rdao.searchList(search_text);
		System.out.println(list);
		List<String> photosrc = new ArrayList<String>();
		
		for(int i = 0; i < list.size(); i++) {
			String arr[] = list.get(i).getR_photo().split("/");
			list.get(i).setR_photoOne(arr[0]);
		}
		model.addAttribute("search_text", search_text);
		model.addAttribute("List", list);
		model.addAttribute("Photosrc", photosrc);
		
		return "search_room";
	}
	
	@RequestMapping("/email_find.do")
	public String email_find() {

		return "email_find";
	}
	
	@RequestMapping("/pwd_find.do")
	public String pwd_find() {

		return "pwd_find";
	}

	@RequestMapping("/rent_room_upload.do")
	public String rent_room_update() {
		return "rent_room_upload";
	}
	
	@RequestMapping("/customer_room.do")
	public String customer_room(HttpSession session) {

		return "customer_room";
	}

	@RequestMapping("/session_qna_room.do")
	public String go_qna_room(HttpSession session) {

		return "qna_room";
	}

	@RequestMapping("/qna_room.do")
	public void qna_room(HttpServletRequest request, HttpSession session, HttpServletResponse response)
			throws IOException {
		response.setContentType("text/html; charset=UTF-8");

		PrintWriter out = response.getWriter();
		if (session.getAttribute("m_no") != null) {
			System.out.println(session.getAttribute("m_no"));
			out.println("<script>");
			out.println("alert('1:1 문의내역 확인')");
			out.println("location.href='session_qna_room.do'");
			out.println("</script>");
		} else {
			out.println("<script>");
//				System.out.println("ddd");
			out.println("alert('로그인 하세요!')");
			out.println("location.href='customer_room.do'");
			out.println("</script>");
		}
	}
	
	@RequestMapping("/board_list.do")
	   public String board_list(Model model,HttpSession session,BoardDTO dto, HttpServletRequest request) {
	      System.out.println(dto.getB_head());
		int rowsize = 15; // 페이지당 보여질 게시물의 수
		int block = 10; // 아래 보여질 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
		int totalRecord = 0; // DB상의 레코드 전체 게시글의 수
		int allPage = 0; // 전체 페이지 수
		
		int page = 0; 
		
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));  // board_list 페이지에서 page 값을 받아온다.
		} else {
			// 처음으로 리스트 페이지에 들어온 경우
			page = 1;
		}
		/*
		 * // 해당 페이지에서의 시작 번호 int startNo = (page * rowsize) - (rowsize - 1); // 해당
		 * 페이지에서의 끝 번호 int endNo = (page * rowsize);
		 */

		// 해당 페이지의 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지의 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;
		if(dto.getB_head().equals("전체글보기")) {
			totalRecord = dao.getcount();
		}else {
			totalRecord = dao.getcount(dto.getB_head());
		}
		allPage = (int)(Math.ceil(totalRecord / (double)rowsize));  // ceil 함수는 나머지가 발생하면 자동으로 올림해주는 메서드
		
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list;  
		if(dto.getB_head().equals("전체글보기")) {
			list = this.dao.getList(page, rowsize);
		}else {
			list = this.dao.getList(page, rowsize,dto.getB_head());
		}
		for(int i=0; i<list.size(); i++) {
			
			list.get(i).setB_Comments_count(this.dao.b_Comments_count(list.get(i).getB_no()));
					
		}
		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		/*
		 * request.setAttribute("startNo", startNo); request.setAttribute("endNo",
		 * endNo);
		 */
		
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		request.setAttribute("nick", session.getAttribute("m_nick"));
		
		model.addAttribute("head",dto.getB_head());
		model.addAttribute("List",list);
		
	      return "board_list";
	   }
	   
	@RequestMapping("/board_search.do")
	public String board_search(HttpSession session,BoardDTO dto,Model model,HttpServletRequest request) {
		String find_field = request.getParameter("find_field").trim();
		System.out.println(find_field + "=find_field");
		String find_name =  request.getParameter("find_name").trim();
		System.out.println(find_name + "=find_name");
		
		//	페이징 처리s
		int rowsize = 15; // 페이지당 보여질 게시물의 수
		int block = 10; // 아래 보여질 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
		int totalRecord = 0; // DB상의 레코드 전체 게시글의 수
		int allPage = 0; // 전체 페이지 수
		
		int page = 0; 
		
		if(request.getParameter("page")!=null){
			page = Integer.parseInt(request.getParameter("page"));  // board_list 페이지에서 page 값을 받아온다.
		} else {
			// 처음으로 리스트 페이지에 들어온 경우
			page = 1;
		}
		/*
		 * // 해당 페이지에서의 시작 번호 int startNo = (page * rowsize) - (rowsize - 1); // 해당
		 * 페이지에서의 끝 번호 int endNo = (page * rowsize);
		 */
	
		// 해당 페이지의 시작 블럭
		int startBlock = (((page - 1) / block) * block) + 1;
		// 해당 페이지의 끝 블럭
		int endBlock = (((page - 1) / block) * block) + block;

		if(dto.getB_head().equals("전체글보기")) {
			totalRecord = dao.getSearchcount(find_field, find_name); // 전체 게시글의 수를 저장해 줌
		}else {
		totalRecord = dao.getSearchcount(find_field, find_name,dto.getB_head()); // 전체 게시글의 수를 저장해 줌
		}
		// 전체 게시글의 수를 한 페이지당 보여질 게시물의 수로 나누어준다.
		// 이러한 작업을 거치면 전체 페이지가 나온다.
		// 전체 페이지가 나올 때 나머지가 있으면 무조건 올려주어야 한다.
	
		allPage = (int)(Math.ceil(totalRecord / (double)rowsize));  // ceil 함수는 나머지가 발생하면 자동으로 올림해주는 메서드
		
		if (endBlock > allPage) {
			endBlock = allPage;
		}
		List<BoardDTO> list;
		if(dto.getB_head().equals("전체글보기")) {
			list = dao.getSearchlist(find_field, find_name, page, rowsize);
		}else {
			list = dao.getSearchlist(find_field, find_name, page, rowsize,dto.getB_head());
		}
		for(int i=0; i<list.size(); i++) {
			list.get(i).setB_Comments_count((this.dao.b_Comments_count(list.get(i).getB_no())));
		}

		request.setAttribute("page", page);
		request.setAttribute("rowsize", rowsize);
		request.setAttribute("block", block);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("allPage", allPage);
		/*
		 * request.setAttribute("startNo", startNo); request.setAttribute("endNo",
		 * endNo);
		 */
		request.setAttribute("startBlock", startBlock);
		request.setAttribute("endBlock", endBlock);
		
		request.setAttribute("find_field", find_field);
		request.setAttribute("find_name", find_name);
		request.setAttribute("nick", session.getAttribute("m_nick"));
		model.addAttribute("head",dto.getB_head());
		model.addAttribute("List",list);
		if(dto.getB_head()==null) {
			return "board_list";
		}else {
			if(dto.getB_head().equals("공지사항")) {
				return "notice_room";
			}else {
				return "board_list";
			}
		}
		
	}
	
	   @RequestMapping("/board_write.do")
	   public String board_write(HttpSession session,BoardDTO dto,Model model) {
		   if(dto.getB_no()!=0) {
				BoardDTO u_dto=this.dao.content(dto.getB_no());
				model.addAttribute("cont",u_dto);
			}
			if(dto.getB_group()!=0) {
				model.addAttribute("reply",dto);
			}
			
		model.addAttribute("nick",session.getAttribute("m_nick"));
		model.addAttribute("head",dto.getB_head());
		if(dto.getB_head()==null) {
			 return "board_write";
		}else {
			if(dto.getB_head().equals("공지사항")) {
				 return "notice_room_upload";
			}else {
				 return "board_write";
			}
		}
	   }   
	   
	   @RequestMapping("/board_write_ok.do")
		public String board_write_ok(BoardDTO dto,Model model,MultipartHttpServletRequest mtfRequest,HttpSession session,@RequestParam("put") List<String> put) throws UnsupportedEncodingException {
			List<MultipartFile> fileList = mtfRequest.getFiles("file");
			System.out.println("123");
			String safeFile2 ="";
			//사진 수정
			if(dto.getB_no()!=0) {
				String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
				/*
				 * String cheackFile = "http://localhost:8484/dabang/resources/Shereuploads/";
				 */
				BoardDTO u_dto=this.dao.content(dto.getB_no());
				if(u_dto.getB_src() !=null) {
				String[] src=u_dto.getB_src().split("/");
				String[] pu= new String[put.size()];
				
				
				for(int i=0; i<src.length; i++) {
					
					pu[i]=put.get(i+1).replace("http://localhost:8383/dabang/resources/Shereuploads/",
		                     "resources\\Shereuploads\\");
					if((src[i]).equals(pu[i])) {
						System.out.println("하이");	
						 File file = new File(safeFile+src[i]); 
						 System.out.println(file);
						 file.delete();
							 
					}
					else {
						safeFile2 +=src[i]+"/";
					}
				}
				}
			}
			
			System.out.println(dto.getB_no());
	        String path = "resources\\Shereuploads\\";
	   
			/* path.replace("\\", "\" "); */
	        
	        for (MultipartFile mf : fileList) {
	            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
	            long fileSize = mf.getSize(); // 파일 사이즈
	            if(fileSize>0) {
		            System.out.println("originFileName : " + originFileName);
		            System.out.println("fileSize : " + fileSize);
		
		           String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\" + path + System.currentTimeMillis() + originFileName;
		           safeFile2 +=  path + System.currentTimeMillis() + originFileName+"/";
		            try {
		                mf.transferTo(new File(safeFile));
		            } catch (IllegalStateException e) {
		                // TODO Auto-generated catch block
		                e.printStackTrace();
		            } catch (IOException e) {
		                // TODO Auto-generated catch block
		                e.printStackTrace();
		            }
	            }
	        }
			System.out.println(safeFile2);
		
			dto.setB_src(safeFile2);
			dto.setB_writer((String)session.getAttribute("m_nick"));
			if(dto.getB_no()!=0) {
				this.dao.updateBoard(dto);
			}else if(dto.getB_group()!=0) {
				this.dao.replyinsertBoard(dto);
			}else {
				this.dao.insertBoard(dto);
			}
			String head= URLEncoder.encode(dto.getB_head(), "UTF-8"); // 한글 인코딩?

			
			if(dto.getB_head()==null) {
				return "redirect:board_list.do?b_head="+head+"";
			}else {
				if(dto.getB_head().equals("공지사항")) {
					return "redirect:notice_room.do?b_head="+head+"";
				}else {
					return "redirect:board_list.do?b_head="+head+"";
				}
			}
		}
	   
	   @RequestMapping("/board_delete.do")
		public String board_delete(BoardDTO dto,SearchDTO s_dto,Model model,HttpServletRequest request) throws UnsupportedEncodingException {
			//체크박스로 여러개 삭제하는 기능 추가.
			if(dto.getB_checkno()!=null) {
			String[] b_no = dto.getB_checkno().split(",");
			
			List<Integer> list = new ArrayList<Integer>();
			
			for (int i=0; i<b_no.length; i++) {
				
				
				list.add(Integer.parseInt(b_no[i]));
				
				  BoardDTO u_dto=this.dao.content(Integer.parseInt(b_no[i]));
					String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
					if(u_dto.getB_src()!=null) {	
						String[] src=u_dto.getB_src().split("/");
						
						for(int j=0; j<src.length; j++) {
							File file = new File(safeFile+src[j]);
							
							file.delete();
						}
						
					}
					if(dao.groupcount(u_dto.getB_group()) !=0) {
						
						if(dao.replycheck(u_dto)!=null) {
							
							dao.replyupdate(u_dto);
						}
						else {
							
							dao.replyupdate2(u_dto);
						}
					}
				/* dao.deleteBoard(Integer.parseInt(s_no[i])); */
			  }
			 	dao.deleteBoard2(list);
				
			}
			else {
				BoardDTO u_dto=this.dao.content(dto.getB_no());
				String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
				if(u_dto.getB_src()!=null) {	
					String[] src=u_dto.getB_src().split("/");
					
					for(int i=0; i<src.length; i++) {
						File file = new File(safeFile+src[i]);
						System.out.println(file);
						file.delete();
					}
					
				}
				if(dao.groupcount(u_dto.getB_group()) !=0) {
					System.out.println('1');
					if(dao.replycheck(u_dto)!=null) {
						System.out.println('2');
						dao.replyupdate(u_dto);
					}
					else {
						System.out.println('3');
						dao.replyupdate2(u_dto);
					}
				}
				dao.deleteBoard(dto.getB_no());
			}
			String head= URLEncoder.encode(dto.getB_head(), "UTF-8"); // 한글 인코딩?
			
			if(s_dto.getFind_name()==null){
				if(dto.getB_head()==null) {
					return "redirect:board_list.do?b_head="+head+"";
				}else {
					if(dto.getB_head().equals("공지사항")) {
						return "redirect:notice_room.do?b_head="+head+"";
					}else {
						return "redirect:board_list.do?b_head="+head+"";
					}
				}

			} else {
				// 처음으로 리스트 페이지에 들어온 경우
				String find_field = s_dto.getFind_field().trim();
				String find_name =  s_dto.getFind_name().trim();
				
				String page = request.getParameter("page");
				/* System.out.println(page); */
				 
				System.out.println(find_field);
				/* System.out.println(find_name); */
				/*
				 * request.setAttribute("page", page); request.setAttribute("find_field",
				 * find_field); request.setAttribute("find_name", find_name);
				 */
				return "redirect:board_search.do?find_field="+find_field+"&find_name="+find_name+"&page="+page+"?b_head="+head+"";
			}
			
		}
	   
	   @RequestMapping("/board_view.do")
	   public String board_view(BoardDTO bdto,Model model,HttpSession session,HttpServletRequest request) {
		   int b_no = bdto.getB_no();
		   this.dao.readCount(b_no);
			BoardDTO dto=this.dao.content(b_no);
			int rowsize = 100; // 페이지당 보여질 게시물의 수
			int block = 10; // 아래 보여질 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
			int totalRecord = 0; // DB상의 레코드 전체 게시글의 수
			int allPage = 0; // 전체 페이지 수
			
			int c_page = 0; 
			
			if(request.getParameter("c_page")!=null){
				c_page = Integer.parseInt(request.getParameter("c_page"));  // board_list 페이지에서 page 값을 받아온다.
			} else {
				// 처음으로 리스트 페이지에 들어온 경우
				c_page = 1;
			}
			/*
			 * // 해당 페이지에서의 시작 번호 int startNo = (page * rowsize) - (rowsize - 1); // 해당
			 * 페이지에서의 끝 번호 int endNo = (page * rowsize);
			 */

			// 해당 페이지의 시작 블럭
			int startBlock = (((c_page - 1) / block) * block) + 1;
			// 해당 페이지의 끝 블럭
			int endBlock = (((c_page - 1) / block) * block) + block;
			
			totalRecord = dao.b_Comments_count(b_no);//
			
			allPage = (int)(Math.ceil(totalRecord / (double)rowsize));  // ceil 함수는 나머지가 발생하면 자동으로 올림해주는 메서드
			
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			
			request.setAttribute("c_page", c_page);
			request.setAttribute("c_rowsize", rowsize);
			request.setAttribute("block", block);
			request.setAttribute("c_count", totalRecord);
			request.setAttribute("allPage", allPage);
			request.setAttribute("startBlock", startBlock);
			request.setAttribute("endBlock", endBlock);
			
			if(bdto.getB_head()==null) {
				if(this.dao.b_next_Board(dto.getB_group())!=null) {
					BoardDTO next=this.dao.b_next_Board(dto.getB_group());
					next.setB_Comments_count((this.dao.b_Comments_count(next.getB_no())));
					model.addAttribute("next",next);
					}
					if(this.dao.b_pre_Board(dto.getB_group())!=null) {
					BoardDTO pre=this.dao.b_pre_Board(dto.getB_group());
					pre.setB_Comments_count((this.dao.b_Comments_count(pre.getB_no())));
					model.addAttribute("pre",pre);
					}
			}else {
				if(bdto.getB_head().equals("공지사항")) {
					if(this.dao.b_next_Board(dto.getB_group(),bdto.getB_head())!=null) {
						BoardDTO next=this.dao.b_next_Board(dto.getB_group(),bdto.getB_head());
						next.setB_Comments_count((this.dao.b_Comments_count(next.getB_no())));
						model.addAttribute("next",next);
						}
						if(this.dao.b_pre_Board(dto.getB_group(),bdto.getB_head())!=null) {
						BoardDTO pre=this.dao.b_pre_Board(dto.getB_group(),bdto.getB_head());
						pre.setB_Comments_count((this.dao.b_Comments_count(pre.getB_no())));
						model.addAttribute("pre",pre);
						}
				}else {
					if(this.dao.b_next_Board(dto.getB_group())!=null) {
						BoardDTO next=this.dao.b_next_Board(dto.getB_group());
						next.setB_Comments_count((this.dao.b_Comments_count(next.getB_no())));
						model.addAttribute("next",next);
						}
						if(this.dao.b_pre_Board(dto.getB_group())!=null) {
						BoardDTO pre=this.dao.b_pre_Board(dto.getB_group());
						pre.setB_Comments_count((this.dao.b_Comments_count(pre.getB_no())));
						model.addAttribute("pre",pre);
						}
				}
			}
			
			
			if(this.dao.groupcount(dto.getB_group())>1) {
				List<BoardDTO> groupdto=this.dao.groupList(dto.getB_group());
				
				for(int i=0; i<groupdto.size(); i++) {
					groupdto.get(i).setB_Comments_count((this.dao.b_Comments_count(groupdto.get(i).getB_no())));
				}
				model.addAttribute("groupdto",groupdto);
			}
			model.addAttribute("cont",dto);
			

			model.addAttribute("head", bdto.getB_head());
			model.addAttribute("nick", session.getAttribute("m_nick"));
			model.addAttribute("groupcount", this.dao.groupcount(dto.getB_group()));
			
			if(bdto.getB_head()==null) {
				 return "board_view";
			}else {
				if(bdto.getB_head().equals("공지사항")) {
					return "notice_room_view";
				}else {
					 return "board_view";
				}
			}
	      
	   }   
	   
	   @RequestMapping(value="/b_comment_add.do")
	    @ResponseBody
	    public String ajax_addComment(@ModelAttribute("BCommentsDTO") BCommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
	        
		 	
	        try{
	        
	        	dto.setBc_id((String)session.getAttribute("m_nick")); 
	            this.dao.insert_b_Comments(dto);
	            
	        } catch (Exception e){
	            e.printStackTrace();
	        }
	        
	        return "success";
	}
	
	@RequestMapping(value="/b_comment.do", produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity share_commnet(@ModelAttribute("BCommentsDTO") BCommentsDTO dto,HttpServletRequest request,HttpSession session) throws Exception  {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		List<BCommentsDTO> c_DTO = this.dao.List_b_Comments(dto.getB_no(),dto.getBc_page(),dto.getBc_rowsize());
		BoardDTO dto2=this.dao.content(dto.getB_no());
		if(c_DTO.size()>0) {
			for(int i=0; i<c_DTO.size(); i++) {
				HashMap hm = new HashMap();
				 
					 hm.put("bc_no", c_DTO.get(i).getBc_no());
					 hm.put("b_no", c_DTO.get(i).getB_no());
					 hm.put("bc_id", c_DTO.get(i).getBc_id());
		             hm.put("bc_cont", c_DTO.get(i).getBc_cont());
		             hm.put("bc_date", c_DTO.get(i).getBc_date());   
		             hm.put("bc_group", c_DTO.get(i).getBc_group());   
		             hm.put("bc_step", c_DTO.get(i).getBc_step());   
		             hm.put("bc_indent", c_DTO.get(i).getBc_indent());
		             hm.put("bc_check1", c_DTO.get(i).getBc_check1());
		             hm.put("bc_replyid", c_DTO.get(i).getBc_replyid());
		             hm.put("session", (String)session.getAttribute("m_nick"));
		             hm.put("b_writer", dto2.getB_writer());
		             hmlist.add(hm);
	            }
	            
	        }
	        
	        JSONArray json = new JSONArray(hmlist);        
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		
	}


	
	 @RequestMapping(value="/b_comment_dele.do")
	 @ResponseBody
	 public String b_commnet_del(@ModelAttribute("BCommentsDTO") BCommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
	        
	//  HttpSession session = request.getSession(); 
	//  CommentsDTO loginVO = (CommentsDTO)session.getAttribute("loginVO"); 
	       
		 try{
			 if(this.dao.b_Commentscheck(dto.getBc_group()).getBc_no()==dto.getBc_no()) {
				// dto.setC_id(loginVO.getUser_id()); 
		         this.dao.delete_b_Comments(dto.getBc_no());
		         this.dao.delete2_b_Comments(dto.getBc_group());
			 }
			 else {
				 this.dao.delete_b_Comments(dto.getBc_no());
			 }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
	        
	        return "success";
	}

	
	 @RequestMapping(value="/b_comment_update.do")
	 @ResponseBody
	 public String b_commnet_update(@ModelAttribute("BCommentsDTO") BCommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
	        
	 // HttpSession session = request.getSession(); 
	 // CommentsDTO loginVO = (CommentsDTO)session.getAttribute("loginVO"); 
	       
		 try{
	        
			// dto.setC_id(loginVO.getUser_id()); 
			 	
			this.dao.update_b_Comments(dto);
	            
	        } catch (Exception e){
	            e.printStackTrace();
	        }
	        
	        return "success";
	} 

	 @RequestMapping(value="/b_replycomment_update.do")
	 @ResponseBody
	 public String s_replycommnet_insert(@ModelAttribute("BCommentsDTO") BCommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
		 

		 
		 try{
			 
			
			 dto.setBc_id((String)session.getAttribute("m_nick")); 
			 this.dao.insert_b_replyComments(dto);
			 
		 } catch (Exception e){
			 e.printStackTrace();
		 }
		 
		 return "success";
	 } 
	 
	   @RequestMapping("/notice_room.do")
	   public String notice_room(Model model,HttpSession session,BoardDTO dto, HttpServletRequest request) {
		   System.out.println(dto.getB_head());
			int rowsize = 15; // 페이지당 보여질 게시물의 수
			int block = 10; // 아래 보여질 페이지 최대 수 - 예)[1][2][3] / [4][5][6]
			int totalRecord = 0; // DB상의 레코드 전체 게시글의 수
			int allPage = 0; // 전체 페이지 수
			
			int page = 0; 
			
			if(request.getParameter("page")!=null){
				page = Integer.parseInt(request.getParameter("page"));  // board_list 페이지에서 page 값을 받아온다.
			} else {
				// 처음으로 리스트 페이지에 들어온 경우
				page = 1;
			}
			/*
			 * // 해당 페이지에서의 시작 번호 int startNo = (page * rowsize) - (rowsize - 1); // 해당
			 * 페이지에서의 끝 번호 int endNo = (page * rowsize);
			 */

			// 해당 페이지의 시작 블럭
			int startBlock = (((page - 1) / block) * block) + 1;
			// 해당 페이지의 끝 블럭
			int endBlock = (((page - 1) / block) * block) + block;
			
				totalRecord = dao.getcount(dto.getB_head());
			
			allPage = (int)(Math.ceil(totalRecord / (double)rowsize));  // ceil 함수는 나머지가 발생하면 자동으로 올림해주는 메서드
			
			if (endBlock > allPage) {
				endBlock = allPage;
			}
			List<BoardDTO> list;  
			
				list = this.dao.getList(page, rowsize,dto.getB_head());
				for(int i=0; i<list.size(); i++) {
					list.get(i).setB_Comments_count((this.dao.b_Comments_count(list.get(i).getB_no())));
				}
			
			request.setAttribute("page", page);
			request.setAttribute("rowsize", rowsize);
			request.setAttribute("block", block);
			request.setAttribute("totalRecord", totalRecord);
			request.setAttribute("allPage", allPage);
			/*
			 * request.setAttribute("startNo", startNo); request.setAttribute("endNo",
			 * endNo);
			 */
			
			request.setAttribute("startBlock", startBlock);
			request.setAttribute("endBlock", endBlock);
			request.setAttribute("nick", session.getAttribute("m_nick"));
			
			model.addAttribute("head",dto.getB_head());
			model.addAttribute("List",list);
			
		  
	      return "notice_room";
	   }
	   
	  
	
}
