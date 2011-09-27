class StoreController < ApplicationController
  skip_before_filter :authorize
  def index
    #to get the photos from the database with the search
    @photos = Photo.search(params[:search])
    if params[:set_locale]
    redirect_to store_path(:locale => params[:set_locale])
    else
     @photos=   Photo.paginate :page=>params[:page],
               :per_page => 5
    @cart = current_cart
  end

end
end
