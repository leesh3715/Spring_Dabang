<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>


<head>
<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>방보기</title>
<meta name="description" content="">
<meta name="author" content="">

<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
<link rel="stylesheet" href="resources/css/uc.min.css">
<link rel="stylesheet" href="resources/css/basic.css">
<link rel="stylesheet" href="resources/css/slick.css">
<link rel="stylesheet" href="resources/css/slick-theme.css">
<link rel="stylesheet" href="resources/css/style_sub3.css">
<link rel="stylesheet" href="resources/css/layout.css">

<link rel="stylesheet" href="resources/css/style.css">
<link rel="stylesheet" href="resources/css/style_sub2_nanum.css">	
<link rel="stylesheet" href="resources/css/fine-uploader-gallery.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">

<script defer src="https://use.fontawesome.com/releases/v5.0.7/js/all.js"></script>



<script src="resources/js/jquery-3.3.1.min.js"></script>
<script src="resources/js/uc.lib.min.js"></script>
<script src="resources/js/uc.plugin.min.js"></script>
<script src="resources/js/slick.min.js"></script>
<script src="resources/js/common.js"></script>



<meta charset="utf-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

<title>방보기</title>
<script type="text/javascript">

var deleteOk = function (no){
	if(confirm("삭제를 하시겠습니까?")){

		var Myqna_no = no;
	   location.href='myqna_delete.do.ok?no='+ Myqna_no;
	}
}


var deleteReply = function (no){
	if(confirm("삭제를 하시겠습니까?")){
		
		var replyNo = no;
	   location.href='qnaReply_delete.do.ok?no='+ replyNo;
	}
}

</script>
</head>

<body>

	<%@ include file="../../resources/include/header.jsp"%>

	<div class="content_wrap">
		<div class="is-frame-md">
		    <div class="section table-wrap">
		     <table border="1">
				<caption>문의 내용</caption>

			<c:set var="dto" value="${cont}"></c:set>
			<c:if test="${!empty dto }">
				<tr>
					<th>글번호</th>
					<td>${dto.getMyqna_no()}</td>
				</tr>
				<tr>
					<th>문의 유형</th>
					<td>${dto.getMyqna_qtype()}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.getMyqna_title()}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="8" cols="80" readonly>${dto.getMyqna_cont()}</textarea>
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${dto.getMyqna_regdate()}</td>
				</tr>
			</c:if>

			<c:if test="${empty dto}">
				<tr>
					<td colspan="2" align="center">
						<h3>검색된 레코드가 없습니다.</h3>
					</td>
				</tr>
			</c:if>

			<tr>
				<td colspan="8" align="center" >
				 <input class="is-btn-yellow" type="button" value="수정" onclick="location.href='myqna_edit.do?no=${dto.getMyqna_no()}'">
				 <input class="is-btn-yellow" type="button" value="삭제" onclick="deleteOk(${dto.getMyqna_no()})"> 
				 <input class="is-btn-yellow" type="button" value="전체 목록" onclick="location.href='myqna_room.do'">
				</td>
			</tr>

		</table>
	</div>


	<c:set var="a" value="${answer}"></c:set>
	<c:if test="${loginid eq 'admin' }">
	<c:if test="${a ne -1 }">
	<div class="content_wrap">
		<div class="is-frame-md">
		    <div class="section table-wrap">
				<table border="1" >
				<caption>답변 내용</caption>
			<form method="post"
				action="<%=request.getContextPath()%>/reply_write_ok.do">
				<input type="hidden" name="no" value="${dto.getMyqna_no() }">
								
					<tr>
						<th colspan="2" align="center"><b>관리자</b></th>
					</tr>
					<tr>
						<th>글번호</th>
						<td>${dto.getMyqna_no()}</td>
					</tr>
					<tr>
						<th>문의 유형</th>
						<td>${dto.getMyqna_qtype()}</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${dto.getMyqna_title()}</td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea name="reply_cont" rows="8" cols="80" placeholder="답변 작성하세요"></textarea>
						</td>
					</tr>
					<tr>
						<th>관리자 번호</th>
						<td><input cols="20" type="password" name="reply_pwd"></td>
					</tr>
					<%-- 			<tr>
				<th>작성일</th>
				<td>${dto.getReply_regdate()}</td>  <!-- regdate(reply 만들어야함) -->
			</tr> --%>

					<tr>
						<td colspan="4" align="center">
						<input type="submit" value="글쓰기" class="is-btn-yellow">
 <%-- 						<input type="button" value="삭제" onclick="deleteReply(${dto.getReply_no()})"
							class="is-btn-yellow"></td>  --%>
					</tr>
				</table>
			</form>
	</c:if>
	</c:if>

	<c:if test="${a eq 0 }">
		<tr align="center">
			<td colspan="2" align="center"><br>
			<br>
			<br>
				<h3 align="center">* *답변이 아직 없습니다**</h3></td>
		</tr>
	</c:if>
	<c:set var="ansli" value="${answerlist }" />
	<c:if test="${!empty ansli }">
		<c:forEach items="${ansli }" var="i">
			<table align="center" border="1" width="400" cellspacing="0">

				<tr>
					<th>글번호</th>
					<td>${dto.getMyqna_no()}</td>
				</tr>
				<tr>
					<th>문의 유형</th>
					<td>${dto.getMyqna_qtype()}</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>${dto.getMyqna_title()}</td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea rows="8" cols="80" readonly>${i.getReply_cont() }</textarea>
					</td>
				</tr>
				<tr>
					<th>작성일</th>
					<td>${i.getReply_regdate()}</td>
				</tr>
				<c:if test="${loginid eq 'admin' }">
				<tr>
					<td colspan="4" align="center" >
						<input type="button" value="수정" onclick="location.href='reply_edit.do?no=${dto.getMyqna_no()}'"
						class="is-btn-yellow"> 
						<input type="button" value="삭제" onclick="deleteReply(${dto.getMyqna_no()})"
						class="is-btn-yellow"></td>
						
				</tr>
				</c:if>

			</table>
		</c:forEach>

	</c:if>
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