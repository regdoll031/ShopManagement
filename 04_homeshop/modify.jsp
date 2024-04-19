<%@page import="DBPKG.util"%>
<%@page import="java.sql.ResultSet"%>
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
section {
position: fixed;
top: 150px;
width: 100%;
height: 100%;
}

h2 {
text-align: center;
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
padding-right: 250px;
padding-left: 5px;
}

#num {
width: 200px;
}
#adr {
width: 250px;
}

.td_Btn {
text-align:center;
padding-left: 180px;
}

button {
width: 100px;
height: 30px;
border-radius: 10px;
background-color: #D4EEF5;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"/>

<section>

<h2> 홈쇼핑 회원 정보 수정 </h2>
<form method = "post" action="action.jsp" name="frm">
<table border="1">
<%
Connection conn = null;
Statement stmt = null;
ResultSet rs = null;
String custno = "";
String mod_custno = request.getParameter("mod_custno");

try {
	conn = util.getConnection();
	stmt = conn.createStatement();
	String sql = "select * from member_tbl_04 where custno = " + mod_custno;
	rs = stmt.executeQuery(sql);
	
	rs.next();
%>
	<tr>
		<th>회원번호(자동발생)</th>
		<td>
		<input type="text" name="custno" value="<%=mod_custno %>" />
		</td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td>
		<input type="text" name="custname" value="<%=rs.getString(2) %>">
		</td>
	</tr>
	
	<tr>
		<th>회원전화</th>
		<td>
		<input type="text" name="phone" id="num" value="<%=rs.getString(3)%>">
		</td>
	</tr>
	
	<tr>
		<th>회원주소</th>
		<td>
		<input type="text" name="address" id="adr" value="<%=rs.getString(4)%>">
		</td>
	</tr>
	
	<tr>
		<th>가입일자</th>
		<td>
		<input type="text" name="joindate" value="<%=rs.getDate(5)%>">
		</td>
	</tr>
	
	<tr>
		<th>고객등급 [A:VIP,B:일반,C:직원] </th>
		<td>
		<input type="text" name="grade" value="<%=rs.getString(6)%>">
		</td>
	</tr>
	
	<tr>
		<th>도시코드</th>
		<td>
		<input type="text" name="city"value="<%=rs.getString(7)%>">
		</td>
	</tr>
	
	<tr>
		<td class="td_Btn" colspan="2">
		<button type="submit" name="mode" value="modify">수 정</button>
		<button type="button" onclick="location='list.jsp'">조 회</button>
		<button type="submit" name="mode" value="delete">삭 제</button>
		</td>
	</tr>
<%
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