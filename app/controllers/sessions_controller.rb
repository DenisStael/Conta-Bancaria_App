class SessionsController < ApplicationController
    def new
      redirect_to account_path(current_user) if user_signed_in?
    end
  
    def create
      user = Account.find_by(account_number: params[:session][:account_number])
      if user && user.authenticate(params[:session][:password])
        sign_in(user)
        redirect_to login_path(user)
      else
        flash.now[:danger] = "Número da conta ou senha inválidos"
        render "new"
      end
    end
  
    def destroy
      sign_out
      flash[:success] = "Logout com sucesso"
      redirect_to root_path
    end
  end
  