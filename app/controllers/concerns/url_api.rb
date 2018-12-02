module UrlApi

	def sessions_login
		url_login = {"url": "18.216.157.143/sessions", "method": "POST"}
	end

	def do_map_reduce(vehicle_id)
		url_map_reduce = {"url":"18.216.157.143/" + vehicle_id + "/all_missions_vehicle", "method": "GET"}

	def sessions_logout
		redirect_to "/login"
	end

	def authenticate_with_token!
		byebug
		render json: {errors: "Unauthorized access!"}, status: 401 unless current_user.present?
	end

	def user_loggen_in?
		current_user.present?
	end


end