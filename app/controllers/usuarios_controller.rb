class UsuariosController < ApplicationController
  def new
  	@usuario = Usuario.new
  end

  def show
  	@usuario = Usuario.find(params[:id])
  end
  def create
  	flash[:success] = "Bienvenido al Tuitor!"
  	@usuario = Usuario.new(params[:usuario])
  	if @usuario.save
  		redirect_to @usuario
  	else
  		render 'new'
  	end
  end
end
