<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">    
<%@ include file="/WEB-INF/views/common/public.jsp" %>
<%@ include file="/WEB-INF/views/nav.jsp" %>   
<title>BitCamp</title>
<div class="container">
	<div class="row">
        <div class="col-lg-12">
            <!-- ★★★ Tab Panel -->
            <div id="communityList" class="tab-content">
                <!-- ★★★ 가입 커뮤니티 -->
                <div class="tab-pane fade active in" id="joined">
                    <div class="page-header">
                        <h2 id="container">회원목록</h2>
                    </div>
                    
                    <div class="panel panel-default">
                        <div class="panel-body">
                            <form class="form-search">
                                <div class="input-group">
                                    <input type="text" class="form-control" placeholder="회원명 또는 ID">
                                    <span class="input-group-btn">
                                        <button type="submit" class="btn btn-primary">검색</button>
                                    </span>
                                </div>
                            </form>
                        </div>
                    </div>

 					<div class="table-responsive">
                        <table class="table table-striped table-bordered table-hover">
                            <thead>
                            <tr>
                            	<th class="text-center">탈퇴여부</th>
                                <th class="text-center">번호</th>
                                <th class="text-center">ID</th>
                                <th class="text-center">회원명</th>
                                <th class="text-center">전화번호</th>
                                <th class="text-center">가입일</th>
                            </tr>
                            </thead>
                            <tbody>
                            
                        	<c:if test="${mList==null}">
                        	<tr><td colspan="5" class="text-center">가입한 회원이 없습니다.</td></tr>
                        	</c:if>
                         	 <c:if test="${mList!=null}">
								<c:forEach items="${mList}" var="mList" varStatus="status">
	                           	  <tr>
	                           		<td class="text-center">
	                           			<c:if test ="${mList.sts==1}">
	                           				가입
	                           			</c:if>
	                           			<c:if test ="${mList.sts==0}">
	                           				탈퇴
	                           			</c:if>
	                           		</td>
	                            	  	<td class="text-center">${status.count}</td>
	                              	<td>${mList.id}</td>
	                              	<td><a href="./view.html">${mList.name}</a></td>
	                              	<td>${mList.pnum}</td>
	                             		<td>${mList.regdate}</td> 
	                             </tr>
	                           	</c:forEach>
                            </c:if>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%@ include file="/WEB-INF/views/footer.jsp" %>


