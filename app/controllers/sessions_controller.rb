class SessionsController < ApplicationController
  skip_before_filter :authorize

  def new
  end

  def create
    if params[:name]=='' || params[:password]==''
      redirect_to login_url, notice: 'Fill the fields'
      return
    elsif User.count.zero?
      first_admin=User.new(name: params[:name], password: params[:password])
      first_admin.save
    end
    user=User.find_by_name(params[:name])
    if user and user.authenticate(params[:password])
      session[:user_id]=user.id
      redirect_to admin_url
    else
      redirect_to login_url, notice: 'Invalid user/password combination'
    end

  end

  def destroy
    session[:user_id] = nil
    redirect_to magazine_url, notice: 'Logged out'
  end
end
