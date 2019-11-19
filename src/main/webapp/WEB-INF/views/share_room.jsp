<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>방보기</title>
	<meta name="description" content="">
	<meta name="author" content="">

	<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">


	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/basic.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/slick-theme.css">
	<link rel="stylesheet" href="resources/css/style_sub2.css">
	<link rel="stylesheet" href="resources/css/layout.css">
	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
</head>

<body>

<%@ include file="../../resources/include/header.jsp" %>


	<div class="content_wrap">
		<div class="gongyu">
			<!--sub_top-->
			<div class="sub_top top4">
				<b class="title">공유방</b>
				<div>
					<span>나눔하고 싶은 가구 또는 필요한 가구가 있다면 가전가구나눔을 이용! </span>
				</div>
			</div>
		</div>

		<!--tab_menu-->
		<div class="tab_menu menu3">
			<ul>
				<li><a href="<%=request.getContextPath()%>/con4_1.do">실생활 팁</a></li>
				<li><a href="<%=request.getContextPath()%>/con4_2.do">인테리어 팁</a></li>
				<li class="on"><a href="<%=request.getContextPath()%>/share_room.do">가전가구 나눔</a></li>
			</ul>
		</div>

		<div class="is-frame-md">
			<div class="is-title-wrap is-txt-center">
				<h2>가전가구 나눔</h2>
				<p>낭비는 줄고 나눔은 늘고! </p>
			</div>

			<div class="yellow-bg2">
				<div class="is-col-xs6 is-align-mid">
					<h4>무료나눔정보</h4>
				</div>
				<div class="is-col-xs6 is-align-mid is-txt-right">
					<a href="<%=request.getContextPath()%>/share_room_upload.do" class="is-btn-brown">나눔 등록 하기</a>
				</div>
			</div>

			<div class="is-mg-y_20 is-pd-b_20" style="border: 2px solid #eaeaea;">
				<ul class="columns-xs2 columns-lg4">
					<li class="is-col is-align-mid" style="width: 231.5px;">
						<div class="is-icon">
							<img src="resources/images/sub_2/gg/1.png" />
						</div>
						<p>나눔등록하기를 누른다</p>
					</li>
					<li class="is-col is-align-mid" style="width: 231.5px;">
						<div class="is-icon">
							<img src="resources/images/sub_2/gg/2.png" />
						</div>
						<p>직거래 유무/ 지역 등 옵션을 선택한다</p>
					</li>
					<li class="is-col is-align-mid" style="width: 231.5px;">
						<div class="is-icon">
							<img src="resources/images/sub_2/gg/3.png" />
						</div>
						<p>3장이상 사진 첨부후 글올리기</p>
					</li>
					<li class="is-col is-align-mid" style="width: 231.5px;">
						<div class="is-icon">
							<img src="resources/images/sub_2/gg/4.png" />
						</div>
						<p>거래가 성사되면 나눔완료!</p>
					</li>
				</ul>
			</div>

			<div data-uc-table class="is-scroll-x">
				<table class="is-table-hor">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="10%">
						<col width="10%">
						
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
							<th>조회수</th>
							
						</tr>
					</thead>
					<tbody id="noticeCollapse" data-uc-collapse>
					<c:set var="list" value="${List }"/>
					<c:if test="${!empty list }">
					<c:forEach items="${list }" var="dto">
						<tr>
							<td>${dto.getS_no() }</td>
							<td>
							<div align="left" style="padding-left: 250px;">
							<c:if test="${dto.getS_check()==0 }">
							<c:forEach begin="1" end="${dto.getS_indent() }">&nbsp;&nbsp;&nbsp;</c:forEach>
							<c:if test="${dto.getS_indent()>0 }">┗</c:if>
							</c:if>
							<c:if test="${dto.getS_check()==1 }">[원글이 삭제된 답글]</c:if>
							<a href="share_cont.do?s_no=${dto.getS_no() }">
									${dto.getS_title() }</a>
							<c:if test="${dto.getS_src() != null }">
								<img alt="" src="resources/images/img.jpg" width="25" height="25" style="opacity: 0.5;">
							</c:if>		
							
							<c:if test="${dto.getS_Comments_count() !=0}">		
									&nbsp;
							<a href="share_cont.do?s_no=${dto.getS_no() }">
									<font color="red" style="font-weight: bolder;">[${dto.getS_Comments_count() }]</font></a></c:if>		
									</div></td>
							<td>${dto.getS_writer() }</td>
							<td>${dto.getS_date().substring(0,10) }</td>
							<td>${dto.getS_hit() }</td>
							
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							<td colspan="6" align="center">
							<h5>레코드가 없습니다.</h5>
							</td>
						</tr>
					</c:if>
					<tr>
						<td colspan="5" align="center">
						
						<c:if test="${page > block }"> <!-- 페이지가 블럭 3 보다 클 경우  이전으로 가는 버튼 생성 -->
							<c:if test="${empty find_name }">
								[<a href="share_room.do?page=1">◀◀</a>] <!-- 무조건 첫번째 페이지로 보내 줌  -->
								[<a href="share_room.do?page=${startBlock - 1 }">◀</a>] <!-- 현재 페이지의 첫번째 블럭에 -1을 해주어 이전 페이지의 마지막 블럭으로 이동  -->
							</c:if>
							<c:if test="${!empty find_name }">
								[<a href="share_search.do?page=1&find_field=${find_field}&find_name=${find_name}">◀◀</a>] <!-- 무조건 첫번째 페이지로 보내 줌  -->
								[<a href="share_search.do?page=${startBlock - 1 }&find_field=${find_field}&find_name=${find_name}"">◀</a>] <!-- 현재 페이지의 첫번째 블럭에 -1을 해주어 이전 페이지의 마지막 블럭으로 이동  -->
							</c:if>
						</c:if>
						
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<c:if test="${i == page }"> <!-- 현재 페이지랑 i랑 같을때는 언더라인, 굵게 표시  -->
								<u><b>[${i }]</b></u>
							</c:if>
							
							<c:if test="${!(i == page )}"> <!-- 현재 페이지랑 i가 다를 때는 연결할수 있게 링크를 걸어줌, i 에 해당하는 페이지 변수를 받아서  -->
								<c:if test="${empty find_name }">
									[<a href="share_room.do?page=${i }">${i }</a>]
								</c:if>
								<c:if test="${!empty find_name }">
									[<a href="share_search.do?page=${i }&find_field=${find_field}&find_name=${find_name}"">${i }</a>]
								</c:if>
							</c:if>				
						</c:forEach>
						
						<c:if test="${endBlock < allPage }"> <!-- 전체 페이지가 마지막 블럭보다 클 경우 다음으로 가는 버튼 생성 -->
							<c:if test="${empty find_name }">
								[<a href="share_room.do?page=${endBlock + 1 }">▶</a>] <!-- 현재 페이지의 마지막 블럭에 +1을 해주어 다음 페이지의 첫번째 블럭으로 이동  -->
								[<a href="share_room.do?page=${allPage }">▶▶</a>] <!-- 마지막 페이지의 끝으로 이동  -->
							</c:if>
							<c:if test="${!empty find_name }">
								[<a href="share_search.do?page=${endBlock + 1 }&find_field=${find_field}&find_name=${find_name}"">▶</a>] <!-- 현재 페이지의 마지막 블럭에 +1을 해주어 다음 페이지의 첫번째 블럭으로 이동  -->
								[<a href="share_search.do?page=${allPage }&find_field=${find_field}&find_name=${find_name}"">▶▶</a>] <!-- 마지막 페이지의 끝으로 이동  -->
							</c:if>
						</c:if>
						</td>
						 
						
					</tr>
					</tbody>
				</table>
			</div>

			<form data-uc-form class="is-mg-t_20"  method="post" action="<%=request.getContextPath() %>/share_search.do">
			
				<div data-uc-colgroup>
					<div class="is-col-md4 is-offset-md8">
						<div data-uc-colgroup="row-xs">
							<div class="is-col-xs3">
								<div class="is-input-field">
									<select name="find_field">
										<option value="title">제목</option>
										<option value="cont">내용</option>
										<option value="title+cont">제목+내용</option>
										<option value="writer">작성자</option>
									</select>
								</div>
							</div>
							<div class="is-col-xs9">
								<div class="is-input-field">
									<input type="text" name="find_name" id="" value="" />
									<input type="image" src="resources/images/sub_2/search.png" style="position: absolute; top: 10px; right: 10px; margin-top: 5px;">
									
								</div>
							</div>
						</div>
					</div>
				</div>
			</form>
			
		</div>
		<div class="is-empty-xs120"></div>
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