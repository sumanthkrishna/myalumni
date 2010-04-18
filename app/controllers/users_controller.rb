class UsersController < ApplicationController
  # render new.rhtml
  def new
    @user = User.new
    respond_to do |format|
      format.js {
        render :update do |page|
          page.hide "dashboard"
          page.replace_html "form",:partial => "new"
        end          
      }
      format.html # new.html.erb
      format.xml  { render :xml => @user }
    end
  end
 
  def create
    logout_keeping_session!
    @user = User.new(params[:user])
    respond_to do |format|
      if @user.save && @user.errors.empty?
        session[:register_user_id] = @user.id
        format.html { redirect_to new2_users_path }
        format.xml  { render :xml => @user, :status => :created, :location => @user }
      else
        flash[:error]  = "We couldn't set up that account, sorry.  Please try again."
        format.html { render :action => "new" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def new2
    @alumni = Alumni.new
    @courses = Course.find(:all,:order => "name")
    @universities = University.find(:all,:order => "name")
  end 

  def activate
    logout_keeping_session!
    user = User.find_by_activation_code(params[:activation_code]) unless params[:activation_code].blank?
    case
    when (!params[:activation_code].blank?) && user && !user.active?
      user.activate!
      flash[:notice] = "Signup complete! Please sign in to continue."
      redirect_to '/'
    when params[:activation_code].blank?
      flash[:error] = "The activation code was missing.  Please follow the URL from your email."
      redirect_back_or_default('/')
    else 
      flash[:error]  = "We couldn't find a user with that activation code -- check your email? Or maybe you've already activated -- try signing in."
      redirect_back_or_default('/')
    end
  end
end
