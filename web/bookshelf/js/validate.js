var isValidPassword=false;
var isValidUserId=false;

function checkUserId(argument) {
	var label = this.parentElement.getElementsByTagName("label")[0];
	if(this.value.length < 6) {
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
	if(!isCorrect || password.length < 6) {
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

function findGetParameter(parameterName) {
    var result = "";
    tmp = [];
    var items = location.search.substr(1).split("&");
    for (var index = 0; index < items.length; index++) {
        tmp = items[index].split("=");
        if (tmp[0] === parameterName) result = decodeURIComponent(tmp[1]);
    }
    return result;
}


function checkURL() {
    s = findGetParameter("error");    
    if(s.length > 0) {
        var o = document.querySelectorAll(".content ")[0];
        o.innerHTML = "<div class='error-bar'>Invalid User name or Password</div>";
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

checkURL();