class PlaysController < ApplicationController
	before_action :find_play, only: [:show, :edit, :update, :destroy]

	def index
		if params[:category].blank?
			@plays = Play.all.order('created_at DESC')
		else
			@category_id = Category.find_by(name: params[:category]).id
			@plays = Play.where(category_id: @category_id).order('created_at DESC')
		end	
	end

	def show
	end

	def new
		@play = current_user.plays.build
	end

	def create
		@play = current_user.plays.build(play_params)

		if @play.save
			redirect_to root_path
		else
			render 'new'
		end
	end

	def edit
	end

	def update
		if @play.update(play_params)
			redirect_to @play
		else
			render 'edit'
		end
	end

	def destroy
		@play.destroy
		redirect_to root_path
	end

	private
		def find_play
			@play = Play.find(params[:id])
		end

		def play_params
			params.require(:play).permit(:title, :description, :director, :category_id, :image)
		end
end
