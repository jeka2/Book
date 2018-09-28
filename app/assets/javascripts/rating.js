document.addEventListener("turbolinks:load", function(){

	$('.rating').awesomeRating({
		targetSelector: "span.bookRating",
		valueInitial:   $('.persistent_rating').data('rating'),
	});

	$('.rating-star').click(function(){
		console.log($('.persistent_rating').data('rating'))
		$userRating = $('.bookRating').text();
		$bookId     = $('.book_id').data('id');
		$.ajax({
			type: "POST",
			url:  "/ratings",
			data: {
				user_rating: $userRating,
				book_id: 	 $bookId
			}
		})
		
	});

});