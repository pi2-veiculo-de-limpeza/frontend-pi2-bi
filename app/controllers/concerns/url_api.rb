module UrlApi

	def sessions_login
		url_login = {"url": "18.216.157.143/sessios", "method": "POST"}
	end

	def authenticate_with_token!
		byebug
		render json: {errors: "Unauthorized access!"}, status: 401 unless current_user.present?
			
	end

	def user_loggen_in?
		current_user.present?
	end


end