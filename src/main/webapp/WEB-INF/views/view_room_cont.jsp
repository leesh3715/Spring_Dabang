<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" href="resources/css/changeBtn.css">
   <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
   <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&amp;subset=korean" rel="stylesheet">
   <link rel="stylesheet" href="resources/css/style_sub2_3.css">
   <link rel="stylesheet" href="resources/css/uc.min.css">
   <link rel="stylesheet" href="resources/css/basic.css">
   <link rel="stylesheet" href="resources/css/slick.css">
   <link rel="stylesheet" href="resources/css/slick-theme.css">
   <link rel="stylesheet" href="resources/css/layout.css">
   <link rel="stylesheet" href="resources/plugins/fonts/line-awesome.css">
   <link rel="stylesheet" href="resources/plugins/owlCarousel/owl.carousel.min.css">
   <link rel="stylesheet" href="resources/plugins/owlCarousel/owl.theme.default.min.css">
   <link rel="stylesheet" href="resources/plugins/jquery-ui/jquery-ui.css">
   <link rel="stylesheet" href="resources/plugins/slick/slick.css">
   
	
<script src="resources/plugins/slick/slick.min.js"></script>

  
   <script src="resources/js/jquery-3.3.1.min.js"></script>
   <script src="resources/js/uc.lib.min.js"></script>
   <script src="resources/js/uc.plugin.min.js"></script>
   <script src="resources/js/slick.min.js"></script>
   <script src="resources/js/common.js"></script>
   
</head>
<body>
      <%@ include file="../../resources/include/header.jsp"%>
      
   
<c:set var="tdto" value="${cont }"/>

   <div id="view">
         <div class="is-modal-dialog">
            <div>
               <div class="is-panel-head is-pd-b_0" >
                  <div style="margin-top: 30px;">
                    <div class="is-col-xs2">
                    </div>
                    <div class="is-col-xs4" style="margin-right: 50px;">
                       
                    </div>
                  
                 </div>
               </div>
               <div class="is-panel-body" >
                  <div>
                      <div class="is-col-xs2">
                      </div>
                     <div class="is-col-xs4" style="margin-right: 50px;"  > 
                        <div>
                           <ul class="slider-for2">
                  			<c:forTokens  var="photosrc" items="${tdto.getR_photo() }" delims="/">
                              <li><img style="width: 440px; height: 300px;"src="${photosrc }" alt="" /></li>
							</c:forTokens>
                           </ul>
                        </div>
                        <div class="is-mg-t_20">
                           <ul class="slider-nav2">
                            <c:forTokens  var="photosrc" items="${tdto.getR_photo() }" delims="/">
                              <li><img style="width: 110px; height: 73px;" src="${photosrc }" alt="" /></li>
							</c:forTokens>
                           </ul>
                        </div>
                     </div>
                     <div class="is-col-xs4" style=" margin-top: 40px;">
                       <div>
                           <div>
                              
                              <div class="is-col-xs8">
                              <span style="white-space:nowrap;">#주소 #${tdto.getR_address()}</span>
                              </div >
                              <div class="is-col-xs4" style="text-align: right; margin-bottom: 10px;">                              
                                 <a href="#call" style="margin-right: 15px;" data-uc-click="modal"><img src="resources/images/sub_2_3/icon/13.png" alt="" /></a>
                                 
					<c:set var="likeView" value="${like}" />
					
					<c:if test="${likeView eq false }">
					<input type="button" id="btnLike" style="
					background:url('resources/images/empty_heart1.png') no-repeat;
					border:none;
					width:30px;
					height:30px;
					background-size:contain;
					position: relative;
					top: 11px;
					"/>
					
					</c:if>
					
					<c:if test="${likeView eq true }">
					<input type="button" id="btnLike" style="
					background:url('resources/images/full_heart1.png') no-repeat;
					border:none;
					width:30px;
					height:30px;
					background-size:contain;
					position: relative;
					top: 11px;
					"/>
					
					</c:if>
					
					<script type="text/javascript">
      
      var isLike = false;
		
   // Like button
		var isLike = false;
		
		$('#btnLike').on('click', function(){
			let flag = isLike ? 'minus' : 'plus';
			let r_no = ${tdto.getR_no()};
			
			$.ajax({
				  method: "POST",
				  url: "${pageContext.servletContext.contextPath}/change",
				  data: { 
						flag: flag,
						r_no: r_no	
					  }
			})
			.done(function( msg ) {
				let jsonObj = JSON.parse(msg); // text to JsonObject
				$('#likeCount').text(jsonObj.count);
				 //$('#likeCount').text(msg);
				 isLike = !isLike;
				 if(isLike){ // click Like
					 $('#btnLike').css('background', 'url("resources/images/full_heart1.png" ) no-repeat');
				 }else{ // cancel Like
					 $('#btnLike').css('background', 'url("resources/images/empty_heart1.png" ) no-repeat');
				 }
				 $('#btnLike').css('background-size', 'contain');
			});
		});

</script>
					
				
				
                              </div >
                           </div>
                           <table class="is-table-hor">
                              <thead>
                                 <tr>
                                    <th>인실</th>
                                    <th>월세/보증금</th>
                                    <th>전세</th>
                                    <th>관리비</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <tr>
                                 
                                 	<c:if test="${tdto.getR_person() ne null }">
                                    <td>${ tdto.getR_person() }</td>
                                    </c:if>
                                    <c:if test="${tdto.getR_person() eq null }">
                                    <td>-</td>
                                    </c:if>
                                    
                                    <c:if test="${tdto.getR_rentfee() ne null }">
                                    <td>${ tdto.getR_rentfee() } </td>
                                    </c:if>
                                    <c:if test="${tdto.getR_rentfee() eq null }">
                                    <td>-</td>
                                    </c:if>
                                    
                                    
                                    <c:if test="${tdto.getR_deposit() ne null }">
                                    <td>${ tdto.getR_deposit()}</td>
                                    </c:if>
                                    <c:if test="${tdto.getR_deposit() eq null }">
                                    <td>-</td>
                                    </c:if>
                                    
                                    <c:if test="${tdto.getR_utility() ne null }">
                                    <td>${ tdto.getR_utility()}</td>
                                    </c:if>
                                    
                                    <c:if test="${tdto.getR_utility() eq null }">
                                    <td>-</td>
                                    </c:if>
                                    
                                 </tr>
                              </tbody>
                           </table>
                          
                           
                       </div>
                       <div style="margin-top: 50px; margin-bottom: 50px;">
                        <div>
                           <p class="is-col-xs6 is-align-mid is-txt-left">층/건물층수 : ${tdto.getR_floor().split("/")[0]}층/${tdto.getR_floor().split("/")[1]}층</p>
                           
                           <p class="is-col-xs6 is-align-mid is-txt-right">전용면적 : ${tdto.getR_dimension().split("/")[0] }m² / ${tdto.getR_dimension().split("/")[1] }평</p>
                        </div>
                        <div >
                              
                              
             
                           <p class="is-col-xs12 is-align-mid is-txt-left">관리비 포함항목 : 수도, 인터넷, TV</p>
                        </div>
                        <div >
                           <c:set var="exist" value="O"/>
                           <c:set var="no_exist" value="X"/>
                           
                           <c:if test="${tdto.getO_pet() eq !null }">
                           <p class="is-col-xs6 is-align-mid is-txt-right">반려동물 : ${exist }</p>
                           </c:if>
                           <c:if test="${tdto.getO_pet() eq 'null' }">
                           <p class="is-col-xs6 is-align-mid is-txt-left">반려동물 : ${no_exist }</p>
                           </c:if>
                           
                     <c:if test="${tdto.getO_balcony() eq !null }">
                           <p class="is-col-xs6 is-align-mid is-txt-right">베란다/발코니 : ${exist }</p>
                           </c:if>
                           <c:if test="${tdto.getO_balcony() eq 'null' }">
                           <p class="is-col-xs6 is-align-mid is-txt-right">베란다/발코니 : ${no_exist} </p>
                           </c:if>
                           
                        </div>
                        <div>
                           <p class="is-col-xs6 is-align-mid is-txt-left">난방종류 : ${tdto.getR_heating() }</p>
                           <p class="is-col-xs6 is-align-mid is-txt-right">입주가능일 : ${tdto.getR_movedate() }</p>
                        </div>
                        </div>
                        <%-- 옵션 이미지 부분 --%>
                        <div class="is-mg-t_10">
                           <ul class="columns-xs6">
                             
                              <c:if test="${tdto.getO_tv() == null }">
                              <li class="is-col"><img src="resources/images/sub_2_3/icon/1.png"></li>                                                       
                           </c:if>

                              <c:if test="${tdto.getO_tv() == 'on' }">
                     <li class="is-col"><img src="resources/images/sub_2_3/icon/1_1.png"></li>
                           </c:if>
                           
                          <c:if test="${tdto.getO_desk() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/2.png"></li>
                           </c:if>
                           
                           <c:if test="${tdto.getO_desk() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/2_1.png">                     
                           </c:if>     
                           
                               <c:if test="${tdto.getO_bed() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/3.png"></li>
                           </c:if>
                           
                           <c:if test="${tdto.getO_bed() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/3_1.png">                     
                           </c:if>     
                              
                               <c:if test="${tdto.getO_stove() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/4.png"></li>
                           </c:if>
                           
                           <c:if test="${tdto.getO_stove() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/4_1.png">                     
                           </c:if>
                                
                            <c:if test="${tdto.getO_closet() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/5.png"></li>
                           </c:if>
                           
                           <c:if test="${tdto.getO_closet() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/5_1.png">                     
                           </c:if>     
                           
                           <li class="is-col"><a href="#detail" data-uc-click="modal"><img src="resources/images/sub_2_3/icon/6.png"></a>
                                                           
                           </ul>
                        </div>
                        <div >
                           <ul class="columns-xs6">
                              <c:if test="${tdto.getO_parking() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/7.png"></li>
                           </c:if>
                           <c:if test="${tdto.getO_parking() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/7_1.png">                     
                           </c:if>
                           
                             <c:if test="${tdto.getO_elevator() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/8.png"></li>
                           </c:if>
                           <c:if test="${tdto.getO_elevator() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/8_1.png">                     
                           </c:if>
                           
                           <c:if test="${tdto.getO_ac() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/9.png"></li>
                           </c:if>
                           <c:if test="${tdto.getO_ac() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/9_1.png">                     
                           </c:if>
                           
                           <c:if test="${tdto.getO_micro() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/10.png"></li>
                           </c:if>
                           <c:if test="${tdto.getO_micro() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/10_1.png">                     
                           </c:if>
                           
                           <c:if test="${tdto.getO_laundry() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/11.png"></li>
                           </c:if>
                           <c:if test="${tdto.getO_laundry() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/11_1.png">                     
                           </c:if>
                           
                             <c:if test="${tdto.getO_refri() == null }">
                               <li class="is-col"><img src="resources/images/sub_2_3/icon/12.png"></li>
                           </c:if>
                           <c:if test="${tdto.getO_refri() == 'on' }">
                        <li class="is-col"><img src="resources/images/sub_2_3/icon/12_1.png">                     
                           </c:if>
                            
                           </ul>
                        </div>
                        <div class="is-mg-t_10">
                           <!-- <img src="resources/images/sub_2_3/6.jpg" alt="" /> -->
                        </div>
                     
                     <div class="is-col-xs2">
                      </div>
                    </div>
                  </div>  
               </div>
            </div>
         </div>
      </div>
      <script type="text/javascript">
         $(function () { 
            $('.slider-nav2').slick({
               slidesToShow: 4,
               slidesToScroll: 1,
               dots: false,
               arrows: false,
               asNavFor: '.slider-for2',
               centerMode: false,
               focusOnSelect: true,
               infinite: false
            });
            $('.slider-for2').slick({
               slidesToShow: 1,
               slidesToScroll: 1,
               arrows: true,
               prevArrow: '<span style="position: absolute; top: 50%; left: 15px; z-index: 9999; cursor: pointer;"><img src="resources/images/sub_2_3/icon/16.png" alt="" ></span>',
               nextArrow: '<span style="position: absolute; top: 50%; right: 15px; z-index: 9999; cursor: pointer;"><img src="resources/images/sub_2_3/icon/17.png" alt="" ></span>',
               fade: true,
               centerMode: false,
               asNavFor: '.slider-nav2'
            });
         });
      </script>
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
      
      <!-- detail modal  -->
       <div id="detail" data-uc-modal>
			<div class="is-modal-dialog">
				<div data-uc-panel>
					<div class="is-panel-head is-pd-b_0">
						<h3>
							상세 내용
						</h3>
						<a href="#fakelink" data-uc-dismiss="modal"><img src="resources/images/sub_2_3/icon/15.png" alt="" /></a>
					</div>
					<div class="is-panel-body">
						<div class="is-txt-center">
							
							<p class="is-addr">${tdto.getR_detail()}</p>
						</div>
					</div>
					
				
				</div>
			</div>
		</div>
      <!-- call modal   -->
      
      <c:set var="memberdto" value="${mem}" />

      <div id="call" data-uc-modal>
            <div class="is-modal-dialog">
                <div data-uc-panel>
                    <div class="is-panel-head is-pd-b_0">
                        <h3>
                            연락처 보기
                        </h3>
                        <a href="#fakelink" data-uc-dismiss="modal"><img src="resources/images/sub_2_3/icon/15.png" alt="" /></a>
                    </div>
                    <div class="is-panel-body">
                        <div class="is-txt-center">
                            <img src="resources/images/sub_2_3/icon/18.png" alt="" />
                           <p class="is-name">${memberdto.getM_nick() }</p>
                     <p class="is-addr" style="white-space:nowrap;">${tdto.getR_address()}</p>
                     <p class="is-phone">${memberdto.getM_phone() }</p>
                        </div>
                    </div>
                    <form method="post" action="<%=request.getContextPath()%>/smsSend.do">
                    <div class="is-panel-foot is-pd-t_0">
                        <div class="is-txt-left">
                            <p class="is-ye">연락 요청</p>
                            <p>하실 말씀을 남겨주시면, 확인 후 연락드립니다.</p>
                               <input type="text" name="send_text" style="width: 65%">
                                <input type="submit" value="문자 전송">
                            <div class="input-call">
                               <input type="hidden" value="${tdto.getR_address() }" name="send_address">
                        		<input type="hidden" value="${memberdto.getM_phone() }" name="send_phone">
                                <input type="hidden" value="${memberdto.getM_nick() }" name="send_nick">
                                <!-- <a href="#">연락받기</a> -->
                            </div>
                        </div>
                    </div>
                    </form>
                </div>
            </div>
        </div>
</body>
<script src="resources/plugins/owlCarousel/owl.carousel.min.js"></script>
<script>

   $('.owl-carousel').owlCarousel({
      loop: true,
      margin: 10,
      nav: true,
      dots: true,
      responsive: {
         0: {
            items: 1
         },
         600: {
            items: 3
         },
         1000: {
            items: 5
         }
      }
   })
</script>
</html>