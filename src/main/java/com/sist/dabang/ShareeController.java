package com.sist.dabang;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.print.attribute.standard.SheetCollate;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.model.CommentsDTO;
import com.sist.model.ShareeDAO;
import com.sist.model.ShareeDAOimpl;
import com.sist.model.ShareeDTO;

@Controller
public class ShareeController {

	@Autowired
	private ShareeDAO dao;
	

	@RequestMapping("/share_room.do")
	public String share_room(Model model) {
		List<ShareeDTO> list = this.dao.getList();
		model.addAttribute("List",list);
		return "share_room";
	}
	
	@RequestMapping("/share_room_upload.do")
	public String share_room_upload() {

		return "share_room_upload";
	}
	@RequestMapping("/share_ok.do")
	public String share_room_ok(ShareeDTO dto,Model model,MultipartHttpServletRequest mtfRequest) throws UnsupportedEncodingException {
		List<MultipartFile> fileList = mtfRequest.getFiles("file");

        String path = "C:\\image\\";
        String safeFile2 ="";
        for (MultipartFile mf : fileList) {
            String originFileName = mf.getOriginalFilename(); // 원본 파일 명
            long fileSize = mf.getSize(); // 파일 사이즈
            if(fileSize>0) {
	            System.out.println("originFileName : " + originFileName);
	            System.out.println("fileSize : " + fileSize);
	
	           String safeFile =  path + System.currentTimeMillis() + originFileName;
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
		dto.setS_src(safeFile2);
		this.dao.insertBoard(dto);
		
		return "redirect:share_room.do";
	}
	
	@RequestMapping("/share_cont.do")
	public String share_cont(@RequestParam("s_no") int s_no,Model model) {
		ShareeDTO dto=this.dao.content(s_no);
		List<CommentsDTO> List=this.dao.List_s_Comments(s_no);
		
		model.addAttribute("cont",dto);
		model.addAttribute("comment",List);
		return "share_cont2";
	}
	
	 @RequestMapping(value="/s_comment_add.do")
	    @ResponseBody
	    public String ajax_addComment(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request) throws Exception{
	        
	        HttpSession session = request.getSession();
		// CommentsDTO loginVO = (CommentsDTO)session.getAttribute("loginVO");
	        
	        try{
	        
			// dto.setC_id(loginVO.getUser_id()); 
	            this.dao.insert_s_Comments(dto);
	            
	        } catch (Exception e){
	            e.printStackTrace();
	        }
	        
	        return "success";
	}
	
	@RequestMapping(value="/s_comment.do", produces="application/json; charset=utf8")
	@ResponseBody
	public ResponseEntity share_commnet(@ModelAttribute("CommentsDTO") CommentsDTO dto,HttpServletRequest request) throws Exception  {
		
		HttpHeaders responseHeaders = new HttpHeaders();
		ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
		
		List<CommentsDTO> c_DTO = this.dao.List_s_Comments(dto.getS_no());
		
		if(c_DTO.size()>0) {
			for(int i=0; i<c_DTO.size(); i++) {
				HashMap hm = new HashMap();
				 
					 hm.put("c_no", c_DTO.get(i).getC_no());
					 hm.put("s_no", c_DTO.get(i).getS_no());
					 hm.put("c_id", c_DTO.get(i).getC_id());
		             hm.put("c_cont", c_DTO.get(i).getC_cont());
		             hm.put("c_date", c_DTO.get(i).getC_date());   
		             hm.put("c_group", c_DTO.get(i).getC_group());   
		             hm.put("c_step", c_DTO.get(i).getC_step());   
		             hm.put("c_indent", c_DTO.get(i).getC_indent());
		             hm.put("c_check1", c_DTO.get(i).getC_check1());
		             hm.put("c_replyid", c_DTO.get(i).getC_replyid());
		             hmlist.add(hm);
	            }
	            
	        }
	        
	        JSONArray json = new JSONArray(hmlist);        
	        return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
		
	}


	
	 @RequestMapping(value="/s_comment_dele.do")
	 @ResponseBody
	 public String s_commnet_del(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request) throws Exception{
	        
 	//  HttpSession session = request.getSession(); 
  	//  CommentsDTO loginVO = (CommentsDTO)session.getAttribute("loginVO"); 
	       
		 try{
			 if(this.dao.s_Commentscheck(dto.getC_group()).getC_no()==dto.getC_no()) {
				// dto.setC_id(loginVO.getUser_id()); 
		         this.dao.delete_s_Comments(dto.getC_no());
		         this.dao.delete2_s_Comments(dto.getC_group());
			 }
			 else {
				 this.dao.delete_s_Comments(dto.getC_no());
			 }
	        } catch (Exception e){
	            e.printStackTrace();
	        }
	        
	        return "success";
	}

	
	 @RequestMapping(value="/s_comment_update.do")
	 @ResponseBody
	 public String s_commnet_update(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request) throws Exception{
	        
 	 // HttpSession session = request.getSession(); 
  	 // CommentsDTO loginVO = (CommentsDTO)session.getAttribute("loginVO"); 
	       
		 try{
	        
			// dto.setC_id(loginVO.getUser_id()); 
			 	
			this.dao.update_s_Comments(dto);
	            
	        } catch (Exception e){
	            e.printStackTrace();
	        }
	        
	        return "success";
	} 

	 @RequestMapping(value="/s_replycomment_update.do")
	 @ResponseBody
	 public String s_replycommnet_insert(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request) throws Exception{
		 
		 // HttpSession session = request.getSession(); 
		 // CommentsDTO loginVO = (CommentsDTO)session.getAttribute("loginVO"); 
		 
		 try{
			 
			 // dto.setC_id(loginVO.getUser_id()); 
			 
			 this.dao.insert_s_replyComments(dto);
			 
		 } catch (Exception e){
			 e.printStackTrace();
		 }
		 
		 return "success";
	 } 
	

}
