<%@page import="DBPKG.util"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
Connection conn = null;
Statement stmt = null;

String custno = request.getParameter("custno");
String custname = request.getParameter("custname");
String phone = request.getParameter("phone");
String address = request.getParameter("address");
String joindate = request.getParameter("joindate");
String grade = request.getParameter("grade");
String city = request.getParameter("ciry");

String mode = request.getParameter("mode");

try {
	String sql = "";
	PreparedStatement pstmt;
	conn = util.getConnection();
	
	switch(mode) {
	case "insert" :
		 sql = "INSERT INTO member_tbl_04 VALUES (?, ?, ?, ?, TO_DATE(?, 'yyyy-MM-dd'), ?, ?)";
				   
			pstmt = conn.prepareStatement(sql);
		    pstmt.setString(1, custno);
		    pstmt.setString(2, custname);
		    pstmt.setString(3, phone);
		    pstmt.setString(4, address);
		    pstmt.setString(5, joindate);
		    pstmt.setString(6, grade);
		    pstmt.setString(7, city);
		
		      	pstmt.executeUpdate();
		      
		      	response.sendRedirect("list.jsp"); 
		       	break;
		       	
	case "modify" :
		System.out.print("수정");
		 sql ="UPDATE member_tbl_04 SET " +
                "custname=?, "+
                "phone=?, "+
                "address=?, "+
                "joindate=TO_DATE(?,'yyyy-MM-dd'), "+
                "grade=?, "+
                "city=? "+
              	"WHERE custno=?";
		 
		    
	    	pstmt=conn.prepareStatement(sql);	
	       	pstmt.setString(1,custname);	
	       	pstmt.setString(2,phone);	
  		  	pstmt.setString(3,address);	
		   	pstmt.setString(4,joindate);	
    		pstmt.setString(5,grade);	
    		pstmt.setString(6,city);	
    		pstmt.setString(7,custno);
    		pstmt.executeUpdate();	   
	        response.sendRedirect("list.jsp"); 
    		pstmt.close();
	        break;
     	
	case "delete":
		sql = "DELETE FROM member_tbl_04 WHERE custno =? ";
			
			pstmt = conn.prepareStatement(sql);
	    	pstmt.setString(1, custno);
	    	
	    	pstmt.executeUpdate();
	    	pstmt.close();
	    	response.sendRedirect("list.jsp"); 
	     	break;
	}
} catch(Exception e){
	e.printStackTrace();
}

%>
</body>
</html>