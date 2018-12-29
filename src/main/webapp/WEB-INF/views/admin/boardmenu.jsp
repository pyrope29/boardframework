<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/public.jsp"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<style type="text/css">
.menu_list { width: 200px; }
.menu_category {
	padding: 5px 10px;
	cursor: pointer;
	position: relative;
	font-weight: bold;
	background-color: darkgray;
	color: lightgray;
}
.menu_body {
	display: none;
	text-align: left;
}
.menu_body a {
	display: block;
	background: lightgray;
	padding: 10px;
	text-decoration: none;
}

.menu_body a:hover {
	color: steelblue;
	text-decoration: underline;
}
nav {
	margin-bottom: 30px;
}
</style>
<script type="text/javascript">
$(document).ready(function() {
	$("#boardmenu p.menu_category").click(function() {
		$(this).next("div.menu_body").slideDown(500).siblings("div.menu_body").slideUp("slow");
	});
});
</script>

<%@ include file="/WEB-INF/views/nav.jsp" %>   
<%@ include file="/WEB-INF/views/side.jsp"%> 
		 <div class="col-lg-9">
		 
		 
		 </div>
	 </div><!-- div row end -->
<%@ include file="/WEB-INF/views/footer.jsp" %>  
