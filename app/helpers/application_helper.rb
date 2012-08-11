module ApplicationHelper

	def titulo_entero(titulo)
		titulo_base = "Tuitor"
		if titulo.empty?
			titulo_base
		else
			"#{titulo_base} | #{titulo}"
		end
	end
end
