class UsersController < ApplicationController
	def show
		user = User.find(params[:id])
		
		if user
			render json: {user: user}
		# else
		# 	status 400
		end
	end

	private

	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :phonenumber, :password, :password_confirmation)
  end
end
