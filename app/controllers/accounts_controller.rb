class AccountsController < ApplicationController
    def new
        @account = Account.new
    end

    def create
        @account = Account.new(account_params)

        # Putting any account value for the moment just for tests
        @account.account_number = 1

        # To do: method create_password and returns the password
        
        if @account.save
            flash[:success] = "Conta criada com sucesso"
            redirect_to root_path
        else
            render "new"
        end
    end

    private def account_params
        params.require(:account).permit(:name, :birth_date)
    end
end
