document.addEventListener("turbolinks:load", function(){

	initialStar = (Math.trunc($('.totalRating').text()));
	$('.rating').awesomeRating({
		targetSelector: "div.bookRating",
		valueInitial:   initialStar,
	});

	$('.rating-star').click(function(){
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