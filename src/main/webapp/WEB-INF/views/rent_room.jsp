<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>

<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>단기 임대</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	<link rel="stylesheet" href="resources/plugins/fonts/line-awesome.css">
	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/basic.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/slick-theme.css">
	<link rel="stylesheet" href="resources/css/style_sub1.css">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/sub3.css">
	<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/style.css">	


	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1b51f66e54fd5e327b654103d5fc9ca1&libraries=services"></script>
<script>

	function search(){

		$("#div searchadd").load("rent_room1.jsp");
			
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
                	
	     
	     <table class="table_test" style="margin-left: auto; margin-right: auto;">
	  	   <tbody>
           		<tr>
                    <th></th>
                	<td>
						<form method="get" action="<%=request.getContextPath()%>/searchAddress.do">
						<input type="text" size="40" id="searchAddress" name="searchAddress" placeholder="검색할 주소를 입력하세요">
						
						<input type="submit" value="주소 검색" onclick="search()" class="is-btn-yg3">
						</form>
					<td>
					</tr>
				</tbody>
			</table>
					
                            
                            
            <div class="button-wrap">
	        <div class="y-button">
	           <a href="<%=request.getContextPath() %>/rent_room_upload.do">
                  <p>나의 방 내놓기</p>
               </a>
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