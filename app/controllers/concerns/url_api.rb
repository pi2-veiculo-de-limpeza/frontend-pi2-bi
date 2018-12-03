module UrlApi

	def sessions_login
		url_login = {"url": "http://18.216.157.143/sessions", "method": "POST"}
	end

	def vehicles_url
		url_vehicles = {"url": "http://18.216.157.143/vehicles", "method": "GET"}
	end

	def do_map_reduce(vehicle_id)
		url_map_reduce = {"url": "http://18.216.157.143/vehicles/" + vehicle_id + "/faz_map_reduce", "method": "GET"}
	end

	def sessions_logout
		redirect_to "/login"
	end

end