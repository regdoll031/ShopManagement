<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
margin: 0px;
padding: 0px;
}
section {
position: fixed;
top: 150px;
width: 100%;
height: 100%;
}
h2 {
text-align: center;
color: #000;
margin: 30px;
border-bottom: 5px solid #53BDD7;
width: 100%;
margin-left: 0;
padding-left: 0;
padding-bottom: 20px;
}

span {
font-size: 20px;
font-weight: bold;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
<section>

<h2> 쇼핑몰 회원관리 프로그램 </h2>
<p>
<span>쇼핑몰 회원정보와 회원매출정보 데이터베이스를 구축하고 회원관리 프로그램을 작성하는 프로그램이다.<br>
프로그램 작성 순서</span><br>
1. 회원정보 테이블을 생성한다. <br>
2. 매출정보 테이블을 생성한다. <br>
3. 회원정보, 매출정보 테이블에 제시된 문제지의 참조데이터를 추가 생성한다. <br>
4. 회원정보 입력 화면 프로그램을 작성한다. <br>
5. 회원정보 조회 프로그램을 작성한다. <br>
6. 회원매출정보 조회 프로그램을 작성한다. <br>
</section>

	<jsp:include page="footer.jsp"/>
	
</body>
</html>