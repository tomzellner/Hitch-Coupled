class SessionsController < Devise::SessionsController


  

def new
  super
end

def create
  self.resource = warden.authenticate!(auth_options)
    render :status => 200,
           :json => { :success => true,
                      :info => "Logged in",
                      :user => current_user
           }
  end

end