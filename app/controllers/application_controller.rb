class ApplicationController < ActionController::Base
  before_filter :set_i18n_locale_from_params
  before_filter :authorize
  before_filter :userauthorize
  before_filter :mainadminauthorize
  protect_from_forgery
  
  
  private

   def current_cart
     Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    cart = Cart.create
    session[:cart_id] = cart.id
    cart
end
   
   protected

   def authorize
     if request.format == Mime::HTML
       unless User.find_by_id(session[:user_id])
          redirect_to login_url, :notice => "Please log in"
       end
     else
       authenticate_or_request_with_http_basic do |username, password|
          User.authenticate(username, password)
       end
      end
    end

    protected

    def userauthorize
     if request.format == Mime::HTML
       unless Mainuser.find_by_id(session[:mainuser_id])
          redirect_to userlogin_url, :notice => "Please log in"
       end
     else
       authenticate_or_request_with_http_basic do |username, password|
          Mainuser.authenticate(username, password)
       end
      end
    end

    protected

    def mainadminauthorize
     if request.format == Mime::HTML
       unless Mainadmin.find_by_id(session[:mainadmin_id])
          redirect_to mainadminlogin_url, :notice => "Please log in"
       end
     else
       authenticate_or_request_with_http_basic do |username, password|
          Mainadmin.authenticate(username, password)
       end
      end
    end


  def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end

end
