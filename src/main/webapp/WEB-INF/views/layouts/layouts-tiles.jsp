<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<!DOCTYPE html>
<html lang="en">

<head>
	<title>BANCHAN</title>

	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">


	<link rel="apple-touch-icon" href="${pageContext.request.contextPath}/resources/assets/img/apple-icon.png">
	<link rel="shortcut icon" type="image/x-icon" href="${pageContext.request.contextPath}/resources/assets/img/favicon.ico">

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/templatemo.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/custom.css">

	<!-- Load fonts style after rendering the layout styles -->
	<link rel="stylesheet"
		href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;200;300;400;500;700;900&display=swap">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/fontawesome.min.css">
</head>

<body>
	<tiles:insertAttribute name="header" />

	<tiles:insertAttribute name="content" />

	<tiles:insertAttribute name="footer" />

	<!-- Start Script -->
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-1.11.0.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/jquery-migrate-1.2.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/templatemo.js"></script>
	<script src="${pageContext.request.contextPath}/resources/assets/js/custom.js"></script>
	<!-- End Script -->
</body>

</html>