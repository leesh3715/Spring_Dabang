<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>서브3</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	<link rel="stylesheet" href="resources/plugins/fonts/line-awesome.css">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/basic.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/slick-theme.css">
	<link rel="stylesheet" href="resources/css/style_sub1.css">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/sub3.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51f66e54fd5e327b654103d5fc9ca1&libraries=services"></script>

<script>
	var searchval = '${searchval}';
	window.onload = function() {
		$("#searchval").text(searchval + "(으)로 검색한 결과입니다.");
		}	
</script>
</head>

<body>
	<div>
		<%@ include file="../../resources/include/header.jsp"%>
	</div>

	<div class="content_wrap">
	    <div class="sub3-main">
	        <div class="sub3-main-content">
	            <p>단기 거주자를 위한 '청춘다방'의 1~6개월 단기임대 서비스</p>
	        </div>
	    </div>
	     <table>
	  	   <tbody>
           		<tr>
                    <th></th>
                	<td align="center">
						<form method="get" action="<%=request.getContextPath()%>/searchAddress.do">
						<input type="text" size="40" id="searchAddress" name="searchAddress" placeholder="주소를 입력하세요">
						<input type="submit" value="주소 검색" onclick="search()">
						</form>
						</td>
					</tr>
				</tbody>
			</table>
			<br>
			<div align="center" id="searchval" name="serachval"></div>
            <br><br>
                  
		<c:set var="list" value="${SearchAddress}"/>
      		<c:if test="${!empty list}">
		 		<div class="sub3-slides-wrap">
	       			 <div class="slides-content">
	           			 <h2>1개월 ~ 2개월</h2>
                			<div class="slides">
								<c:forEach items="${list }" var="i"  varStatus="status">
									<c:if test="${i.getR_monthlimit() eq '1~2개월'}">
                						<c:if test="${status.first}"></c:if>
                  						  <div>
                      						 <a href="room_cont.do?r_no=${i.getR_no() }">
                      						 <img src="${i.getR_photoOne() }" alt=""/></a>
                      							<strong>${i.getR_type()}</strong><br>
                      								<h3>월 / ${i.getR_rentfee().split("/")[1]}만원</h3><br>
                      									<p>${i.getR_movedate()} ~ ${i.getR_ritire() }</p>
            	  	  					  </div>
                    					  <c:if test="${status.last}">
                    					  </c:if>
                      				</c:if>
                				 </c:forEach>
	        				</div>
	  		  		</div>
	    		</div>
	    		
	    		<div class="sub3-slides-wrap1">
	       			 <div class="slides-content">
	           			 <h2>3개월 ~ 4개월</h2>
                			<div class="slides">
								<c:forEach items="${list }" var="i"  varStatus="status">
									<c:if test="${i.getR_monthlimit() eq '3~4개월'}">
                						<c:if test="${status.first}"></c:if>
                  						  <div>
                      						 <a href="room_cont.do?r_no=${i.getR_no() }">
                      						 <img src="${i.getR_photoOne() }" alt=""/></a>
                      							<strong>${i.getR_type()}</strong><br>
                      								<h3>월 / ${i.getR_rentfee().split("/")[1]}만원</h3><br>
                      									<p>${i.getR_movedate()} ~ ${i.getR_ritire() }</p>
            	  	  					  </div>
                    					  <c:if test="${status.last}">
                    					  </c:if>
                      				</c:if>
                				 </c:forEach>
	        				</div>
	  		  		</div>
	    		</div>
	    		
	    		<div class="sub3-slides-wrap">
	       			 <div class="slides-content">
	           			 <h2>5개월 ~ 6개월</h2>
                			<div class="slides">
								<c:forEach items="${list }" var="i"  varStatus="status">
									<c:if test="${i.getR_monthlimit() eq '5~6개월'}">
                						<c:if test="${status.first}"></c:if>
                  						  <div>
                      						 <a href="room_cont.do?r_no=${i.getR_no() }">
                      						 <img src="${i.getR_photoOne() }" alt=""/></a>
                      							<strong>${i.getR_type()}</strong><br>
                      								<h3>월 / ${i.getR_rentfee().split("/")[1]}만원</h3><br>
                      									<p>${i.getR_movedate()} ~ ${i.getR_ritire() }</p>
            	  	  					  </div>
                    					  <c:if test="${status.last}">
                    					  </c:if>
                      				</c:if>
                				 </c:forEach>
	        				</div>
	  		  		</div>
	    		</div>
	   </c:if>
	   
		<c:if test="${empty list}">
		<h2 align="center">검색 결과가 없습니다.</h2>
		</c:if>
        
	    <div class="button-wrap">
	        <div class="y-button">
	           <a href="<%=request.getContextPath() %>/rent_room_upload.do">
                  <p>나의 방 내놓기</p>
               </a>
	        </div>
	    </div>
	    
        <div class="pop-wrap">
            <div class="pop-content">
                <div class="pop-photo">
                    <h2>생활용품 모두 사용가능! 몸만오세요~</h2>
                </div>
                <div class="pop-text">
                    <span></span>
                    <span></span>
                    <button>close</button>
                    <p>2019.03.04 ~ 2019.04.04(협의가능)</p>
                    <div class="box-wrap">
                        <div><strong>1개월</strong></div>
                        <div><strong>33만원</strong></div>
                        <div><strong>관리비포함</strong></div>
                    </div>
                    <ul>
                        <li>• 층/건물층수 : 1층/4층</li>
                        <li>• 전용면적 : 23.14m² (7P)</li>
                        <li>• 반려동물 : 가능</li>
                        <li>• 베란다/발코니 : 있음</li>
                        <li>• 난방종류 : 개별난방</li>
                        <li>• 입주가능일 : 즉시입주</li>
                    </ul>
                    <div class="icon-wrap">
                        <div>TV</div>
                        <div>책상</div>
                        <div>침대</div>
                        <div>인덕션</div>
                        <div>옷장</div>
                    </div>
                    <div class="pop-map"></div>
                </div>
            </div>
        </div>

            <div id="searchadd">
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

	</div>
        
        
</body>
</html>