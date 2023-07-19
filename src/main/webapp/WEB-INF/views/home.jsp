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
<a href="SNS_Login.do">로그인</a>
<a href="logout.do">logout</a>
<a href="findPwView.do">findPw</a>
<a href="m_user_udpate.do">마이페이지 회원정보</a>
<hr>
<a href="pr_selectAll.do">product selectAll</a>
<a href="pr_insert.do">product insert 관리자</a>
<a href="productDetail.do">product update& delete 관리자</a>
<hr>
<a href="c_selectAll.do?member_id=${user_id}">cart selectAll</a>
<hr>
<a href="pr_selectCategory.do?category_num=2">category select 고기반찬</a>
<a href="pr_selectCategory.do?category_num=3">category select 국·탕·찌개</a>
<a href="pr_selectCategory.do?category_num=4">category select 조림·나물·무침</a>
<a href="pr_selectCategory.do?category_num=5">category select 김치</a>
<hr>
<a href="q_selectAll.do">질문목록</a>
<a href="boardList.do">페이징목록</a>





</body>
</html>
