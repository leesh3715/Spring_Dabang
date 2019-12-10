
package com.sist.dabang;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.JsonObject;
import com.sist.model.RoomDAO;
import com.sist.model.RoomDTO;
import com.sist.model.RoomOptionDTO;
import com.sist.model.RoomTotalDTO;
import com.sist.model.memDTO;


@Controller
public class RoomController {
	
	
	@Autowired
	private RoomDAO rdao;
	

	@RequestMapping("/upload_room_ok.do")
	public String upload_room_ok(RoomDTO rdto, RoomOptionDTO rodto, MultipartHttpServletRequest mtfRequest,
			@RequestParam("r_address2") String r_address2, @RequestParam("r_rentfee2") String r_rentfee2,
			@RequestParam("r_dimension2") String r_dimension2, @RequestParam("r_floor2") String r_floor2, HttpSession session, HttpServletResponse response,
			@RequestParam("put") List<String> put)
			throws IOException {
		
		List<MultipartFile> fileList = mtfRequest.getFiles("file");
		String safeFile2 = "";
			
		if(session.getAttribute("m_no")!=null) {
		System.out.println("세션 값 테스트 " + session.getAttribute("m_no"));
		

		
		// 사진 수정하는 조건문
		if(rdto.getR_no()!=0) {
		 String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
			/*
			 * String cheackFile = "http://localhost:8484/dabang/resources/Shereuploads/";
			 */
		 	RoomTotalDTO u_dto = this.rdao.roomContent(rdto.getR_no());
			if(u_dto.getR_photo() !=null) {
			String[] src=u_dto.getR_photo().split("/");
			String[] pu= new String[put.size()];
			
			
			for(int i=0; i<src.length; i++) {
				
				pu[i]=put.get(i+1).replace("http://localhost:8383/dabang/resources/uploads/",
	                     "resources\\uploads\\");
				if((src[i]).equals(pu[i])) {
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
		
		/*String path = "C:\\image\\";*/
		/*String path = "..\\..\\..\\..\\webapp\\resources\\uploads\\";*/
		String path = "resources\\uploads\\";
		path.replace("\\", "\" ");

		for (MultipartFile mf : fileList) {
			System.out.println("mf : " + mf);
			String originFileName = mf.getOriginalFilename(); // 원본 파일 명
			long fileSize = mf.getSize(); // 파일 사이즈
            if(fileSize>0) {
			System.out.println("originFileName : " + originFileName);
			System.out.println("fileSize : " + fileSize);

			String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\" +path + System.currentTimeMillis() + originFileName;
			safeFile2 += path + System.currentTimeMillis() + originFileName+"/";
			/* list.add(safeFile); */
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
		rdto.setR_address(rdto.getR_address() +","+ r_address2);
		
		System.out.println("test rentfee1 "+ rdto.getR_rentfee());
		
		rdto.setR_rentfee((rdto.getR_rentfee()+ "," + r_rentfee2).replace(",", "/"));
		System.out.println("test rentfee2 "+ rdto.getR_rentfee());
		
		rdto.setR_dimension((rdto.getR_dimension()+ "," +r_dimension2).replace(",", "/"));
		System.out.println("test dimention "+ rdto.getR_dimension());
		
		rdto.setR_floor((rdto.getR_floor()+ "," +r_floor2).replace(",", "/"));
		
		rdto.setR_photo(safeFile2);
		rdto.setM_no((int)session.getAttribute("m_no"));
		
		System.out.println("=====================================");
		System.out.println("사진 링크 테스트 =>>"+rdto.getR_photo());
	 
		
		 if(rdto.getR_no()==0) {
			// insert 문
				this.rdao.insertRoom(rdto);
				int roomNum = this.rdao.roomNumSearch();
				rodto.setR_no(roomNum);
				this.rdao.insertRoomOption(rodto);
				// insert 문 end
		 } else {
			 // update 문			
			 this.rdao.updateRoom(rdto);
			 this.rdao.updateRoomOption(rodto); 
		 }
		
		
		return "redirect:/";
		
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			  out.println("<script>");
			  out.println("alert('로그인 후 이용하세요')");
			  out.println("history.back()");
			  out.println("</script>");
			  out.flush();
			return null;
		
		}
	}
	
	@RequestMapping("/searchAddress.do")
	public ModelAndView searchAddress(@RequestParam("searchAddress") String searchAddress) {
		ModelAndView mav = new ModelAndView();
		List<RoomTotalDTO> list = this.rdao.searchAddress(searchAddress);
		/* List<String> photosrc = new ArrayList<String>(); */
		
		for(int i = 0; i < list.size(); i++) {
			String arr[] = list.get(i).getR_photo().split("/");
			list.get(i).setR_photoOne(arr[0]);
		}
		
		System.out.println(list.toString());

		mav.addObject("SearchAddress",list);
		mav.addObject("searchval", searchAddress);
		mav.setViewName("rent_room1");
		return mav;
	}
	
	@RequestMapping(value = "/room_cont.do", method = RequestMethod.GET)
	public String room_cont(@RequestParam("r_no") int r_no, Model model, HttpSession session,HttpServletResponse response) throws IOException {
		
		
		if(session.getAttribute("m_no")!=null) { 
		 RoomTotalDTO tdto = this.rdao.roomContent(r_no);
		 RoomTotalDTO tdto2 = new RoomTotalDTO();
		 memDTO memdto = this.rdao.roomContentMember(tdto.getM_no());
		 System.out.println("방 올린사람 닉네임^^ => "+memdto.getM_nick());
		 
		 tdto2.setR_no(r_no); 
		 tdto2.setM_no((int) session.getAttribute("m_no"));
		 Boolean likeView = this.rdao.likeView(tdto2);
		 
		 System.out.println(tdto.getR_photo());
		 String [] photosrc = tdto.getR_photo().split("/");			
		
		 model.addAttribute("cont", tdto);  // 방 전체 정보
		 model.addAttribute("mem", memdto); // 방 올린 사람의 대한 정보
		 model.addAttribute("like", likeView); // 찜 정보
		 model.addAttribute("photosrc", photosrc); // 첫번째 사진 정보
		return "view_room_cont";
		
		} else {
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			  out.println("<script>");
			  out.println("alert('로그인 후 이용하세요')");
			  out.println("history.back()");
			  out.println("</script>");
			  out.flush();
			return null;
		}
		
	}
	
	
	@RequestMapping(value = "/change", method = RequestMethod.POST)
	@ResponseBody
	public String change(@RequestParam String flag, HttpSession session, @RequestParam int r_no) {
		/*
		 * String result = ("plus".equals(flag)) ? String.valueOf(++count):
		 * String.valueOf(--count);
		 */
		int m_no = (int)session.getAttribute("m_no");
		
		System.out.println("좋아요 회원 넘버 "+ m_no);
		System.out.println("방 넘버 "+ r_no);
		
		String result2 = "";
		RoomTotalDTO tdto = new RoomTotalDTO();
		
		if("plus".equals(flag)) {
			result2 = String.valueOf(1);
			System.out.println("좋아요");
			tdto.setR_no(r_no);
			tdto.setM_no(m_no);
			 this.rdao.likeOn(tdto); 
		} else {
			result2 = String.valueOf(0);
			System.out.println("좋아요 취소");
			tdto.setR_no(r_no);
			tdto.setM_no(m_no);
			 this.rdao.likeOff(tdto);  
		}
		
		JsonObject jo = new JsonObject();
		jo.addProperty("count", result2);
		return jo.toString();
	}
	
	
	

	@ResponseBody
	@RequestMapping("/delete_room.do")
	public String delete_room(@RequestParam(value="checkBoxArr[]") List<String> checkboxList, HttpServletResponse response) throws IOException {
		
		List<String> list = new ArrayList<>();
        for(String checkbox : checkboxList) {
            list.add(checkbox);
        }
        System.out.println(list);
		/* this.rdao.deleteRoom(list); */  
		
		return null;
		
	}
	
  
}
