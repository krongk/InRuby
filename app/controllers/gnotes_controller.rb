class GnotesController < ApplicationController
  before_filter :login_required, :only=>[:new,:create,:edit,:update,:destroy]
  # GET /gnotes
  # GET /gnotes.xml
  def index
    @title ="title"
    page = params[:page]
    page = 1 if params[:page].blank?
    @gnotes = Gnote.paginate :page=>page || 1, :per_page=>10, :order=>'created_at desc'
    session[:page] = page
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @gnotes }
    end
  end

  # GET /gnotes/1
  # GET /gnotes/1.xml
  def show
    @gnote = Gnote.find(params[:id])
    @title = @gnote.contact
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @gnote }
    end
  end

  # GET /gnotes/new
  # GET /gnotes/new.xml
  def new
    @gnote = Gnote.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @gnote }
    end
  end

  # GET /gnotes/1/edit
  def edit
    @gnote = Gnote.find(params[:id])
  end

  # POST /gnotes
  # POST /gnotes.xml
  def create
    @gnote = Gnote.new(params[:gnote])

    respond_to do |format|
      if @gnote.save
        flash[:notice] = 'Gnote was successfully created.'
        format.html { redirect_to(@gnote) }
        format.xml  { render :xml => @gnote, :status => :created, :location => @gnote }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @gnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /gnotes/1
  # PUT /gnotes/1.xml
  def update
    @gnote = Gnote.find(params[:id])

    respond_to do |format|
      if @gnote.update_attributes(params[:gnote])
        flash[:notice] = 'Gnote was successfully updated.'
        format.html { redirect_to(@gnote) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @gnote.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /gnotes/1
  # DELETE /gnotes/1.xml
  def destroy
    @gnote = Gnote.find(params[:id])
    @gnote.destroy

    respond_to do |format|
      format.html { redirect_to(gnotes_url) }
      format.xml  { head :ok }
    end
  end
  #search
  def g
    if params[:q]
    @gnotes = Search.gnotes.with(params[:q]).paginate :page=>params[:page]||1,:per_page=>20,:order=>"created_at DESC"
    end
  end
end
