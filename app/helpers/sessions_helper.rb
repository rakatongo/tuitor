module SessionsHelper
	def login(usuario)
		cookies.permanent[:remember_token] = usuario.remember_token
		self.current_usuario = usuario
	end

	def current_usuario=(usuario)
		@current_usuario = usuario
	end

	def current_usuario
		@current_usuario ||= Usuario.find_by_remember_token(cookies[:remember_token])
	end

	def current_usuario?(usuario)
		usuario == current_usuario
	end

	def logueado?
		!current_usuario.nil?
	end

	def logout
		self.current_usuario = nil
		cookies.delete(:remember_token)
	end

	def redirect_back_or(default)
		redirect_to(session[:return_to] || default)
		session.delete(:return_to)
	end

	def store_location
		session[:return_to] = request.fullpath
	end
end
