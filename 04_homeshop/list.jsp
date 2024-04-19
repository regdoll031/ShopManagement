<%@page import="java.sql.ResultSet"%>
<%@page import="DBPKG.util"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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

form {
display:flex;
flex-direction:column;
justify-content:center;
align-items: center;
text-aling: center;"
}

th {
padding: 3px 5px;
}

td {
padding: 3px 10px;
text-align: center;
}

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	
<section>

<h2> 회원목록 조회/수정 </h2>

<form>
<table border="1">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</tr>
	
<%
Connection conn = null;
Statement stmt = null;
String grade = "";
try {
	conn = util.getConnection(); // DB연결
	stmt = conn.createStatement();// sql 실행하기 위한 변수 생성
	String sql = "SELECT * FROM member_tbl_04 ORDER BY custno";
  	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()) {
		grade = rs.getString("grade");
	switch(grade) {
		case "A":
    	   grade = "VIP";
	       break;
		case "B":
			grade = "일반";
			break;
		case "C":
			grade = "직원";
			break;
	}
%>

	<tr>
		<td><a href="modify.jsp?mod_custno=<%= rs.getInt(1) %>">
			<%=rs.getInt(1) %></a></td>
		<td><%= rs.getString(2) %></td>
		<td><%= rs.getString(3) %></td>
		<td style="padding: 0 50px"><%= rs.getString(4) %></td>
		<td><%= rs.getDate(5) %></td>
		<td><%= grade %></td>
		<td><%= rs.getString(7) %></td>
	</tr>
<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>

		
</table>
</form>
</section>

	<jsp:include page="footer.jsp"/>
	
</body>
</html>