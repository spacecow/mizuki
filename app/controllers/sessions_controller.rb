class SessionsController < ApplicationController
  def new
    @void = true
  end

  def create
    user = User.authenticate(params[:login], params[:password])
    if user
      session[:user_id] = user.id
      @void = true
      redirect_to_target_or_default user, :notice => t('success.logged_in')
    else
      flash.now[:alert] = t('alert.invalid_login_or_password')
      @void = true
      render :action => 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => t('success.logged_out')
  end
end
