<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">

<link rel="stylesheet" href="resources/css/uc.min.css">
<link rel="stylesheet" href="resources/css/basic.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/slick-theme.css">
<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/layout.css">

<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/uc.lib.min.js"></script>
<script src="resources/js/uc.plugin.min.js"></script>
<script src="resources/js/slick.min.js"></script>
<script src="resources/js/common.js"></script>
    <title>청춘다방</title>
</head>
<script>
	function delete_room(){
  	 var checkBoxArr = [];
  	
  	  	  	 
     $("input[name=checkbox]:checked").each(function(i){
     checkBoxArr.push($(this).val());
     });  
     console.log(checkBoxArr);

     var objParams = {
             "checkBoxArr" : checkBoxArr        //과일배열 저장
         };
     
	//ajax 호출
		$.ajax({
			url : "delete_room.do",
			dataType : "json",
			contentType : "application/x-www-form-urlencoded; charset=UTF-8",
			type : "post",
			data : objParams,
			success : function(objParams) {
				 alert("성공");
	             location.replace("${pageContext.request.contextPath}/main_room.do");
			},
			error : function(data) {
				console.log(data);
				if(data){
					
				alert("삭제 완료");
				location.replace("${pageContext.request.contextPath}/my_room_3.do");
				} else if(data===""){
					alert("삭제 실패");
					location.replace("${pageContext.request.contextPath}/my_room_3.do");
					}
			}
		});
  	  	 
	}
</script>
<body>
    <!--header-->
    <%@ include file="../../resources/include/header.jsp"%>

    <div class="container">
        <div class="mypage my1 my1-1">



            <!--sub_top-->
            <div class="sub_top top6">
                <b class="title"><img src="resources/images/sub/sub6_top_img.png" alt="">마이페이지</b>
            </div>

            <!--tab_menu-->
            <div class="tab_menu menu4">
                <ul>
                   <li><a href="<%=request.getContextPath() %>/my_room_1.do">찜한 방</a></li>
                    <li class="on"><a href="<%=request.getContextPath() %>/my_room_3.do">나의 방</a></li>
                    <li><a href="<%=request.getContextPath() %>/my_room_4.do">회원 정보 수정</a></li>
                </ul>
            </div>

            <!--tab_content-->
            <div class="tab_content">
                <div id="tab1">
                   <div class="wrap">
            <%-- <form method="post" action="<%=request.getContextPath()%> /delete_room.do"> --%>
                       <table>
                           <thead>
                               <tr>
                                   <th width="70px;"></th>
                                   <th>제목</th>
                                   <!-- <th>상태</th> -->
                                   <th>등록일</th>
                               </tr>
                           </thead>
					<c:set var="list" value="${List }"/>           
                           <tbody>
                           <c:forEach items="${list }" var="tdto" varStatus="status">
                               <tr>
                                   <td>
                                       <input type="checkbox"  name="checkbox"  title="" value="${tdto.getR_no() }">
                                       <c:out value="${tdto.getR_no() }"/>
                            <label for="ck1"><span></span></label>
                                   </td>
                                   <td>
                                       <div class="img_area">
                                           <a href="room_cont.do?r_no=${tdto.getR_no() }"><img style="width:150px; height:150px;" src="${tdto.getR_photoOne() }" alt=""></a>
                                       </div>
                                       <div class="txt_area">
                                          <b>${ tdto.getR_detail()}</b>
                                           <span class="import">월세) ${ tdto.getR_rentfee()}</span>
                                           <ul class="info">
                                               <li>${ tdto.getR_detail()}</li>
                                               <li>${ tdto.getR_floor()}층, ${ tdto.getR_dimension()}m² (7P), 관리비 ${ tdto.getR_utility()}</li>
                                           </ul>
                                           
                                           <c:if test="${tdto.getR_btype() eq '원,투룸'}">
                                           <a href="<%=request.getContextPath() %>/upload_room.do?r_no=${tdto.getR_no() }" class="btn btn_yellow btn_modify">수정하기</a>
                                           </c:if>
                                           <c:if test="${tdto.getR_btype() eq '홈스테이' }">
                                           <a href="<%=request.getContextPath() %>/upload_room_2.do?r_no=${tdto.getR_no() }" class="btn btn_yellow btn_modify">수정하기</a>
                                           </c:if>
                                           <c:if test="${tdto.getR_btype() eq '셰어하우스' }">
                                           <a href="<%=request.getContextPath() %>/upload_room_3.do?r_no=${tdto.getR_no() }" class="btn btn_yellow btn_modify">수정하기</a>
                                           </c:if>
                                           <c:if test="${tdto.getR_btype() eq '단기임대' }">
                                           <a href="<%=request.getContextPath() %>/rent_room_upload.do?r_no=${tdto.getR_no() }" class="btn btn_yellow btn_modify">수정하기</a>
                                           </c:if>
                                       </div>
                                   </td>
                                   <!-- 거래 여부, 날짜 보류  -->
                                  <!--  <td>거래중</td> -->
                                   <td>${tdto.getR_date().substring(2,10) } </td>
                               </tr>
                               </c:forEach>
                           </tbody>
                       </table>
                       <!-- <input type="submit" class="btn btn_yellow btn_delete" value="삭제하기"> -->
                       <a onclick="delete_room()" class="btn btn_yellow btn_delete">삭제하기</a>
                       
                       <!-- </form> -->
                </div>
                </div>
            </div>


        </div>
    </div>

   <!-- 하단 시작 -->
    <footer class="footer">
        <div class="is-frame-md is-relative">
            <div class="is-area-top">
                <ul>
                    <li class=""><a href="#">회사소개</a></li>
                    <li class=""><a href="#">이용약관</a></li>
                    <li class=""><a href="#">개인정보 처리방침</a></li>
                    <li class=""><a href="#">위치기반</a></li>
                    <li class=""><a href="#">중개사 사이트 바로가기</a></li>
                </ul>
            </div>
            <div class="is-area-mid">
                <p><span>상호: </span><span>대표: </span><span>사업자등록번호: </span></p>
                <p><span>주소: </span></p>
                <p><span>팩스: </span><span>통신판매업 신고번호: </span></p>
                <p><span>서비스 이용문의: </span><span>이메일: </span><span>서비스제휴문의: </span></p>
            </div>
            <div class="is-area-bot">
                <!-- 아이콘 필요 -->   
                <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
                <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
                <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
                <a href="#" class="is-btn-transparent"><img src="" alt=""></a>
                <p class="is-copyright">Copyright .All Rights Reserved.</p>
            </div>
        </div>
    </footer>
    <!-- 하단 끝 -->




</body>

</html>
