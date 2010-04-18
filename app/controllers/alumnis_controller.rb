class AlumnisController < ApplicationController
  skip_before_filter :login_required, :except => [:create]
  layout "main"
  # GET /alumnis
  # GET /alumnis.xml
  def index
    @alumnis = Alumni.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @alumnis }
    end
  end

  # GET /alumnis/1
  # GET /alumnis/1.xml
  def show
    @alumni = Alumni.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  user
    end
  end

  # GET /alumnis/new
  # GET /alumnis/new.xml
  def new
    @alumni = Alumni.new
    @courses = Course.find(:all,:order => "name")
    @universities = University.find(:all,:order => "name")

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @alumni }
    end
  end

  # GET /alumnis/1/edit
  def edit
    @alumni = Alumni.find(params[:id])
  end

  # POST /alumnis
  # POST /alumnis.xml
  def create
    params[:alumni][:user_id] = session[:register_user_id] if !logged_in?
    @alumni = Alumni.new(params[:alumni])
    @courses = Course.find(:all,:order => "name")
    @universities = University.find(:all,:order => "name")
    
    respond_to do |format|
      if @alumni.save
        flash[:notice] = "Thanks for signing up!  We're sending you an email with your activation code."
        session[:register_user_id] = nil if !logged_in?
        format.html { redirect_to :controller => "dashboards" }
        format.xml  { render :xml => @alumni, :status => :created, :location => @alumni }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @alumni.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /alumnis/1
  # PUT /alumnis/1.xml
  def update
    @alumni = Alumni.find(params[:id])

    respond_to do |format|
      if @alumni.update_attributes(params[:alumni])
        flash[:notice] = 'Alumni was successfully updated.'
        format.html { redirect_to(@alumni) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @alumni.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /alumnis/1
  # DELETE /alumnis/1.xml
  def destroy
    @alumni = Alumni.find(params[:id])
    @alumni.destroy

    respond_to do |format|
      format.html { redirect_to(alumnis_url) }
      format.xml  { head :ok }
    end
  end
  
  def search
    @alumnis = Alumni.search(params)
    respond_to do |format|
      format.js {
        render :update do |page|
          page.replace_html "result",:partial => "tables",:locals => {:alumnis => @alumnis}
        end
      }   
    end    
  end  
end
