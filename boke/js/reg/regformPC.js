function changeVerificationCode() {
		var verificationCodeImage = document
				.getElementById("verificationCodeImage");
		verificationCodeImage.src = "verification_code.do?random="
				+ new Date().getTime();
	}

	function hideError() {
		document.getElementById("userNameEmpty").style.display = "none";
		document.getElementById("userNameExist").style.display = "none";
		document.getElementById("passwordEmpty").style.display = "none";
		document.getElementById("password2Error").style.display = "none";
// 		document.getElementById("codeEmpty").style.display = "none";
// 		document.getElementById("codeError").style.display = "none";
	}

	function checkItem( id,msgshow)
	{
		var v = document.getElementById(id);

		if (v.value.length <= 0) {
			alert( msgshow);
			return false;
		}
		return true;
	}
	function checkSubmit() {
		hideError();

		var m1 = document.getElementById("userNameEmpty");
		var m2 = document.getElementById("passwordEmpty");
		var m3 = document.getElementById("password2Error");
		var m4 = document.getElementById("codeEmpty");

		var u = document.getElementById("sysuser.loginName");
		var p = document.getElementById("sysuser.password");
		var p2 = document.getElementById("password2");
		var v = document.getElementById("verificationCode");
		
		var result= checkItem("inputname","请输入真实姓名");
		if(result == false)
			return false;
		
		if (u.value.length <= 0) {
			u.focus();
			m1.style.display = "block";
			return false;
		}

		if (p.value.length <= 0) {
			p.focus();
			m2.style.display = "block";
			return false;
		}

		console.log('-- '+ p.value);
		console.log('--p2 '+ p2.value);
		if (p.value != p2.value) {
			p2.focus();
			m3.style.display = "block";
			return false;
		}

// 		if (v.value.length <= 0) {
// 			v.focus();
// 			m4.style.display = "inline-block";
// 			return false;
// 		}
		document.forms[0].submit();
	}
	
	function checkSubmitTest()
	{
		document.forms[0].submit();
		
	}

	function showFaceBox() {
		var box = document.getElementById("faceBox");
		var myFace = document.getElementById("myFace");
		if (box.style.display == "none") {
			box.style.display = "block";
			myFace.title = "隐藏可选头像";
		} else {
			box.style.display = "none";
			myFace.title = "显示可选头像";
		}
	}
	
	function changeFace(facePic, faceId) {
		document.getElementById("myFace").src = "images/face/"+facePic;
		document.getElementById("faceId").value=faceId;
		document.getElementById("faceBox").style.display = "none";
	}