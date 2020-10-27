class AccountsController < ApplicationController
    before_action :set_account, only: [:show, :edit, :update, :destroy]

    def new
        @account = Account.new
    end

    def show
    end

    def create
        @account = Account.new(account_params)
        @account.account_number = new_account_number
        @account.password = new_numeric_password

        if @account.save
            flash[:success] = "Conta criada com sucesso"
            render :show
        else
            render :new
        end
    end

    private 
        def set_account
            @account = Account.find(params[:id])
        end

        def account_params
            params.require(:account).permit(:name, :birth_date)
        end

        def new_account_number
            Faker::Bank.unique.account_number(digits: 5)
        end

        def new_numeric_password
            Faker::Number.unique.number(digits: 6)
        end
end
