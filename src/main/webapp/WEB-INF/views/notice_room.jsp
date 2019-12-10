<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<meta charset="utf-8">

	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

	<title>방보기</title>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">
	
	<meta name="description" content="">
	<meta name="author" content="">
	<meta name="viewport" content="width=device-width,initial-scale=1">

	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/gh/moonspam/NanumSquare@1.0/nanumsquare.css">	
	<link rel="stylesheet" href="resources/css/uc.min.css">
	<link rel="stylesheet" href="resources/css/basic.css">
	<link rel="stylesheet" href="resources/css/slick.css">
	<link rel="stylesheet" href="resources/css/slick-theme.css">
	<link rel="stylesheet" href="resources/css/style_sub3.css">
	<link rel="stylesheet" href="resources/css/layout.css">

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
	
	<script type="text/javascript">
			function checkAll(){
			      if( $("#checkbox").is(':checked') ){
			        $("input[name=checkRow]").prop("checked", true);
			      }else{
			        $("input[name=checkRow]").prop("checked", false);
			      }
			}


			function deleteAction(find_name, page,head){
				  var checkRow = "";
				  var find_field =$("#field").val();
				  
				  $( "input[name='checkRow']:checked" ).each (function (){
				    checkRow = checkRow + $(this).val()+"," ;
				  });
				  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
				 
				  if(checkRow == ''){
				    alert("삭제할 게시글을 선택해 주세요.");
				    return false;
				  }
				  console.log("### checkRow => {}"+checkRow);
				 
				  if(confirm("정보를 삭제 하시겠습니까?")){   
					  alert(find_field);
					  location.href="board_delete.do?b_checkno="+checkRow+"&find_field="+find_field+"&find_name="+find_name+"&page="+page+"&b_head="+head+"";      
				  }
				}
			function deleteAction(head){
				  var checkRow = "";
				  
				  $( "input[name='checkRow']:checked" ).each (function (){
				    checkRow = checkRow + $(this).val()+"," ;
				  });
				  checkRow = checkRow.substring(0,checkRow.lastIndexOf( ",")); //맨끝 콤마 지우기
				 
				  if(checkRow == ''){
				    alert("삭제할 게시글을 선택해 주세요.");
				    return false;
				  }
				  console.log("### checkRow => {}"+checkRow);
				 
				  if(confirm("정보를 삭제 하시겠습니까?")){   
					  location.href="board_delete.do?b_checkno="+checkRow+"&b_head="+head+"";      
				  }
				}
			</script>
</head>

<body>

<%@ include file="../../resources/include/header.jsp" %>
			
		<div class="is-frame-md">
			<div class="is-title-wrap is-txt-center">
				<h2>고객 센터</h2>
			</div>

			<div class="custom-top-list is-mg-y_20 is-pd-b_20" data-uc-colgroup="row-lg">
				<ul class="columns-xs1 columns-lg3">
					<li class="is-col is-align-mid is-mg-b_15 width323">
						<a href="<%=request.getContextPath()%>/notice_room.do?b_head=공지사항">
							<div class="is-col-inner">
								<div class="is-icon">
									<img src="resources/images/sub_3/customer-center/11.png" />
								</div>
								<h3>NOTICE</h3>
								<p>청춘다방의 공지사항을<br> 한눈에 확인할 수 있어요</p>
							</div>
						</a>
					</li>
					<li class="is-col is-align-mid is-mg-b_15 width323">
						<a href="<%=request.getContextPath()%>/qna_room.do">
							<div class="is-col-inner">
								<div class="is-icon">
									<img src="resources/images/sub_3/customer-center/22.png" />
								</div>
								<h3>1 : 1 문의</h3>
								<p>궁금한 점을 1:1로<br> 물어보는 공간이에요</p>
							</div>
						</a>
					</li>
					<li class="is-col is-align-mid is-mg-b_15 width323">
						<a href="<%=request.getContextPath()%>/customer_room.do">
							<div class="is-col-inner">
								<div class="is-icon">
									<img src="resources/images/sub_3/customer-center/33.png" />
								</div>
								<h3>FAQ</h3>
								<p>간편하게 궁금증을 해결하는<br> 공간으로 쉽게 빠르고 확인 가능!</p>
							</div>
						</a>
					</li>
				</ul>
			</div>

			<c:set var="admincheck" value="admin"></c:set>
			<c:set var="headcheck" value="전체글보기"></c:set>
			<div data-uc-table class="is-scroll-x" style="float: right;">
				<table class="is-table-hor">
					<colgroup>
					<c:if test="${nick eq admincheck}">
						<col width="5%">
					</c:if>
						<col width="10%">
						<col width="*">
						<col width="20%">
						<col width="10%">
						<col width="10%">
						
					</colgroup>
					<thead>
						<tr>
							<c:if test="${nick eq admincheck}">
								<th>&nbsp;</th>
							</c:if>
							<c:if test="${head ne headcheck}">
							<th>번호</th>
							</c:if>
							<c:if test="${head eq headcheck}">
							<th></th>
							</c:if>
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
							<c:if test="${nick eq admincheck}">
								<td><input type="checkbox" id="check${dto.getB_no() }" value="${dto.getB_no() }" name="checkRow"></td>
							</c:if>
							<c:if test="${head ne headcheck}">
							<td>${dto.getB_no() }</td>
							</c:if>
							<c:if test="${head eq headcheck}">
							<td>${dto.getB_head() }</td>
							</c:if>
							<td>
							<div align="left">
							<c:if test="${dto.getB_check()==0 }">
							<c:forEach begin="1" end="${dto.getB_indent() }">&nbsp;&nbsp;&nbsp;</c:forEach>
							<c:if test="${dto.getB_indent()>0 }">┗</c:if>
							</c:if>
							<c:if test="${dto.getB_check()==1 }"><font color="red">[원글이 삭제된 답글]</font></c:if>
							<a href="board_view.do?b_no=${dto.getB_no() }&b_head=${dto.getB_head()}">
									${dto.getB_title() }</a>
							<c:if test="${dto.getB_src() != null }">
								<img alt="" src="resources/images/img.jpg" width="25" height="25" style="opacity: 0.5;">
							</c:if>		
							
							<c:if test="${dto.getB_Comments_count() !=0}">		
									&nbsp;
							<a href="board_view.do?b_no=${dto.getB_no() }&b_head=${dto.getB_head()}">
									<font color="red" style="font-weight: bolder;">[${dto.getB_Comments_count() }]</font></a></c:if>		
									</div></td>
							<td>${dto.getB_writer() }</td>
							<td>${dto.getB_date().substring(0,10) }</td>
							<td>${dto.getB_hit() }</td>
							
						</tr>
					</c:forEach>
					</c:if>
					<c:if test="${empty list }">
						<tr>
							
						<c:if test="${nick eq admincheck}">
						<td colspan="6" align="center">
							<h5>레코드가 없습니다.</h5>
						</td>
						</c:if>
					
						<c:if test="${nick ne admincheck}">
						<td colspan="5" align="center">
							<h5>레코드가 없습니다.</h5>
						</td>
						</c:if>
								
						</tr>
					</c:if>
						<tr>
							<c:if test="${nick eq admincheck}">	
								<td valign="top"><input type="checkbox" id="checkbox" onclick="checkAll()"></td>
								<td valign="top"><label for="checkbox">전체선택</label></td>
							</c:if>
							<c:if test="${nick ne admincheck }">
								<td></td> 
							</c:if>
							<td colspan="4">
								<div align="right" style="margin: 0px 10px 10px; padding:0px 10px 10px;"> 
								<c:if test="${nick eq admincheck}">	
									<input type="hidden" value="${find_field}" id="field">
									<c:if test="${!empty find_field }">
										<a onclick="deleteAction(${find_name},${page},'${head }')" class="is-btn-brown" style="color: white;">삭제</a>
									</c:if>
									<c:if test="${empty find_field }">
										<a onclick="deleteAction('${head }')" class="is-btn-brown" style="color: white;">삭제</a>
									</c:if>
								</c:if>
								<c:if test="${nick eq admincheck }">
									<a href="<%=request.getContextPath()%>/board_write.do?b_head=${head }" class="is-btn-brown">공지사항 작성</a>
									
								</c:if>
								</div>
							</td>
						</tr>
						<tr>
						<c:if test="${nick eq admincheck}">
						<td colspan="6" align="center">
						</c:if>
					
						<c:if test="${nick ne admincheck}">
						<td colspan="5" align="center">
						</c:if>
						<c:if test="${page > block }"> <!-- 페이지가 블럭 3 보다 클 경우  이전으로 가는 버튼 생성 -->
							<c:if test="${empty find_name }">
								<a href="notice_room.do?page=1&b_head=${head}">[◀◀]</a> <!-- 무조건 첫번째 페이지로 보내 줌  -->
								<a href="notice_room.do?page=${startBlock - 1 }&b_head=${head}">[◀]</a> <!-- 현재 페이지의 첫번째 블럭에 -1을 해주어 이전 페이지의 마지막 블럭으로 이동  -->
							</c:if>
							<c:if test="${!empty find_name }">
								<a href="board_search.do?page=1&find_field=${find_field}&find_name=${find_name}&b_head=${head}">[◀◀]</a> <!-- 무조건 첫번째 페이지로 보내 줌  -->
								<a href="board_search.do?page=${startBlock - 1 }&find_field=${find_field}&find_name=${find_name}&b_head=${head}">[◀]</a> <!-- 현재 페이지의 첫번째 블럭에 -1을 해주어 이전 페이지의 마지막 블럭으로 이동  -->
							</c:if>
						</c:if>
						
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<c:if test="${i == page }"> <!-- 현재 페이지랑 i랑 같을때는 언더라인, 굵게 표시  -->
								<u><b>[${i }]</b></u>
							
							</c:if>
							
							<c:if test="${!(i == page )}"> <!-- 현재 페이지랑 i가 다를 때는 연결할수 있게 링크를 걸어줌, i 에 해당하는 페이지 변수를 받아서  -->
								<c:if test="${empty find_name }">
									<a href="notice_room.do?page=${i }&b_head=${head}">[${i }]</a>
								</c:if>
								<c:if test="${!empty find_name }">
									<a href="board_search.do?page=${i }&find_field=${find_field}&find_name=${find_name}&b_head=${head}">[${i }]</a>
								</c:if>
							</c:if>				
						</c:forEach>
						
						<c:if test="${endBlock < allPage }"> <!-- 전체 페이지가 마지막 블럭보다 클 경우 다음으로 가는 버튼 생성 -->
							<c:if test="${empty find_name }">
								<a href="notice_room.do?page=${endBlock + 1 }&b_head=${head}">[▶]</a> <!-- 현재 페이지의 마지막 블럭에 +1을 해주어 다음 페이지의 첫번째 블럭으로 이동  -->
								<a href="notice_room.do?page=${allPage }&b_head=${head}">[▶▶]</a> <!-- 마지막 페이지의 끝으로 이동  -->
							</c:if>
							<c:if test="${!empty find_name }">
								<a href="board_search.do?page=${endBlock + 1 }&find_field=${find_field}&find_name=${find_name}&b_head=${head}">[▶]</a> <!-- 현재 페이지의 마지막 블럭에 +1을 해주어 다음 페이지의 첫번째 블럭으로 이동  -->
								<a href="board_search.do?page=${allPage }&find_field=${find_field}&find_name=${find_name}&b_head=${head}">[▶▶]</a> <!-- 마지막 페이지의 끝으로 이동  -->
							</c:if>
						</c:if>
						</td>
						 
						
					</tr>
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="is-frame-md" style="text-align: center;">
			<form data-uc-form class="is-mg-t_20" action="<%=request.getContextPath() %>/board_search.do">
			<input type="hidden" value="${head }" name="b_head">
				<div data-uc-colgroup>
					<div class="is-col-md4 is-offset-md8">
						<div data-uc-colgroup="row-xs" style="height: 50px;">
							<div class="is-col-xs3">
								<div class="is-input-field">
									<select name="find_field">
										<option value="title">제목</option>
										<option value="cont">내용</option>
										<option value="title_cont">제목+내용</option>
										<option value="writer">작성자</option>
									</select>
								</div>
							</div>
							<div class="is-col-xs9">
								<div class="is-input-field">
									<input type="text" name="find_name" id=""/>
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