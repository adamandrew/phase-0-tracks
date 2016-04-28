document.body.style.backgroundColor = "green";

var photo = document.getElementById("lizard-photo");

function blend_in() {
	photo.style.visibility = "hidden";
};

function reveal_lizard() {
	photo.style.visibility = "visible";
};

var blendin = document.getElementById("blend-in");
blendin.addEventListener("click", blend_in);

var reveal = document.getElementById("reveal");
reveal.addEventListener("click", reveal_lizard);
