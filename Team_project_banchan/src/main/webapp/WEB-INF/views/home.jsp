<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<jsp:include page="css.jsp"></jsp:include>
</head>
<body>
	<div>
		<header id="header">
			<jsp:include page="header.jsp"></jsp:include>
		</header>
		
		<div id="content">
			<jsp:include page="content.jsp"></jsp:include>
		</div>
		
		<footer id="footer">
			<jsp:include page="footer.jsp"></jsp:include>
		</footer>
	</div>

</body>
</html>
