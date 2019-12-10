package com.sist.dabang;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.model.CommentsDTO;
import com.sist.model.SearchDTO;
import com.sist.model.ShareeDAO;
import com.sist.model.ShareeDTO;

@Controller
public class ShareeController {

   @Autowired
   private ShareeDAO dao;
   

   @RequestMapping("/share_room.do")
   public String share_room(Model model,HttpSession session, HttpServletRequest request) {
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
      
      totalRecord = dao.getcount();
      
      allPage = (int)(Math.ceil(totalRecord / (double)rowsize));  // ceil 함수는 나머지가 발생하면 자동으로 올림해주는 메서드
      
      if (endBlock > allPage) {
         endBlock = allPage;
      }
      
      List<ShareeDTO> list = this.dao.getList(page, rowsize);
      for(int i=0; i<list.size(); i++) {
         list.get(i).setS_Comments_count(this.dao.S_Comments_count(list.get(i).getS_no()));
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
      
      model.addAttribute("List",list);
      
      return "share_room";
   }
   
   @RequestMapping("/share_room_upload.do")
   public String share_room_upload(HttpSession session,ShareeDTO dto,Model model) {
      System.out.println("세션 값 테스트 " + session.getAttribute("m_no"));
      System.out.println("세션 값 테스트 " + session.getAttribute("m_nick"));
      
      if(dto.getS_no()!=0) {
         ShareeDTO u_dto=this.dao.content(dto.getS_no());
         model.addAttribute("cont",u_dto);
      }
      if(dto.getS_group()!=0) {
         model.addAttribute("reply",dto);
      }
      return "share_room_upload";
   }
   @RequestMapping("/share_search.do")
   public String share_room_search(HttpSession session,ShareeDTO dto,Model model,HttpServletRequest request) {
      String find_field = request.getParameter("find_field").trim();
      System.out.println(find_field + "=find_field");
      String find_name =  request.getParameter("find_name").trim();
      System.out.println(find_name + "=find_name");
      
      //   페이징 처리s
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

   
      totalRecord = dao.getSearchcount(find_field, find_name); // 전체 게시글의 수를 저장해 줌
   
      // 전체 게시글의 수를 한 페이지당 보여질 게시물의 수로 나누어준다.
      // 이러한 작업을 거치면 전체 페이지가 나온다.
      // 전체 페이지가 나올 때 나머지가 있으면 무조건 올려주어야 한다.
   
      allPage = (int)(Math.ceil(totalRecord / (double)rowsize));  // ceil 함수는 나머지가 발생하면 자동으로 올림해주는 메서드
      
      if (endBlock > allPage) {
         endBlock = allPage;
      }

      List<ShareeDTO> list = dao.getSearchlist(find_field, find_name, page, rowsize);
      for(int i=0; i<list.size(); i++) {
         list.get(i).setS_Comments_count((this.dao.S_Comments_count(list.get(i).getS_no())));
      }
      System.out.println(find_field);
      System.out.println(find_name);
      System.out.println(page);
      
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
      
      model.addAttribute("List",list);
      
      return "share_room";
   }
   
   @RequestMapping("/share_room_delete.do")
   public String share_room_delete(ShareeDTO dto,SearchDTO s_dto,Model model,HttpServletRequest request) {
      //체크박스로 여러개 삭제하는 기능 추가.
      if(dto.getS_checkno()!=null) {
      String[] s_no = dto.getS_checkno().split(",");
      
      List<Integer> list = new ArrayList<Integer>();
      
      for (int i=0; i<s_no.length; i++) {
         
         
         list.add(Integer.parseInt(s_no[i]));
         
           ShareeDTO u_dto=this.dao.content(Integer.parseInt(s_no[i]));
            String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
            if(u_dto.getS_src()!=null) {   
               String[] src=u_dto.getS_src().split("/");
               
               for(int j=0; j<src.length; j++) {
                  File file = new File(safeFile+src[j]);
                  
                  file.delete();
               }
               
            }
            if(dao.groupcount(u_dto.getS_group()) !=0) {
               
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
         ShareeDTO u_dto=this.dao.content(dto.getS_no());
         String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
         if(u_dto.getS_src()!=null) {   
            String[] src=u_dto.getS_src().split("/");
            
            for(int i=0; i<src.length; i++) {
               File file = new File(safeFile+src[i]);
               System.out.println(file);
               file.delete();
            }
            
         }
         if(dao.groupcount(u_dto.getS_group()) !=0) {
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
         dao.deleteBoard(dto.getS_no());
      }
      if(s_dto.getFind_name()==null){
         System.out.println("aas");
         return "redirect:share_room.do";
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
         return "redirect:share_search.do?find_field="+find_field+"&find_name="+find_name+"&page="+page+"";
      }
      
   }
   @RequestMapping("/share_ok.do")
   public String share_room_ok(ShareeDTO dto,Model model,MultipartHttpServletRequest mtfRequest,HttpSession session,@RequestParam("put") List<String> put) throws UnsupportedEncodingException {
      List<MultipartFile> fileList = mtfRequest.getFiles("file");
      String safeFile2 ="";
      //사진 수정
      if(dto.getS_no()!=0) {
         String safeFile = "C:\\Users\\leeseokho\\Documents\\SpringDabang\\src\\main\\webapp\\";
         /*
          * String cheackFile = "http://localhost:8484/dabang/resources/Shereuploads/";
          */
         ShareeDTO u_dto=this.dao.content(dto.getS_no());
         if(u_dto.getS_src() !=null) {
         String[] src=u_dto.getS_src().split("/");
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
      
      System.out.println(dto.getS_no());
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
      dto.setS_src(safeFile2);
      dto.setS_writer((String)session.getAttribute("m_nick"));
      if(dto.getS_no()!=0) {
         this.dao.updateBoard(dto);
      }else if(dto.getS_group()!=0) {
         this.dao.replyinsertBoard(dto);
      }else {
         this.dao.insertBoard(dto);
      }
      return "redirect:share_room.do";
   }
   
   @RequestMapping("/share_cont.do")
   public String share_cont(@RequestParam("s_no") int s_no,Model model,HttpSession session,HttpServletRequest request) {
      this.dao.readCount(s_no);
      ShareeDTO dto=this.dao.content(s_no);
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
      
      totalRecord = dao.S_Comments_count(s_no);//
      
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
      
      if(this.dao.S_next_Board(dto.getS_group())!=null) {
      ShareeDTO next=this.dao.S_next_Board(dto.getS_group());
      next.setS_Comments_count((this.dao.S_Comments_count(next.getS_no())));
      model.addAttribute("next",next);
      }
      if(this.dao.S_pre_Board(dto.getS_group())!=null) {
      ShareeDTO pre=this.dao.S_pre_Board(dto.getS_group());
      pre.setS_Comments_count((this.dao.S_Comments_count(pre.getS_no())));
      model.addAttribute("pre",pre);
      }
      /* List<CommentsDTO> List=this.dao.List_s_Comments(s_no,page, rowsize); */
      
      /*
       * String a=(String)session.getAttribute("m_nick"); System.out.println(a);
       */
      /*
       * ArrayList<String> list2= new ArrayList(); if(dto.getS_src()!=null) { String[]
       * src=dto.getS_src().split("/"); for(int i=0; i<src.length; i++) {
       * System.out.println(src[i]); list2.add(src[i]); }
       * 
       * } model.addAttribute("src",list2);
       */
      if(this.dao.groupcount(dto.getS_group())>1) {
         List<ShareeDTO> groupdto=this.dao.groupList(dto.getS_group());
         
         for(int i=0; i<groupdto.size(); i++) {
            groupdto.get(i).setS_Comments_count((this.dao.S_Comments_count(groupdto.get(i).getS_no())));
         }
         model.addAttribute("groupdto",groupdto);
      }
      
      
      
      
      model.addAttribute("cont",dto);
      
      
      /* model.addAttribute("comment",List); */
      model.addAttribute("nick", session.getAttribute("m_nick"));
      model.addAttribute("groupcount", this.dao.groupcount(dto.getS_group()));
      /* model.addAttribute("ses",a); */
      
      return "share_cont2";
   }

   
    @RequestMapping(value="/s_comment_add.do")
       @ResponseBody
       public String ajax_addComment(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
           
          
           try{
           
              dto.setC_id((String)session.getAttribute("m_nick")); 
               this.dao.insert_s_Comments(dto);
               
           } catch (Exception e){
               e.printStackTrace();
           }
           
           return "success";
   }
   
   @RequestMapping(value="/s_comment.do", produces="application/json; charset=utf8")
   @ResponseBody
   public ResponseEntity share_commnet(@ModelAttribute("CommentsDTO") CommentsDTO dto,HttpServletRequest request,HttpSession session) throws Exception  {
      
      HttpHeaders responseHeaders = new HttpHeaders();
      ArrayList<HashMap> hmlist = new ArrayList<HashMap>();
      List<CommentsDTO> c_DTO = this.dao.List_s_Comments(dto.getS_no(),dto.getC_page(),dto.getC_rowsize());
      ShareeDTO dto2=this.dao.content(dto.getS_no());
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
                   hm.put("session", (String)session.getAttribute("m_nick"));
                   hm.put("s_writer", dto2.getS_writer());
                   hmlist.add(hm);
               }
               
           }
           
           JSONArray json = new JSONArray(hmlist);        
           return new ResponseEntity(json.toString(), responseHeaders, HttpStatus.CREATED);
      
   }


   
    @RequestMapping(value="/s_comment_dele.do")
    @ResponseBody
    public String s_commnet_del(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
           
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
    public String s_commnet_update(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
           
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
    public String s_replycommnet_insert(@ModelAttribute("CommentsDTO") CommentsDTO dto, HttpServletRequest request,HttpSession session) throws Exception{
       

       
       try{
          
         
          dto.setC_id((String)session.getAttribute("m_nick")); 
          this.dao.insert_s_replyComments(dto);
          
       } catch (Exception e){
          e.printStackTrace();
       }
       
       return "success";
    } 
   

}