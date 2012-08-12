class PaginasEstaticasController < ApplicationController
  def home
    if logueado?
    	@tuit = current_usuario.tuits.build 
      @feed_items = current_usuario.feed.paginate(page: params[:page])
    end
  end

  def ayuda
  end

  def contacto
  end

  def about
  	
  end
end
