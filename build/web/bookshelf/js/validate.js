var isValidPassword=false;
var isValidUserId=false;

function checkUserId(argument) {
	var label = this.parentElement.getElementsByTagName("label")[0];
	if(this.value.length <8) {
		this.style.color="#D99";				
		isValidUserId=false;
	}
	else {
		this.style.color="#08C";				
		isValidUserId=true;
	}	
}
function passwordCheck(argument) {
	var label = this.parentElement.getElementsByTagName("label")[0];
	var password = this.value;
	var isCorrect = /[a-z|1-9]*[@#$%][a-z|1-9]*/.test(password);
	if(!isCorrect || password.length<8) {
		this.style.color="#D99";
		isValidPassword=false;
	}
	else {
		this.style.color="#08C";	
		isValidPassword=true;
	}	
}
function validate(argument) {	
	if(isValidUserId && isValidPassword) {
		submitButton.disabled =false;
		submitButton.style.cursor = "initial";
	}
}

function checkEveryThing() {
	var X = document.querySelectorAll("input[name=fname]")[0];
	fname = X.value;
	X = document.querySelectorAll("input[name=pname]")[0];
	pname = X.value;
	X = document.querySelectorAll("input[name=address]")[0];
	address = X.value;
	X = document.querySelectorAll("input[name=mobile]")[0];
	mobile = X.value;
	X = document.querySelectorAll("input[name=email]")[0];
	email = X.value;
	var isCorrect = /[1-9]|[@#$%]/.test(fname);
	//alert(isCorrect);
	if(isCorrect || fname.length < 8) {
		alert("Not a Valid Name");
	}
	isCorrect = /[1-9]|[@#$%]/.test(pname);
	if(isCorrect || pname.length < 8) {
		alert("Not a Valid Father's Name");
	}
	if(address.length < 10) {
		alert("Not a Valid Address");
	}
	isCorrect = /[a-z|1-9]*[@][a-z|1-9]*[.][a-z|1-9]*/.test(email);
	if(!isCorrect || email.length < 8) {
		alert("Not a Valid Email");
	}
	isCorrect = /[a-z|@$%#]*/.test(mobile);
	if(mobile.length < 10) { //|| (mobile.length < 10) || (mobile.length > 10)) {
		alert("Not a Valid Mobile");
	}
}

var submitButton = document.querySelectorAll("input[name=submit]")[0];
submitButton.disabled =true;
submitButton.style.cursor = "not-allowed";
submitButton.addEventListener('mouseover',validate,false);

var menuButton = document.querySelectorAll("input[name=userid]")[0];
menuButton.addEventListener('keyup',checkUserId,false);

menuButton = document.querySelectorAll("input[name=password]")[0];
menuButton.addEventListener('keyup',passwordCheck,false);