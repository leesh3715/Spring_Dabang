<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
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

<script>
function test(){
	var inputPwd = prompt('회원님의 비밀번호를 입력하세요', '');
	
	alert(inputPwd);

	}
</script>
</head>

<body>
<!--header-->
    <%@ include file="../../resources/include/header.jsp"%>
<!--회원탈퇴 팝업-->

    <div id="DropMemberModal" data-uc-modal class="is-fade">
        <div class="is-modal-dialog">
            <div data-uc-panel>
                <div class="is-panel-body">
                    <div data-uc-colgroup="">
                        <div class="is-col-lg4 is-align-mid is-txt-center sns-wrap">
                            <p class="login_title">회원 탈퇴</p>
                        </div>
                        <div class="is-col-lg4 is-align-mid">
                            
                            <form data-uc-form method="post" action="<%=request.getContextPath()%>/delete_member.do">
                                <div class="is-input-field is-mg-b_15">
                                    <input type="text" id="input_email" name="m_email" value="" placeholder="이메일"
                                           style="border-color: #777676;" />
                                </div>
                                <div class="is-input-field is-mg-b_30">
                                    <input type="password" id="input_pwd" name="m_pwd" value="" placeholder="비밀번호"
                                           style="border-color: #777676;" />
                                </div>
                                <div class=" is-mg-b_15">
                                    <button type="submit" class="is-btn-yg1 is-mg-b_15">회원 탈퇴</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>


    

    <div class="container">
        <div class="mypage my2">
            <!--sub_top-->
            <div class="sub_top top6">
                <b class="title"><img src="resources/images/sub/sub6_top_img.png" alt="">마이페이지</b>
            </div>
            
            <!--tab_menu-->
            <div class="tab_menu menu4">
                 <ul>
                   <li><a href="<%=request.getContextPath() %>/my_room_1.do">찜한방</a></li>
                    <li><a href="<%=request.getContextPath() %>/my_room_3.do">나의 방 수정하기</a></li>
                    <li class="on"><a href="<%=request.getContextPath() %>/my_room_4.do">회원 정보 수정</a></li>
                </ul>
            </div>
            
             <!--tab_content-->
             
            <div class="tab_content">

            <div class="wrap">

                <b class="title_txt">
                    회원 정보 수정
                </b>

                <div class="frm_wrap">
                    <form method="post" action="<%=request.getContextPath()%>/update_member_ok.do" class="modify">                     		                       		
<!--                             <li>
                                <input type="text" class="type2 content" placeholder="이메일" title="이메일">
                            </li> -->
                        <ul>
                        	<li>
                                <input type="text" class="type2 content" placeholder="닉네임" title="닉네임" name="m_nick">
                            </li>
                            <li>
                                <input type="text" class="type2 content" placeholder="이름" title="이름" name="m_name">
                            </li>
                            <li>
                                <input type="password" class="type2 content" placeholder="비밀번호" title="비밀번호" name="m_pwd">
                            </li>
                            <li>
                                <input type="password" class="type2 content" placeholder="비밀번호 확인" title="비밀번호 확인" name="m_pwd2">
                            </li>
                            <li>
                                <input type="text" class="type2 content" placeholder="전화번호" title="전화번호" name="m_phone">
                            </li>
                        </ul>

                        <div class="btns">
                            <ul>
                                <li>
                                <input type="submit" value="내정보 수정 완료" class="btn btn_yellow btn_submit"></li>
                                <li>
                                   <!--  <input type="button"  class="btn btn_white" value="탈퇴하기" onclick="delete()"> -->
                                    
                                </li>
                            </ul>
                        </div>

                    </form>
                    <a href="#DropMemberModal" data-uc-click="modal">
                    <Button class="btn btn_white" >회원 탈퇴</Button></a>
                    
                    
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
