class UsuariosController < ApplicationController
  before_filter :user_logeado, only: [:edit, :update, :index, :destroy]
  before_filter :user_correcto, only: [:edit, :update]
  before_filter :admin_user, only: :destroy

  def index
    @usuarios = Usuario.paginate(page: params[:page])
  end

  def new
  	@usuario = Usuario.new
  end

  def show
  	@usuario = Usuario.find(params[:id])
    @tuits = @usuario.tuits.paginate(page: params[:page])
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

  def edit
    #@usuario = Usuario.find(params[:id])
  end

  def update
    #@usuario = Usuario.find(params[:id])
    if @usuario.update_attributes(params[:usuario])
      flash[:success] = "Perfil editado!"
      login @usuario
      redirect_to @usuario
    else
      render 'edit'
    end
  end

  def destroy
    Usuario.find(params[:id]).destroy
    flash[:success] = "Usuario borrado!"
    redirect_to usuarios_path
  end

  private
  
  def user_correcto
    @usuario = Usuario.find(params[:id])
    redirect_to root_path unless current_usuario?(@usuario)
  end

  def admin_user
    redirect_to(root_path) unless current_usuario.admin?
  end
end
