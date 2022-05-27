<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- import 문법-->
<!-- @ page import="패키지명.클래스명" -->
<%@ page import="com.javaex.dao.PhoneDao"%>
<%@ page import="com.javaex.vo.PersonVo"%>

<%
	//파라미터 꺼내기
	int id = Integer.parseInt(request.getParameter("id")); 
	System.out.println(id);
	
	//id의 데이터 가져오기
	PhoneDao phoneDao = new PhoneDao();
	PersonVo personVo = phoneDao.getPerson(id);
	System.out.println(personVo);

	
	//연결 확인 테스트
	//System.out.println("updateForm");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>updateForm</title>
</head>
<body>
	<!-- http://localhost:8088/phonebook1/updateForm.jsp -->
	<h1>전화번호부</h1>
	<h2>수정폼</h2>
	
	<p>수정화면입니다. 아래의 항목을 수정하고 "수정"버튼을 클릭하세요</p>
	
	<form action="./update.jsp" method="get">
		이름(name) : <input type="text" name="name" value="<%=personVo.getName()%>">
		<br>
		핸드폰(hp) : <input type="text" name="hp" value="<%=personVo.getHp()%>">
		<br>
		회사(company) : <input type="text" name="company" value="<%=personVo.getCompany()%>">
		<br>
		<!-- 코드(id) : <input type="text" name="id" value=""> -->
		<!-- 사용자에게만 안보이게 만들기 : type="hidden" -->
		pk(personId) : <input type="hidden" name="id" value="<%=personVo.getPersonId()%>">
		<br>
		<button type="submit">수정</button>
	</form>
	
	
	
	
	
</body>
</html>