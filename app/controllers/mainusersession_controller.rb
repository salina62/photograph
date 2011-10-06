class MainusersessionController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :userauthorize
  def new
  end

  def create
    if mainuser = Mainuser.authenticate(params[:name], params[:password])
      session[:mainuser_id] = mainuser.id
      redirect_to mainuserpage_url
   else
   redirect_to userlogin_url, :alert => "Invalid user/password combination"
end
  end

  def destroy
    session[:mainuser_id] = nil
    redirect_to store_url, :notice => "Logged out"
  end

end


