<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<div class="container py-5">
	<div class="row">

		<div class="col-lg-3">
			<tiles:insertAttribute name="menu" />
		</div>

		<div class="col-lg-9">
			<tiles:insertAttribute name="section" />
		</div>
	</div>
</div>