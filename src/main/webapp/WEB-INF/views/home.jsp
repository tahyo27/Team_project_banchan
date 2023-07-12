<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ page session="false" %> --%>
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
<a href="findPwView.do">findPw</a>
<a href="login.do">login</a>
<a href="logout.do">logout</a>
<a href="SNS_Login.do">SNS 로그인</a>
<a href="jsptest">CSS JSP테스트 페이지</a>
<hr>
<a href="pr_selectAll.do">product selectAll</a>
<a href="pr_insert.do">product insert</a>
<hr>
<a href="c_selectAll.do?member_id=${user_id}">cart selectAll</a>
<hr>
<a href="re_selectAll.do?member_id=${user_id}">review selectAll</a>
<hr>
<a href="pr_selectCategory.do?category_num=1">category select 볶음·구이</a>
<a href="pr_selectCategory.do?category_num=2">category select 고기반찬</a>
<a href="pr_selectCategory.do?category_num=3">category select 국·탕·찌개</a>
<a href="pr_selectCategory.do?category_num=4">category select 조림·나물·무침</a>
<a href="pr_selectCategory.do?category_num=5">category select 김치</a>





</body>
</html>
