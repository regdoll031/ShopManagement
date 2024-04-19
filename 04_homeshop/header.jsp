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

header{
position: fixed;
top: 0;
width:100%;
background-color: #53BDD7;
color: #fff;
text-align: center;
line-height: 100px;
font-size: 30px;
}

nav {
position: fixed;
top: 100px;
width:100%;
background-color: #D4EEF5;
color: #fff;
line-height: 50px;
}
nav > a {
	padding-left: 30px; /* 간격 조정 */
}
a {
	text-decoration: none;
}
a:hover {
color: black;
}
</style>
</head>
<body>

<header>
쇼핑몰 회원관리 ver 2.0
</header>

<nav>
	<a href="join.jsp">회원등록</a>
	<a href="list.jsp">회원목록조회/수정</a>
	<a href="salary.jsp">회원매출조회</a>
	<a href="index.jsp">홈으로</a>
</nav>
</body>
</html>