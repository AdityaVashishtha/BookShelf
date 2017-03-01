function searchBarUp(e) {
	// body...	
	var text = sBar.value.trim();
	if(text.length > 0) {
		MainBar = document.querySelectorAll(".main-search-div")[0];
		if(MainBar) {
			MainBar.className = "search-div";
			document.querySelectorAll('.result-div')[0].style.display='block';
			// todo : add filter things to it and then display it
			//document.querySelectorAll('.filter-div')[0].style.display='block';
		}		
	}
}
var isMenuOpened = false;
function menuOpen(argument) {
	var menuClass = this.className;
	if(menuClass=="menu-button") {		
		if(!isMenuOpened) {
			x = document.querySelectorAll(".float-menu")[0].style.display="block";
			isMenuOpened=true;		
			argument.stopPropagation();		
			return 0;				
		}			
		else {
			x = document.querySelectorAll(".float-menu")[0].style.display="none";					
			isMenuOpened =false;
			return 0;
		}			
	}
}
function menuSafe(argument) {
	//alert("Float CLick");
	argument.stopPropagation();
}
function menuClose(argument) {
	var menuClass = this.className;		
	//alert(menuClass);
	if(isMenuOpened) {		
		if(menuClass!="float-menu") {				
			x = document.querySelectorAll(".float-menu")[0].style.display="none";
			isMenuOpened=false;			
			return 0;					
		} 		
	}	
}

var sBar = document.querySelectorAll(".main-search-div > input[type=text]")[0];
if(sBar)
	sBar.addEventListener('keyup',searchBarUp,false);

var menuButton = document.querySelectorAll(".menu-button")[0];
menuButton.addEventListener('click',menuOpen,false);

var menu = document.querySelectorAll(".float-menu")[0];
menu.addEventListener('click',menuSafe,false);

var body = document.getElementsByTagName("html")[0];
body.addEventListener('click',menuClose,false);
