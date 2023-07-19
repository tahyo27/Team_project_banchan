<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<h1 class="h2 pb-4">마이페이지</h1>
<ul class="list-unstyled side-menu">
	<li class="pb-3">
		<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="m_user_udpate.do">
			회원정보
			<i class="fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
	</li>
	<li class="pb-3">
		<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="ab_selectAll.do?member_num=${user_num}">
			배송주소록
			<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
	</li>
	<li class="pb-3">
		<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="o_mypageOrders.do">
			주문조회
			<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
	</li>
	<li class="pb-3">
		<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="re_selectAll.do?member_id=${user_id}">
			my리뷰
			<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
	</li>
	<li class="pb-3">
		<a class="collapsed d-flex justify-content-between h3 text-decoration-none" href="boardList.do">
			Q&A
			<i class="pull-right fa fa-fw fa-chevron-circle-down mt-1"></i>
		</a>
	</li>
</ul>