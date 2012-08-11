module UsuariosHelper
	def gravatar_for(usuario)
		gravatar_id = Digest::MD5::hexdigest(usuario.email.downcase)
	    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
	    image_tag(gravatar_url, alt: usuario.name, class: "gravatar")
	end
end
