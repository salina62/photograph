class MainusersController < ApplicationController
  # GET /mainusers
  # GET /mainusers.xml
  def index
    @mainusers = Mainuser.order(:name)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @mainusers }
    end
  end

  # GET /mainusers/1
  # GET /mainusers/1.xml
  def show
    @mainuser = Mainuser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @mainuser }
    end
  end

  # GET /mainusers/new
  # GET /mainusers/new.xml
  def new
    @mainuser = Mainuser.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @mainuser }
    end
  end

  # GET /mainusers/1/edit
  def edit
    @mainuser = Mainuser.find(params[:id])
  end

  # POST /mainusers
  # POST /mainusers.xml
  def create
    @mainuser = Mainuser.new(params[:mainuser])

    respond_to do |format|
      if @user.save
        format.html { redirect_to(store_url,
        :notice => "Mainuser #{@mainuser.name} was successfully created.") }
        format.xml  { render :xml => @mainuser, :status => :created, :location => @mainuser }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @mainuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /mainusers/1
  # PUT /mainusers/1.xml
  def update
    @mainuser = Mainuser.find(params[:id])

    respond_to do |format|
      if @mainuser.update_attributes(params[:mainuser])
        format.html { redirect_to(store_url,
         :notice => "Mainuser #{@mainuser.name} was successfully created.") }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @mainuser.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /mainusers/1
  # DELETE /mainusers/1.xml
  def destroy
    @mainuser = Mainuser.find(params[:id])
    @mainuser.destroy

    respond_to do |format|
      format.html { redirect_to(mainusers_url) }
      format.xml  { head :ok }
    end
  end
end
