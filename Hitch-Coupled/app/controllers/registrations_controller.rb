class RegistrationsController < Devise::RegistrationsController
 require 'imgur'
 








      def create
          build_resource
       
          if resource.save
           
            if resource.active_for_authentication?
           
              set_flash_message :notice, :signed_up if is_navigational_format?
              sign_up(resource_name, resource)
              return render :json => {:success => true}
            else
             
             p current_user.cars
              set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
              expire_session_data_after_sign_in!
              return render :json => {:success => true}
            end
          else
          
            clean_up_passwords resource
            return render :json => {:success => false}
          end
        end
       
        # Signs in a user on sign up. You can overwrite this method in your own
        # RegistrationsController.
        def sign_up(resource_name, resource)
          sign_in(resource_name, resource)
        end



################################################################

  private

  def sign_up_params
      if params[:user][:profile_pic].nil?
        image_url = "http://www.topnotchentertainment.in/images/artist/default.jpg"
      else
        imgur_client = Imgur.new("57a446e074f93b5")
        image_path = params[:user][:profile_pic].tempfile.path
        image = Imgur::LocalImage.new(image_path)
        image_url = imgur_client.upload(image).link
      end
      puts image_url
      params[:user][:profile_pic] = image_url
    
    params.require(:user).permit(:first_name, :last_name, :phonenumber, :birthdate, :email, :password, :password_confirmation, :profile_pic)
  end

  def account_update_params
    params.require(:user).permit(:first_name, :last_name, :phonenumber, :birthdate, :email, :password, :password_confirmation)
  end
end
