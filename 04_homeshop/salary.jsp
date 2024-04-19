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

<h2> 회원매출조회 </h2>

<form>
<table border="1">
	<tr>
		<th>회원번호</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</tr>
<%
Connection conn = null;
Statement stmt = null;
String grade = "";
try {
	conn = util.getConnection(); // DB 연결
	stmt = conn.createStatement(); // sql 실행
	String sql = "SELECT me.custno, me.custname, me.grade, SUM(mo.price) as price "
			   + "FROM MEMBER_TBL_04 ME, MONEY_TBL_04 MO "
			   + "WHERE me.custno = mo.custno "
			   + "GROUP BY me.custno, me.custname, me.grade "
			   + "order BY price desc ";
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
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
		<td><%= rs.getInt(1) %></td>
		<td><%= rs.getString(2) %></td>
		<td><%= grade %></td>
		<td><%= rs.getInt(4) %></td>
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