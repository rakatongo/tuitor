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

	def logueado?
		!current_usuario.nil?
	end

	def logout
		self.current_usuario = nil
		cookies.delete(:remember_token)
	end

end
