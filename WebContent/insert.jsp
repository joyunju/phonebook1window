<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- ■Java 클래스를 import하는 JSP 코드 -->	
<%@ page import="com.javaex.vo.PersonVo"%>
<%@ page import="com.javaex.dao.PhoneDao"%>

<%@ page import="java.util.List"%>
    
<%	
	/* request.getParameter("key") */
	// 파라미터에서 값 꺼내오기
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String company = request.getParameter("company");

	//System.out.println(name);
	//System.out.println(hp);
	//System.out.println(company);
	
	//Person 객체 만들기
	PersonVo personVo = new PersonVo(name, hp, company);
	System.out.println(personVo);
	
	//PhoneDao 객체 만들기
	PhoneDao phoneDao = new PhoneDao();
	
	//PhoneDao의 personInsert()를 이용해서 저장하기
	//phoneDao.personInsert(personVo);
	int count = phoneDao.personInsert(personVo);
	System.out.println(count);
	
	// 리다이렉트코드
	// 동일한 페이지를 열어야할 때
	// 처리 후, 주소창에 http://localhost:8088/phonebook1/list.jsp 엔터쳐줘 이 작업
	// 응답은 리스트로 리다이렉트 시킨다.
	// list.jsp로 다시 요청한다.
	response.sendRedirect("./list.jsp");
	
	
	////////////////////////////////////////////
	//리스트 가져와서 html 섞어 놓는다.
	///////////////////////////////////////////
	List<PersonVo> personList = phoneDao.getPersonList();
	System.out.println(personList);
	
	
	
	
	
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- http://localhost:8088/phonebook1/insert.jsp?name=유재석&hp=010-2222-2222&company=02-2222-2222 -->
	
	<h1>전화번호부</h1>
	<h2>리스트- 저장 후</h2>

	<p>입력한 정보 내역입니다.</p>
	
	<%for(int i =0; i<personList.size(); i++ ){%>
		<table border="1">
		<tr>
			<td>이름(name)</td>
			<td><%=personList.get(i).getName() %></td>
		</tr>
		<tr>
			<td>핸드폰(hp)</td>
			<td><%=personList.get(i).getHp() %></td>
		</tr>
		<tr>
			<td>회사(company)</td>
			<td><%=personList.get(i).getCompany() %></td>
		</tr>
	</table>
	<br>
		
	<%} %>
	
	<a href="./writeForm.jsp">추가번호 등록</a>
</body>
</html>