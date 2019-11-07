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
	<link rel="stylesheet" href="resources/css/style_sub1.css">
	<link rel="stylesheet" href="resources/css/layout.css">
	<link rel="stylesheet" href="resources/css/sub3.css">

	<script src="resources/js/jquery-3.3.1.min.js"></script>
	<script src="resources/js/uc.lib.min.js"></script>
	<script src="resources/js/uc.plugin.min.js"></script>
	<script src="resources/js/slick.min.js"></script>
	<script src="resources/js/common.js"></script>
    <title>청춘다방</title>
</head>

<body>
    <!--header-->
   <%@ include file="../../resources/include/header.jsp"%>

    <div class="container">
        <div class="member id_find">
            <div class="wrap">
               <form method="post" action="<%=request.getContextPath()%>/pwd_find_ok.do">
                <div class="inner_box">
                    <b class="title">비밀번호 찾기</b>

                    <div class="box box1">
                        <div class="radio_wrap">
                            <input type="radio" id="method1" name="method" class="type1" title="">
                            <label for="method1"><span></span>이메일로 인증하기</label>
                        </div>
                        <p>회원정보에 등록한 이름과<br>전화번호가 같아야 합니다.</p>

                        <div class="frm_wrap">
                            <input type="text" class="type2" placeholder="이름" name="m_name">
                            <input type="text" class="type2" placeholder="전화번호 (- 빼고 입력)" name="m_phone">
                        </div>
                    </div>
                    <input type="submit" class="btn btn_submit" value="비밀번호 찾기">
                </div>
               </form> 
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
