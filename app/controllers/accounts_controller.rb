class AccountsController < ApplicationController
    before_action :require_logged_in_user, only: [:show]
    before_action :set_account, only: [:show]

    def new
        @account = Account.new
    end

    def show
    end

	def create
		@account = Account.new(account_params)
        if user_signed_in?
            flash[:danger] = "Desconecte-se da sessão atual para criar uma nova conta"
            render :new
        else
            @account.account_number = new_account_number
            @password = new_numeric_password.to_s
            @account.password = @password

            if @account.save
            	flash[:success] = "Conta criada com sucesso"
        		sign_in(@account)
                render :show
        	else
            	render :new
        	end
        end
    end

    private 
        def set_account
            @account = current_user
        end

        def account_params
            params.require(:account).permit(:name, :birth_date, :document_photo)
        end

        def new_account_number
            Faker::Bank.unique.account_number(digits: 5)
        end
        
        def new_numeric_password
            Faker::Number.unique.number(digits: 6)
        end
end
