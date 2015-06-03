class RegistrationsController < Devise::RegistrationsController
 require 'imgur'
  private

  def sign_up_params
    unless !params[:profile_pic]
   imgur_client = Imgur.new("57a446e074f93b5")
  
   image_path = params[:user][:profile_pic].tempfile.path
   
   image = Imgur::LocalImage.new(image_path)
   image_url = imgur_client.upload(image).link
   puts image_url
   params[:user][:profile_pic] = image_url
 end
    params.require(:user).permit(:first_name, :last_name, :phonenumber, :birthdate, :email, :password, :password_confirmation, :profile_pic)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phonenumber, :birthdate, :email, :password, :password_confirmation)
  end
end
