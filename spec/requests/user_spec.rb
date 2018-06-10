require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :request do 
	describe "POST /users" do
		
		it "responds with a 200 code" do
			post "/api/v1/users"
			have_http_status(200)
		end 

		it "creates a new user with new data" do
			auth = { 
				provider: "facebook", 
				uid: "1231fsdasda", 
				info: {
					email: "r@email.com"
				} 
			}

			expect{
				post "api/v1/users", { auth: auth}
			}.to change(User, :count).by(1)
		end
	end
end