<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="DBPKG.util"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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

.btn {
width: 100px;
height: 30px;
border-radius: 10px;
background-color: #D4EEF5;
}
</style>
</head>
<body>

<jsp:include page="header.jsp"/>

<script>
		function check(form) {
			if (form.custname.value === ""){
				alert("이름을 입력하세요");
				form.custname.focus();
				return false;
			}
			if (form.phone.value === ""){
				alert("전화번호를 입력하세요");
				form.phone.focus();
				return false;
			}
			if (form.address.value === ""){
				alert("주소를 입력하세요");
				form.address.focus();
				return false;
			}
			if (form.grade.value === ""){
				alert("고객등급을 입력하세요");
				form.grade.focus();
				return false;
			}
			if (form.city.value === ""){
				alert("도시코드를 입력하세요");
				form.city.focus();
				return false;
			}
			alert("회원등록이 완료되었습니다.");
			return true;
		}
	</script>

<section>

<h2> 홈쇼핑 회원 등록 </h2>
<form method = "post" action="action.jsp" name="frm" onsubmit="return check(this);">

<input type="hidden" name="mode" value="insert">
<table border="1">

<%
Connection conn = null;
Statement stmt = null;
String custno = "";
SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
Date time = new Date();
String time1 = format.format(time);

try {
	conn = util.getConnection(); 
	stmt = conn.createStatement();
	String sql = "select max(custno)+1 custno FROM member_tbl_04";
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	custno = rs.getString("custno");
} catch(Exception e) {
	e.printStackTrace();
}
%>
	<tr>
		<th>회원번호(자동발생)</th>
		<td>
		<input type="text" name="custno" value=<%=custno %> />
		</td>
	</tr>
	<tr>
		<th>회원성명</th>
		<td>
		<input type="text" name="custname">
		</td>
	</tr>
	
	<tr>
		<th>회원전화</th>
		<td>
		<input type="text" name="phone">
		</td>
	</tr>
	
	<tr>
		<th>회원주소</th>
		<td>
		<input type="text" name="address">
		</td>
	</tr>
	
	<tr>
		<th>가입일자</th>
		<td>
		<input type="text" name="joindate" value=<%=time1 %> />
		</td>
	</tr>
	
	<tr>
		<th>고객등급 [A:VIP,B:일반,C:직원] </th>
		<td>
		<input type="text" name="grade" required>
		</td>
	</tr>
	
	<tr>
		<th>도시코드</th>
		<td>
		<input type="text" name="city">
		</td>
	</tr>
	
	<tr>
		<td class="td_Btn" colspan="2">
		<input class="btn" type="submit" value="등록">
		<input class="btn" type="button" value="조회" onclick="location='list.jsp'">
		</td>
	</tr>
	
</table>
</form>

</section>

	<jsp:include page="footer.jsp"/>

</body>
</html>