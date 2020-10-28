class AccountOperationsController < ApplicationController
  before_action :require_logged_in_user
  before_action :set_account_operation, only: [:show]

  def index
    @account_operations = current_user.account_operations
  end

  def show
  end

  def new
    @account_operation = AccountOperation.new
  end

  def create
    @account_operation = current_user.account_operations.build(account_operation_params)

    respond_to do |format|
      if @account_operation.save && update_account_values
        format.html { redirect_to @account_operation }
        format.json { render :show, status: :created, location: @account_operation }
      else
        format.html { render :new }
        format.json { render json: @account_operation.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_account_operation
      @account_operation = current_user.account_operations.find(params[:id])
    end

    def account_operation_params
      params.require(:account_operation).permit(:value, :operation)
    end

    def update_account_values
      current_balance = current_user.current_balance
      value = params[:account_operation][:value].to_f
      operation = params[:account_operation][:operation]
      if operation == "Crédito"
        new_balance = current_balance + value
      else operation == "Débito"
        new_balance = current_balance - value
      end

      if current_user.update_attributes(:current_balance => new_balance, :previous_balance => current_balance)
        flash[:success] = "Operação realizada"
      else
        flash[:danger] = "Erro ao realizar a operação"
        redirect_to new_account_path
      end
    end
end
