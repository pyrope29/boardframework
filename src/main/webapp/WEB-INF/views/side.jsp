<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!-- Container ======================================================================================= -->

<div class="container-fluid" style="margin-top:50px">			<!-- div side container-fluid start -->
	<div class="row">			<!-- div row start -->
		<div class="col-lg-3">	<!-- div -lg-3 start -->
			<div id="boardmenu" class="menu_list" align="center">
				<c:set var="idx" value="0"/>
				<c:forEach varStatus="i" var="board" items="${menu}">
					<c:if test="${board.ccode != idx}">
						<p class="menu_category">${board.cname}</p>
						<c:set var="idx" value="${board.ccode}"/>
						<div class="menu_body">
					</c:if>
					<a href="${root}/${board.control}/list.bit?bcode=${board.bcode}&pg=1&key=&word=">${board.bname}</a>
					<c:if test="${i.index < menu.size() - 1}">
						<c:if test="${idx !=  menu.get(i.index + 1).ccode}">
						</div>
					</c:if>
					</c:if>
				</c:forEach>
			</div>
		</div> <!-- div lg 3 end -->	
