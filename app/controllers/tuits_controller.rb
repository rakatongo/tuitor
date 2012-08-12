class TuitsController < ApplicationController
	before_filter :user_logeado, only: [:create, :destroy]
	before_filter :correct_user,   only: :destroy
	
	def index
		
	end

	def create
		@tuit = current_usuario.tuits.build(params[:tuit])
		if @tuit.save
			flash[:success] = "Tuiter Creado!"
			redirect_to root_path
		else
			@feed_items = []
			render 'paginas_estaticas/home'
		end		
	end

	def destroy
		@tuits.destroy
		redirect_to root_path
	end

	private

	    def correct_user
	      @micropost = current_user.microposts.find_by_id(params[:id])
	      redirect_to root_path if @micropost.nil?
	    end
end