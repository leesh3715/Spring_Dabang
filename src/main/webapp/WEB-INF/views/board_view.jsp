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


	<link rel="stylesheet" href="resources/css/uc.min2.css">
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
	<script src="resources/js/board.js"></script>
	
	
	<script type="text/javascript">
		function delete_ok(c_no,b_no) {
		
		if(confirm("댓글을 삭제하시겠습니까?")){
			location.href='s_comment_dele.do?c_no='+c_no+'&b_no='+b_no;
		}
		} 
	</script>
	
	<style type="text/css">
		@media screen and (max-width: 1850px) {
			#submenu_width{
				display: none;
			}
		}
	
	</style>
</head>

<body>

<%@ include file="../../resources/include/header.jsp" %>

	<c:set var="dto" value="${cont }"/>
	<div class="content_wrap" >
		<div style="text-align: center;">
		<h3 class="login_title">${dto.getB_head() }</h3>
		<div id="submenu_width" style="border: solid 1px #e9e9e9; float: left; position:absolute; top: 25%; left: 17%; width: 145px; height: 200px;" >
				<div class="B_submenu" style="border: solid 10px white;">
					<h3 class="font">커뮤니티 목록</h3>
					<hr style="border: solid 1px gray;">
					<ul style="text-align: left;">
						<li class="submenu"><a
							href="<%=request.getContextPath()%>/board_list.do?b_head=전체글보기">전체글보기</a></li>
						<li class="submenu"><a
							href="<%=request.getContextPath()%>/board_list.do?b_head=자유게시판">자유게시판</a></li>
						<li class="submenu"><a
							href="<%=request.getContextPath()%>/board_list.do?b_head=맛집공유">맛집 공유</a>
						</li>
						<li class="submenu"><a
							href="<%=request.getContextPath()%>/board_list.do?b_head=부동산추천">부동산 추천</a>
						</li>
					</ul>
				</div>
			</div>
			</div>
		<div class="is-frame-md">
			<div data-uc-table>
				
				<div style="margin: 10px; border:1px solid darkgray; padding:10px;"> <!-- inbox -->
					<div > <!-- tit-box -->
						<div style="display: inline; float: left;" > <!-- fl -->
							<table role="presentation" cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr valign="top">
										<td>
											<span style="font-weight: bold;">${dto.getB_title() }</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div align="right"> <!-- fr -->
							<table role="presentation" cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr>
										<td>
											<span ><font size="1em">${dto.getB_date().substring(0,16) }</font></span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div style="border-top:1px dashed darkgray; margin-top: 2px;"></div>
					<div><!-- etc-box -->
						<div > <!-- tit-box -->
						<div style="margin-top: 20px;"> <!-- fl -->
							<table role="presentation" cellspacing="0" cellpadding="0" border="0">
								<tbody>
									<tr valign="top">
										<td>
											<input type="hidden" id="b_writer" value="${dto.getB_writer() }">
											<span style="font-weight: bold;">${dto.getB_writer() }</span>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						</div>
						<div style="padding-left: 43px; padding-right: 43px; margin-top: 30px"><!-- 내용 -->
							<div>${dto.getB_cont() }</div>
						</div>
						
						<c:if test="${dto.getB_src() !=null }">
						
						<div style="padding-left: 43px; padding-right: 43px; margin-top: 30px; width: 100%; overflow: hidden;"><!-- 내용 -->
							<c:forTokens items="${dto.getB_src() }" delims="/" var="i" varStatus="st">
								<div style="float: left; width: 33%;">
								<input type="image" src="${i }" width="100%" height="300">&nbsp;&nbsp;
								<!-- <img src="resources/images/sub_2_2/fileupload.png" alt="" style="width: 100%;" /> -->
								</div>
							</c:forTokens>
								
						</div>
						
						</c:if>
						<!-- <table  cellspacing="0" cellpadding="0" border="0" style="margin-top: 20px;">
							<tbody>
								<tr>
									<td width="1500">
										&nbsp;
									</td>
									<td width="300" align="right"><ins><font size="2em">이 작성자의 게시글 더보기</font></ins></td>
								</tr>
							</tbody>
						</table> -->
						<div style="height: 15px;">&nbsp;</div>
					</div>
					<div><!-- replay box -->
						<div>
							<table style="margin-top: 20px;">
								<tbody>
									<tr>
										<td>
											<span>댓글</span>
											<span>${c_count }</span>
										</td>
										<td>
											<span>&nbsp;|&nbsp;</span>
										</td>
										<td>								
											<span>조회수</span>
											<span>${dto.getB_hit() }</span>
											<input type="hidden" id="check2" value="0">	
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div style="display: block; padding-left: 43px; padding-right: 43px; padding-bottom: 30px; padding-top: 30px; background-color: #cccccc;"><!-- 댓글 -->
						<div>
						<ul id="commentList"><!-- 댓글 -->
						
						
						</ul>
						<div align="center">
						<c:if test="${c_page > block }"> <!-- 페이지가 블럭 3 보다 클 경우  이전으로 가는 버튼 생성 -->
							
								<a href="board_view.do?c_page=1&b_no=${dto.getB_no() }">[◀◀]</a> <!-- 무조건 첫번째 페이지로 보내 줌  -->
								<a href="board_view.do?c_page=${startBlock - 1 }&b_no=${dto.getB_no() }">[◀]</a> <!-- 현재 페이지의 첫번째 블럭에 -1을 해주어 이전 페이지의 마지막 블럭으로 이동  -->
							
							
						</c:if>
						<c:if test="${endBlock >1 }">
						<c:forEach begin="${startBlock }" end="${endBlock }" var="i">
							<c:if test="${i == c_page }"> <!-- 현재 페이지랑 i랑 같을때는 언더라인, 굵게 표시  -->
								<u><b>[${i }]</b></u>
							</c:if>
							
							<c:if test="${!(i == c_page )}"> <!-- 현재 페이지랑 i가 다를 때는 연결할수 있게 링크를 걸어줌, i 에 해당하는 페이지 변수를 받아서  -->
								
									<a href="board_view.do?c_page=${i }&b_no=${dto.getB_no() }">[${i }]</a>
								
							</c:if>				
						</c:forEach>
						</c:if>
						<c:if test="${endBlock < allPage }"> <!-- 전체 페이지가 마지막 블럭보다 클 경우 다음으로 가는 버튼 생성 -->
							
								<a href="board_view.do?c_page=${endBlock + 1 }&b_no=${dto.getB_no() }">[▶]</a> <!-- 현재 페이지의 마지막 블럭에 +1을 해주어 다음 페이지의 첫번째 블럭으로 이동  -->
								<a href="board_view.do?c_page=${allPage }&b_no=${dto.getB_no() }">[▶▶]</a> <!-- 마지막 페이지의 끝으로 이동  -->
							
						</c:if>
						
						</div>
						 </div>
						 <div style="margin-top: 20px;">
						<form id="comments" name="comments">
							<input type="hidden" value="${dto.getB_no() }" name="b_no">
							<input type="hidden" value="${c_page }" name="bc_page">
							<input type="hidden" value="${c_rowsize }" name="bc_rowsize">
							
							<c:if test="${!empty session }">
							<table  border="1" style="width: 100%;">
								<tbody>
									<tr >
										<td style="background-color: #ffffff;  padding: 8px 10px;" width="*">
											<div >
												<textarea class="autosize" name="bc_cont" id="bc_cont" maxlength="4000" style="overflow: hidden auto; line-height: 14px; height: 100%; width: 100%;  resize: none; border:0;" ></textarea>
											</div>
										</td>
										<td width="1%">&nbsp;</td>
										<td valign="bottom" width="10%">
											<div >
												<input onClick="fn_comment()" type="button" value="등록" style="background-color: #ffffff; border:0; width: 60pt; height: 40pt;" >
											</div>
										</td>
									</tr>
								</tbody>
							</table>
							</c:if>
						</form>
						</div>
					</div>
				</div>
				<script>
					$("textarea.autosize").on('keydown keyup', function () {
						var limit=468;
						if(limit>$(this).prop('scrollHeight')){
								$(this).height(1).height( $(this).prop('scrollHeight')+12 );
						} 
					});
				</script>
			<c:set var="admin" value="admin"></c:set>
				<div align="right" style="margin: 0px 10px 10px; padding:0px 10px 10px;"> 
					<c:if test="${!empty nick }">
						<input type="button" value="글쓰기" onclick="location.href='board_write.do'"> 
						<input type="button" value="답글" onclick="location.href='board_write.do?b_group=${dto.getB_group()}&b_title=${dto.getB_title() }&b_step=${dto.getB_step() }&b_indent=${dto.getB_indent() }&b_head=${dto.getB_head() }'"> 
					</c:if>
					<c:if test="${dto.getB_writer()==nick }">
						<input type="button" value="수정" onclick="location.href='board_write.do?b_no=${dto.getB_no()}'"> 
					</c:if>
					<c:if test="${dto.getB_writer()==nick || nick==admin}">
						<input type="button" value="삭제" onclick="deleteShere(${dto.getB_no() },'${head }')"> 
					</c:if>
					<input type="button" value="목록" onclick="location.href='board_list.do?b_head=${dto.getB_head() }'"> 
				</div>
				<!-- <div data-uc-table class="is-scroll-x"> -->
				<c:set var="next" value="${next }"></c:set>
				<c:set var="pre" value="${pre }"></c:set>
				<table class="is-table-hor">
					<colgroup>
						<col width="10%">
						<col width="*">
						<col width="10%">
						<col width="10%">
					</colgroup>
					<tbody id="noticeCollapse" data-uc-collapse>
					<tr>
						<td colspan="4">&nbsp;
						</td>
					</tr>
					<tr>
						<c:if test="${!empty pre }">
							<td>
								<a href="board_view.do?b_no=${pre.getB_no() }"><font>이전글</font></a>
							</td>
							<td>
							<div align="left">
								<c:if test="${pre.getB_check()==1 }"><font color="red">[원글이 삭제된 답글]</font></c:if>
								<a href="board_view.do?b_no=${pre.getB_no() }">${pre.getB_title() }</a>
								<c:if test="${pre.getB_src() != null }">
									<img alt="" src="resources/images/img.jpg" width="25" height="25" style="opacity: 0.5;">
								</c:if>		
								<c:if test="${pre.getB_Comments_count() !=0}">		
									&nbsp;
									<a href="board_view.do?b_no=${pre.getB_no() }">
									<font color="red" style="font-weight: bolder;">[${pre.getB_Comments_count() }]</font></a></c:if>
							</div>
							</td>
							<td>
								<font>${pre.getB_writer() }</font>
							</td>
							<td>
								<font>${pre.getB_date().substring(0,10)  }</font>								
							</td>
						</c:if>
						</tr>
						<c:if test="${!empty groupdto }">
						<div style="background-color: #cccccc;">
							<c:forEach items="${groupdto }" var="groupdto">
							<tr style="background-color: #cccccc;" >
							<td>
								&nbsp;
							</td>
							<td>
								<div align="left">
								<c:if test="${groupdto.getB_check()==0 }">
								<c:forEach begin="1" end="${dto.getB_indent() }">&nbsp;&nbsp;&nbsp;</c:forEach>
								<c:if test="${groupdto.getB_indent()>0 }">┗</c:if>
								</c:if>
								<c:if test="${groupdto.getB_check()==1 }"><font color="red">[원글이 삭제된 답글]</font></c:if>
								<a href="board_view.do?b_no=${groupdto.getB_no() }">${groupdto.getB_title() }</a>
								<c:if test="${groupdto.getB_src() != null }">
									<img alt="" src="resources/images/img.jpg" width="25" height="25" style="opacity: 0.5;">
								</c:if>		
								<c:if test="${groupdto.getB_Comments_count() !=0}">		
									&nbsp;
									<a href="board_view.do?b_no=${groupdto.getB_no() }">
									<font color="red" style="font-weight: bolder;">[${groupdto.getB_Comments_count() }]</font></a></c:if>		
								</div>
							</td>
							<td>
								<font>${groupdto.getB_writer() }</font>
							</td>
							<td>
								<font>${groupdto.getB_date().substring(0,10)  }</font>								
							</td>
							</tr>
							</c:forEach>
						</div>
						</c:if>
						<tr>
						<c:if test="${!empty next }">
							<td>
								<a href="board_view.do?b_no=${next.getB_no() }"><font>다음글</font></a>
							</td>
							<td>
							<div align="left">
								<c:if test="${next.getB_check()==1 }"><font color="red">[원글이 삭제된 답글]</font></c:if>
								<a href="board_view.do?b_no=${next.getB_no() }">${next.getB_title() }</a>
								<c:if test="${next.getB_src() != null }">
									<img alt="" src="resources/images/img.jpg" width="25" height="25" style="opacity: 0.5;">
								</c:if>		
								<c:if test="${next.getB_Comments_count() !=0}">		
									&nbsp;
									<a href="board_view.do?b_no=${next.getB_no() }">
									<font color="red" style="font-weight: bolder;">[${next.getB_Comments_count() }]</font></a></c:if>
							</div>
							</td>
							<td>
								<font>${next.getB_writer() }</font>
							</td>
							<td>
								<font>${next.getB_date().substring(0,10)  }</font>								
							</td>
						</c:if>
						</tr>
					</tbody>
				</table>
		</div>
		<div class="is-empty-xs120"></div>
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