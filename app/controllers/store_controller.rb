class StoreController < ApplicationController
  skip_before_filter :authorize
  skip_before_filter :userauthorize
  def index
    #to get the photos from the database with the search
    @photos = Photo.search(params[:search])
    if params[:set_locale]
    redirect_to store_path(:locale => params[:set_locale])
    else
     @photos=   Photo.paginate :page=>params[:page], :order=>'created_at asc',
               :per_page => 5
    @cart = current_cart
   end
 end
end
