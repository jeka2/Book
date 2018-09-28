class RatingsController < ApplicationController
  skip_before_action :verify_authenticity_token

	def create 
    book = Book.find(params[:book_id])
    new_rating = params[:user_rating].to_i
    total_rating = book.rating
    if RatingCounter.where(user_id: current_user.id, book_id: book.id).exists?
      previous_rating = RatingCounter.find_by(user_id: current_user.id, book_id: book.id).rating
      updated_rating = total_rating - previous_rating + new_rating
      book.update(rating: updated_rating)
      previous_rating.update(rating: new_rating)
    else
      book.update(rating: total_rating + new_rating, rating_count: book.rating_count + 1)
      RatingCounter.create(user_id: current_user.id, book_id: book.id, rating: new_rating)
    end
    @updated_rating = book.rating
    @count = book.rating_count
    rating_present = true if book.rating_count != 0
    @book_rating = rating_present ? (book.rating / book.rating_count).round(1) : 0
  end 

end
