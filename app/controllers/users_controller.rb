class UsersController < ApplicationController

  skip_before_filter :verify_authenticity_token
  before_filter :authirize, :only => :login

  def register
    name = params[:name]
    email = params[:email]
    password = params[:password]
    u = User.new(name: name, email: email, password: password)
    if u.save 
      @bulean = true
      session[:id] = u.id
      redirect_to questions_path
    end
  end

  def login
    @error_message = ""
    email = params[:email]
    password = params[:password]
  #buscar sio existe el usuario
    user = User.authenticate(email, password)
    if user 
      session[:id] = user.id
      redirect_to root_path
    else
  #obtener id y email para crear sesión
    @error_message = "Usuario Inválido"
      redirect_to root_path
    end
  end

  def logout
    session.clear
    @bulean2 = true
    redirect_to root_path
  end

  def before
    unless session[:id]
      redirect_to root_path
    end
  end


end
