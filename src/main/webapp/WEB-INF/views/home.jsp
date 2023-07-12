<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>
<hr>
<a href="m_selectAll.do">member selectAll</a>
<a href="m_insert.do">member insert</a>
<a href="ab_selectAll.do?member_num=2">addressbook selectAll</a>
<a href="SNS_Login.do">로그인</a>
<a href="logout.do">logout</a>
<a href="findPwView.do">findPw</a>
<a href="jsptest">CSS JSP테스트 페이지</a>
<hr>
<a href="pr_selectAll.do">product selectAll</a>
<a href="pr_insert.do">product insert</a>
<hr>
<!-- <a href="c_selectAll.do?member_id=user001">cart selectAll</a> -->


</body>
</html>
