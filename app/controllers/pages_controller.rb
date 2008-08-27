class PagesController < ApplicationController
  before_filter :login_required, :only => [:new, :edit, :create, :update, :destroy]
  
  CamelCase = Regexp.new( '\b((?:[A-Z]\w+){2,})' )
  LocalLink = Regexp.new( '/\[\[(.*?)\]\]/' )

  # GET /pages/1
  # GET /pages/1.xml
  def show
    if !params[:id]
      params[:id] = "Home"
    end
    @space = Space.find_by_key(params[:space_id])
    @page = Page.find_by_title_and_space_id(params[:id], @space)
    @page.text.gsub!( LocalLink, "<a href=\"/spaces/#{@space.key}/pages/\1\">\1</a>" )
    @site_title = @page.title
    
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/new
  # GET /pages/new.xml
  def new
    @site_title = "New Page"
    @page = Page.new
    @page.space = Space.find_by_key(params[:space_id])
  
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @page }
    end
  end

  # GET /pages/1/edit
  def edit
    @space = Space.find_by_key(params[:space_id])
    @page = Page.find_by_title_and_space_id(params[:id], @space)
    @site_title = "Editing " + @page.title
  end

  # POST /pages
  # POST /pages.xml
  def create
    @page = Page.new(params[:page])
    @page.user_id = current_user
    @space = Space.find_by_key(params[:space_id])
    @page.space_id = @space.id

    respond_to do |format|
      if @page.save
        flash[:notice] = 'Page was successfully created.'
        format.html { redirect_to(space_page_path(@page.space, @page)) }
        format.xml  { render :xml => @page, :status => :created, :location => @page }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /pages/1
  # PUT /pages/1.xml
  def update
    @space = Space.find_by_key(params[:space_id])
    @page = Page.find_by_title_and_space_id(params[:id], @space)
    @page.user_id = current_user
    
    respond_to do |format|
      if @page.update_attributes(params[:page])
        flash[:notice] = 'Page was successfully updated.'
        format.html { redirect_to(space_page_path(@page.space, @page)) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @page.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /pages/1
  # DELETE /pages/1.xml
  def destroy
    @space = Space.find_by_key(params[:space_id])
    @page = Page.find_by_title_and_space_id(params[:id], @space)
    @page.destroy

    flash[:notice] = "The page has permanently been deleted."
    respond_to do |format|
      format.html { redirect_to(space_url(@space)) }
      format.xml  { head :ok }
    end
  end
  
  def revisions
    @space = Space.find_by_key(params[:space_id])
    @page = Page.find_by_title_and_space_id(params[:id], @space)
    @revisions = Revision.find_all_by_title_and_space_id(params[:id], @space)
    
    respond_to do |format|
      format.html { render :action => "revisions" }
      format.xml { render :xml => @revisions }
    end
  end
  
  def revision
    @space = Space.find_by_key(params[:space_id])
    @page = Page.find_by_title_and_space_id(params[:id], @space)
    @revision = Revision.find_by_id_and_space_id(params[:revision_id], @space)
    
    respond_to do |format|
      format.html { render :action => "revision" }
      format.xml { render :xml => @revision }
    end
  end
end
