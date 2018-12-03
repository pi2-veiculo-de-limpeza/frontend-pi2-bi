class DashboardController < ApplicationController
	require 'net/http'
	
	def create
		if params["login"] and params["password"]
			uri = URI(sessions_login[:url])
			http = Net::HTTP.new(uri.host, uri.port)
			req = Net::HTTP::Post.new(uri.path, {'Content-Type' =>'application/json'})
			email = params["login"]
			password = params["password"]
			req.body = {:session =>{:email => email, :password =>  password}}.to_json
			resp = http.request(req)
			if resp.code == "200"
				@user = JSON.parse(resp.body)
				sign_in(@user)
				redirect_to dashboard_path(@user["_id"]["$oid"])
			else
				flash[:errors] = "preencha o email e a senha corretamente"
				redirect_to login_path
			end
		else
		 	flash[:errors] = "preencha o email e a senha corretamente"
		 	redirect_to login_path
		end
	end

	def show
		token = current_token
		
		uri = URI(vehicles_url[:url])
        http = Net::HTTP.new(uri.host, uri.port)
        req = Net::HTTP::Get.new(uri.path, {'Content-Type' =>'application/json',  
          'Authorization' => token})
        res = http.request(req)
        if res.code == "200"
        	@vehicles = JSON.parse(res.body)
        	request_etl =  do_map_reduce(@vehicles[0]["_id"]["$oid"])
       		uri = URI(request_etl[:url])
        	http = Net::HTTP.new(uri.host, uri.port)
        	req = Net::HTTP::Get.new(uri.path, {'Content-Type' =>'application/json', 'Authorization' => token})

        	resp = http.request(req)

        	@etl_missions_vehicles = JSON.parse(resp.body)
        	
        else
        	flash[:errors] = "preencha o email e a senha corretamente"
        end
        puts "response #{res.body}"
        puts JSON.parse(res.body)

	end

	def index


	end

	def destroy

	end

	private

	def session_params
		params.require(:session).permit(:email, :password)
	end
end
