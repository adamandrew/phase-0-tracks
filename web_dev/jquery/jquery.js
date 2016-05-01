$(document).ready(function(){
	$("#toggle_heading").click(function(){
		$("h1").toggle();
	});

	$("#fade_toggle").click(function(){
		$("#fade_toggle_p").fadeToggle();
	});

	$("#square").mouseenter(function(){
		$(this).animate({height:'200px',width:'200px',fontSize:'2em'},100);
		$(this).css('color','red');
	});

	$("#square").mouseleave(function(){
		$(this).animate({height:'100px',width:'100px',fontSize:'1em'},100);
		$(this).css('color','white');
	});
});