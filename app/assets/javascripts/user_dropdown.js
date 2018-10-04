document.addEventListener("turbolinks:load", function(){

$('.dropdown-toggle').on('click', function(e){
	$('.dropdown-toggle').dropdown();
})

});