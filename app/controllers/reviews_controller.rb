class ReviewsController < ApplicationController
	before_action :find_play

	def new
		@review = @play.reviews.build
	end

	def create
		@review = @play.reviews.build(review_params)
		@review.user_id = current_user.id

		if @review.save
			redirect_to @play
		else
			render 'new'
		end
	end

	private
		def find_play
			@play = Play.find(params[:play_id])
		end

		def review_params
			params.require(:review).require(:rating, :comment)
		end
end
