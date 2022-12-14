class ReviewsController < ApplicationController
  post '/reviews' do
    movie = Movie.find_by(id: params[:movie_id])
    identical = !!movie.reviews.detect { |review| review.content == params[:content] && review.user_id == current_user.id }
    redirect "/movies/#{params[:movie_id]}?error=Invalid form submission, please try again:" if params.values.any?(&:empty?) || identical

    review = Review.new(
      content: params[:content],
      rating: params[:rating]
    )
    review.reviewer = current_user
    review.movie = Movie.find(params[:movie_id])
    review.save
    redirect "/movies/#{review.movie_id}"
  end

  get '/reviews/:id/edit' do
    @review = Review.find(params[:id])
    redirect :login if @review.reviewer != current_user
    erb :'/reviews/edit.html'
  end

  patch '/reviews/:id' do
    review = Review.find(params[:id])
    review.update(content: params[:content], rating: params[:rating])
    redirect "/movies/#{review.movie_id}"
  end

  delete '/reviews/:id/delete' do
    review = Review.find_by(id: params[:id])
    review.destroy if review.reviewer == current_user
    redirect back
  end
end
