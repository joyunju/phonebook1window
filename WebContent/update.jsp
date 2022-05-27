<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- @ page import="패키지명.클래스명" -->
<%@ page import="com.javaex.dao.PhoneDao"%>
<%@ page import="com.javaex.vo.PersonVo"%>
    
<%
	//파라미터 꺼내기
	//문자열을 숫자로 바꾸기 위해 Integer.parseInt()
	int id = Integer.parseInt(request.getParameter("id")); 
	//System.out.println(id);
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String company = request.getParameter("company");
	
	//PersonVo 만들기
	PersonVo personVo = new PersonVo(id, name, hp, company);
	System.out.println(personVo);
	
	//PhoneDao personUpdate() 로 수정하기
	PhoneDao phoneDao =  new PhoneDao();
	int count = phoneDao.personUpdate(personVo);
	System.out.println(count);
	
	
	// 리스트로 리다이렉트 시키기
	response.sendRedirect("./list.jsp");
	
	
	//연결 확인 테스트
	System.out.println("update");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>update.jsp</title>

</head>
<body>
	<!-- http://localhost:8088/phonebook1/update.jsp -->
</body>
</html>