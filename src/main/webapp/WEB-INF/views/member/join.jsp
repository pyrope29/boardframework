<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/public.jsp"%> 
<script>
$(document).ready(function() {
	//비밀번호 확인
	$('#pwCheck').blur(function(){
	   if($('#pw').val() != $('#pwCheck').val()){
	    	if($('#pwCheck').val()!=''){
		    alert("비밀번호가 일치하지 않습니다.");
	    	    $('#pwCheck').val('');
	          $('#pwCheck').focus();
	       }
	    }
	});  
	
	

	
	$("#modifyBtn").on("click", function() {
		alert( $("input[name=gender]:checked").val());

		var parameter = JSON.stringify({'id' : $("#id").val(), 'name' :  $("#name").val(), 
			'bdate' :  $("#bdate").val(), 'gender' : $("input[name=gender]:checked").val(), 'pnum' :  $("#pnum").val(), 
			'addr' :  $("#addr").val()});
		alert(parameter);
		$.ajax({
				url : '${root}/member',
				type : 'PUT',	
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : parameter,
				success : function (data) {
					alert("data : " + data);
				}
			});
		});
	});	


</script>
<!-- Main Navigation ========================================================================================== -->
<div class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-responsive-collapse">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">BitCamp</a>
        </div>
    </div>
</div>
<!-- Container ======================================================================================= -->
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="page-header">
                <h2 id="container">회원 가입하기</h2>
            </div>
            <div class="well">
                <p>회원가입을 위해 아래 내용들을 작성해 주세요.</p>
                <form class="form-horizontal" action="${root}/member" method="post">
                    <fieldset>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">아이디</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" placeholder="아이디" name="id" id="id">
                            </div>
                            <p>* 영문 혹은 영문, 숫자 조합으로만 작성하세요.</p>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">이름</label>
                            <div class="col-lg-6">
                                <input type="text" class="form-control" placeholder="이름" name="name" id="name">
                            </div>
                            * 이름은 6글자까지 작성 가능합니다.
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호</label>

                            <div class="col-lg-6">
                                <input type="password" class="form-control" placeholder="비밀번호" name="pw" id="pw">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">비밀번호 확인</label>

                            <div class="col-lg-6">
                                <input type="password" class="form-control" placeholder="비밀번호 확인" id="pwCheck">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">생년월일</label>

                            <div class="col-lg-6">
                                <input type="text" class="form-control" placeholder="생년월일 (입력 예: 2000-12-01)" name="bdate">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">성별</label>

                            <div class="col-lg-6">
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" id="optionsRadios1" value="1" checked="">
                                        남자
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" id="optionsRadios2" value="2">
                                        여자
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">전화번호</label>

                            <div class="col-lg-6">
                                <input type="text" class="form-control" placeholder="전화번호" name="pnum">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">우편번호</label>

                            <div class="col-lg-6">
                                <input type="text" class="form-control" placeholder="우편번호" name="zcode">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-2 control-label">주소</label>

                            <div class="col-lg-6">
                                <input type="text" class="form-control" placeholder="주소" name="addr">
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-lg-6 col-lg-offset-2">
                                <button type="submit" class="btn btn-primary">확인</button>
                                <a href="./login.html" class="btn btn-large btn-default">취소</a>
                            </div>
                        </div>
                    </fieldset>
                </form>
            </div>
        </div>
    </div>
<!-- Footer ========================================================================================== -->
    <footer>
        <div class="row">
            <div class="col-lg-12">
                <ul class="list-unstyled">
                    <li class="pull-right"><a href="#top">위로 이동</a></li>
                    <li><a href="#">커뮤니티 홈</a>
                    </li>
                    <li><a href="#">RSS</a></li>
                    <li><a href="#">이용약관</a></li>
                    <li><a href="#">도움말</a></li>
                    <li><a href="#">회원탈퇴</a></li>
                </ul>
                <p>© BitCamp 2018.</p>
            </div>
        </div>
    </footer>
</div>

<script src="${root}/js/jquery-2.1.0.js"></script>
<script src="${root}/js/bootstrap.min.js"></script>
<script src="${root}/js/bootswatch.js"></script>
</body>
</html>
    
    