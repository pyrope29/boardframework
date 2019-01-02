<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/public.jsp"%>

<script>

	function hasError(id, text){
		if($("#"+id).val().trim() == '') {
			$("#"+id+"ValidateNull").text(text+" 입력해 주세요");
			$("#"+id).focus();
			$("#"+id).blur(function() {
				if ($("#"+id).val() != '') {
					$("#"+id+"ValidateNull").empty();
				}
			});
			return false;
		} else {
			return true;
		}
	}
	function formCheck() {
		//입력값 null check
 		if(hasError("id","아이디") && 
 			hasError("name","이름") && 
 			hasError("pw", "비밀번호") &&
			hasError("pwCheck", "비밀번호 체크") &&
			hasError("bdate", "생년월일 날짜") && 
			hasError("pnum", "전화번호") && 
			hasError("zcode", "우편번호") && 
			hasError("addr", "주소") ) {

 			return true;
 		} else {
 			return false;
 		}
	}

	$(function() {
		var regExp = /^[a-z0-9_]{4,16}$/;
		var regPwExp = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
		var regBdateExp = /^(19[1-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		var regPnumExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		var regZcodeExp = /^[0-9_]{5}$/;
		var regAddrExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{1,50}$/;
		//아이디 확인
		$('#id').blur(function() {
			if (!regExp.test($("#id").val()) && $("#id").val().trim() != '') {
				$("#idValidate").text("4~16자 영문 소문자, 숫자를 입력해 주세요.");
				$("#id").focus();
			} else {
				$.ajax({
					url : "${root}/member/idCheck",
					data : {
						"id" : $('#id').val()
					},
					type : 'POST',
					dataType : 'text',
					success : function(data) { 
						if (data == "YES") {
							if ($('#id').val() != '') {
								$("#idValidate").empty();
							}
						} else if(data == "NO"){
							if ($('#id').val() != '') {
								$("#idValidate").empty().text("중복된 아이디입니다.");
								$('#id').focus();
							}
						}
					},
					error : function(request, status, error) {
						alert("code : " + request.status + "\n" + 
								"message : " + request.responseText + "\n" + 
								"error : " + error) ;
					}
				});
			}
		});
		//이름 확인
		$("#name").blur(function() {
			if (!regExp.test($("#name").val()) && $("#name").val().trim() != '') {
				$("#nameValidate").text("특수문자를 제외한 4~16자 영문 소문자, 숫자 입력해 주세요.");
				$(this).focus();
			} else {
				$("#nameValidate").empty();
			}
		});
		
	//비밀번호 확인
		$('#pw').blur(function() {
			
			if (!regPwExp.test($("#pw").val()) && $("#pw").val().trim() != '' ) {
				$("#pwValidate").text("6~20자 영문 소문자, 숫자, 특수문자를 입력해 주세요.");
				$("#pw").focus();
			} else if (/(\w)\1\1/.test($("#pw").val()) && $("#pw").val().trim() != '') {
				$("#pwValidate").text("비밀번호에 동일한 문자를 3번 이상 입력할 수 없습니다.");
				$("#pw").focus();
			} else {
				$("#pwValidate").empty();
			}
		});
	
		$('#pwCheck').blur(function() {
			if ($('#pw').val() != $(this).val()) {
				if ($(this).val() != '') {
					$("#pwCheckValidate").text("비밀번호가 동일하지 않습나다");
					$(this).focus();
				}
			} else {
				$("#pwCheckValidate").empty();
			}
		});
		//생년월일 확인
		$("#bdate").blur(function() {
			if (!regBdateExp.test($("#bdate").val()) && $("#bdate").val().trim() != '' ) {
				$("#bdateValidate").text("올바른 생년월일을 입력해 주세요. 입력 예 (2000-12-01)");
				$(this).focus();
			} else {
				$("#bdateValidate").empty();
			}
		});
		
		//전화번호 확인
		
		$("#pnum").blur(function() {
			if (!regPnumExp.test($("#pnum").val()) && $("#pnum").val().trim() != '' ) {
				$("#pnumValidate").text("-를 포함한 숫자를 입력해 주세요. 입력 예 (010-1234-5678)");
				$("#pnum").focus();
			} else {
				$("#pnumValidate").empty();
			}
		});
		//우편번호 확인
		$("#zcode").blur(function() {
			if (!regZcodeExp.test($("#zcode").val()) && $("#zcode").val().trim() != '' ) {
				$("#zcodeValidate").text("올바른 우편번호를 입력해 주세요. 입력 예 (01234)");
				$("#zcode").focus();
			} else {
				$("#zcodeValidate").empty();
			}
		});
		//주소 확인 
		$("#addr").blur(function() {
			if (!regAddrExp.test($("#addr").val()) && $("#addr").val().trim() != '' ) {
				$("#addr").focus();
				$("#addrValidate").text("올바른 주소를 입력해 주세요.");
			} else {	
				$("#addrValidate").empty();
			}
		});
	});
</script>
<div class="navbar navbar-default navbar-fixed-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target=".navbar-responsive-collapse">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
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
				<form class="form-horizontal" name="joinForm" action="${root}/member" method="post"
					onsubmit="return formCheck();">
					<fieldset>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>아이디</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" placeholder="4~16자 영문 소문자, 숫자를 입력해 주세요."
									name="id" id="id">
							</div>
							<div class="validateInfo" id="idValidateNull"></div>
							<div class="validateInfo" id="idValidate"></div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>이름</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" placeholder="4~16자 영문 소문자, 숫자를 입력해 주세요."
									name="name" id="name">
							</div>
							<div class="validateInfo" id="nameValidateNull"></div>
							<div class="validateInfo" id="nameValidate"></div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>비밀번호</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" placeholder="6~20자 영문 소문자, 숫자, 특수문자를 혼용해 입력해 주세요."
									name="pw" id="pw">
							</div>
							<div class="validateInfo" id="pwValidateNull"></div>
							<div class="validateInfo" id="pwValidate"></div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>비밀번호 확인</label>
							<div class="col-lg-6">
								<input type="password" class="form-control"
									placeholder="비밀번호 확인" id="pwCheck">
							</div>
							<div class="validateInfo" id="pwCheckValidateNull">
								</div>
								<div class="validateInfo" id="pwCheckValidate">
								</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>생년월일</label>

							<div class="col-lg-6">
								<input type="text" class="form-control"
									placeholder="생년월일 (입력 예: 2000-12-01)" name="bdate" id="bdate">
							</div>
							<div class="validateInfo" id="bdateValidateNull">
								</div>
							<div class="validateInfo" id="bdateValidate">
								</div>	
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label">성별</label>

							<div class="col-lg-6">
								<div class="radio">
									<label> <input type="radio" name="gender"
										id="optionsRadios1" value="1" checked=""> 남자
									</label>
								</div>
								<div class="radio">
									<label> <input type="radio" name="gender"
										id="optionsRadios2" value="2"> 여자
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
						
							<label class="col-lg-2 control-label"><span class="info">*</span>전화번호</label>
							<div class="col-lg-6">
								<input type="text" class="form-control"
									placeholder="전화번호  (입력 예: 010-1234-5678)" name="pnum" id="pnum">
							</div>
							
							<div class="validate validateInfo" id="pnumValidateNull"></div>
							<div class="validate validateInfo" id="pnumValidate"></div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>우편번호</label>

							<div class="col-lg-6">
								<input type="text" class="form-control"
									placeholder="우편번호 (입력 예: 01234)" name="zcode" id="zcode">
							</div>
							<div class="validateInfo" id="zcodeValidateNull"></div>
							<div class="validateInfo" id="zcodeValidate"></div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>주소</label>

							<div class="col-lg-6">
								<input type="text" class="form-control" placeholder="주소"
									name="addr" id="addr">
							</div>
							<div class="validateInfo" id="addrValidateNull"></div>
							<div class="validateInfo" id="addrValidate"></div>
						</div>
						<div class="form-group">
							<div class="col-lg-6 col-lg-offset-2">
								<button type="submit" class="btn btn-primary">확인</button>
								<a href="${root}/member/login" class="btn btn-large btn-default">취소</a>
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
					<li><a href="#">커뮤니티 홈</a></li>
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
</body>
</html>
