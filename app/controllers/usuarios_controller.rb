class UsuariosController < ApplicationController
  def new
  	@usuario = Usuario.new
  end

  def show
  	@usuario = Usuario.find(params[:id])
  end
  def create  	
  	@usuario = Usuario.new(params[:usuario])
  	if @usuario.save
      login @usuario
  		flash[:success] = "Bienvenido al Tuitor!"
  		redirect_to @usuario
  	else
  		render 'new'
  	end
  end
end
