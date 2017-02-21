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

var submitButton = document.querySelectorAll("input[name=submit]")[0];
submitButton.disabled =true;
submitButton.style.cursor = "not-allowed";
submitButton.addEventListener('mouseover',validate,false);

var menuButton = document.querySelectorAll("input[name=userid]")[0];
menuButton.addEventListener('keyup',checkUserId,false);

menuButton = document.querySelectorAll("input[name=password]")[0];
menuButton.addEventListener('keyup',passwordCheck,false);