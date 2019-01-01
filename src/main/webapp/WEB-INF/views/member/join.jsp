<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="/WEB-INF/views/common/public.jsp"%>
<script>
	function formCheck() {
		if($("#id").val().trim() == '') {
			$("#id"+"ValidateNull").css('display', 'block');
			$("#id").focus();
			$("#id").blur(function() {
				if ($("#id").val() != '') {
					$("#id"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		} 
		if($("#name").val().trim() == '') {
			$("#name"+"ValidateNull").css('display', 'block');
			$("#name").focus();
			$("#name").blur(function() {
				if ($("#name").val() != '') {
					$("#name"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		} 
		if($("#pw").val().trim() == '') {
			$("#pw"+"ValidateNull").css('display', 'block').text("비밀번호를 입력해 주세요");
			$("#pw").focus();
			$("#pw").blur(function() {
				if ($("#pw").val() != '') {
					$("#pw"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		} 
		if($("#pwCheck").val().trim() == '') {
			$("#pwCheck"+"ValidateNull").css('display', 'block');
			$("#pwCheck").focus();
			$("#pwCheck").blur(function() {
				if ($("#pwCheck").val() != '') {
					$("#pwCheck"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		} 
		if($("#bdate").val().trim() == '') {
			$("#bdate"+"ValidateNull").text("생년월일을 입력해 주세요");
			$("#bdate").focus();
			$("#bdate").blur(function() {
				if ($("#bdate").val() != '') {
					$("#bdate"+"ValidateNull").text("");
				}
			});
			return false;
		} 
		if($("#pnum").val().trim() == '') {
			$("#pnum"+"ValidateNull").css('display', 'block');
			$("#pnum").focus();
			$("#pnum").blur(function() {
				if ($("#pnum").val() != '') {
					$("#pnum"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		} 
		if($("#zcode").val().trim() == '') {
			$("#zcode"+"ValidateNull").css('display', 'block');
			$("#zcode").focus();
			$("#zcode").blur(function() {
				if ($("#zcode").val() != '') {
					$("#zcode"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		}
		if($("#addr").val().trim() == '') {
			$("#addr"+"ValidateNull").css('display', 'block');
			$("#addr").focus();
			$("#addr").blur(function() {
				if ($("#addr").val() != '') {
					$("#addr"+"ValidateNull").css('display', 'none');
				}
			});
			return false;
		} 
			return true;

	}

	$(function() {

		var regIdExp = /^[a-z0-9_]{4,20}$/;
		var regPwExp = /^(?=.*\d)(?=.*[a-z]).{6,20}$/;
		var regBdateExp = /^(19[1-9][0-9]|20\d{2})-(0[0-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/;
		
		//아이디 확인

		$('#id').blur(function() {
			$.ajax({
				url : "${root}/member/idCheck",
				data : {
					"id" : $('#id').val().trim()
				},
				type : 'POST',
				dataType : 'text',
				success : function(data) { 
					if (data == "YES") {
						if ($('#id').val().trim() != '') {
							$("#idValidateNull").css('display','block').empty();
						}
					} else {
						if ($('#id').val().trim() != '') {
							$("#idValidateNull").css('display','block').empty().text("중복된 아이디입니다.");
							$('#id').val('');
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
		});
		

	//비밀번호 확인
		$('#pw').blur(function() {
			
			if (!regPwExp.test($("#pw").val())) {
				$("#pwValidateNull").css('display', 'block').text("6~20자 영문 대 소문자, 숫자, 특수문자를 혼용해 사용하세요.");
				$("#pw").focus();
			} else if (/(\w)\1\1/.test($("#pw").val())) {
				$("#pwValidateNull").css('display', 'block').text("비밀번호에 동일한 문자를 3번 이상 사용하실 수 없습니다.");
				$("#pw").focus();
			} else {
				$("#pwValidateNull").css('display', 'none');
			}
		});
	
		$('#pwCheck').blur(function() {
			if ($('#pw').val() != $(this).val()) {
				if ($(this).val() != '') {
					$("#pwCheckValidateNull").css('display', 'block').text("비밀번호가 동일한지 확인해 주세요");
					$(this).val('');
					$(this).focus();
				}
			} else {
				$("#pwCheckValidateNull").css('display', 'none');
			}
		});
		//전화번호 확인
		var regPnumExp = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
		$("#pnum").blur(function() {
			if (!regPnumExp.test($("#pnum").val())) {
				$("#pnumCheckDiv").css('display', 'block');
				$(this).val('');
				$(this).focus();
			} else {
				$("#pnumCheckDiv").css('display', 'none');
			}
		});
		
		//생년월일 확인
		$("#bdate").blur(function() {
			if (!regBdateExp.test($("#bdate").val())) {
				$("#bdateValidateNull").css('display', 'block').text("올바른 생년월일을 입력해 주세요. 입력 예 (2000-12-01)");
				$(this).val('');
				$(this).focus();
			} else {
				$("#bdateValidateNull").css('display', 'none');
			}
		});
		
		
		//우편번호 화긴 >> 가능하다면 daum api!!! 카페에 있는 그거 써도 ok

		$("#modifyBtn").on("click", function() {
			alert($("input[name=gender]:checked").val());

			var parameter = JSON.stringify({
				'id' : $("#id").val(),
				'name' : $("#name").val(),
				'bdate' : $("#bdate").val(),
				'gender' : $("input[name=gender]:checked").val(),
				'pnum' : $("#pnum").val(),
				'addr' : $("#addr").val()
			});
			alert(parameter);
			$.ajax({
				url : '${root}/member',
				type : 'PUT',
				contentType : 'application/json;charset=UTF-8',
				dataType : 'json',
				data : parameter,
				success : function(data) {
					alert("data : " + data);
				}
			});
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
								<input type="text" class="form-control" placeholder="아이디"
									name="id" id="id">
							</div>
							<div class="info">영문 혹은 영문, 숫자 조합 4자 이상 20자 이하로 작성하세요.</div>
							<div class="validateInfo validate" id="idValidateNull">
								아이디를 입력해 주세요</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>이름</label>
							<div class="col-lg-6">
								<input type="text" class="form-control" placeholder="이름"
									name="name" id="name">
							</div>
							<div class="info">이름은 한글 6자, 영문 12자까지 작성 가능합니다.</div>
							<div class="validateInfo validate" id="nameValidateNull">
								이름을 입력해 주세요</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>비밀번호</label>
							<div class="col-lg-6">
								<input type="password" class="form-control" placeholder="비밀번호"
									name="pw" id="pw">
							</div>
							<!-- <div class="info">영문 혹은 영문, 숫자 조합 6자 이상 20자 내로
								작성하세요.</div> -->
							<div class="validateInfo validate" id="pwValidateNull"></div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>비밀번호 확인</label>
							<div class="col-lg-6">
								<input type="password" class="form-control"
									placeholder="비밀번호 확인" id="pwCheck">
							</div>
							<div class="validateInfo validate" id="pwCheckValidateNull">
								</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>생년월일</label>

							<div class="col-lg-6">
								<input type="text" class="form-control"
									placeholder="생년월일 (입력 예: 2000-12-01)" name="bdate" id="bdate">
							</div>
							<div class="validateInfo validate" id="bdateValidateNull">
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
							
							<div class="validate validateInfo" id="pnumCheckDiv">잘못된
								휴대폰 번호입니다. 숫자, - 를 포함한 숫자만 입력하세요.</div>
							<div class="validate validateInfo" id="pnumValidateNull">
								전화번호를 입력해 주세요</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>우편번호</label>

							<div class="col-lg-6">
								<input type="text" class="form-control"
									placeholder="우편번호 (입력 예: 01234)" name="zcode" id="zcode">
							</div>
							<div class="validateInfo validate" id="zcodeValidateNull">
								우편번호를 입력해 주세요</div>
						</div>
						<div class="form-group">
							<label class="col-lg-2 control-label"><span class="info">*</span>주소</label>

							<div class="col-lg-6">
								<input type="text" class="form-control" placeholder="주소"
									name="addr" id="addr">
							</div>
							<div class="validateInfo validate" id="addrValidateNull">
								주소를 입력해 주세요</div>
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

