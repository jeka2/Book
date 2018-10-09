document.addEventListener("turbolinks:load", function(){
	new ResizeSensor(jQuery('.container-fluid'), function(){
		$containerHeight = $('.container-fluid').height() + 5;
		$('.sizing-control').css('height', $containerHeight);
	});
});