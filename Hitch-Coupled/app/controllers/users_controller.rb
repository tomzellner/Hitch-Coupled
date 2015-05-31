class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		respond_to do |format|
			format.html
			format.json {render :json => @user}
		end
	end

	private

	def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :birthdate, :phonenumber, :password, :password_confirmation)
  end
end
