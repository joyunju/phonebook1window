<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ■Java 클래스를 import하는 JSP 코드 -->	
<%@ page import="com.javaex.dao.PhoneDao"%>
    
<%
	//System.out.println("delete.jsp");
	//파라미터에서 id값 꺼내오기
	int id = Integer.parseInt(request.getParameter("id"));
	System.out.println(id);
	
	//dao 메모리에 올리기
	PhoneDao phoneDao= new PhoneDao();
	int count = phoneDao.personDelete(id);
	System.out.println(count);
	
	
	// 응답은 리스트로 리다이렉트 시킨다.
	// list.jsp로 다시 요청한다.
	response.sendRedirect("./list.jsp");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>delete.jsp</title>
</head>
<body>
	 <!-- http://localhost:8088/phonebook1/delete.jsp  -->
</body>
</html>