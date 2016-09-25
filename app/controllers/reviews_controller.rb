class ReviewsController < ApplicationController
	before_action :find_play
	before_action :find_review, only: [:edit, :update, :destroy]

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

	def edit
	end

	def update
		if @review.update(review_params)
			redirect_to @play
		else
			render 'edit'
		end
	end

	def destroy
		@review.destroy
		redirect_to @play
	end

	private
		def find_play
			@play = Play.find(params[:play_id])
		end

		def find_review
			@review = Review.find(params[:id])
		end

		def review_params
			params.require(:review).permit(:rating, :comment)
		end
end
