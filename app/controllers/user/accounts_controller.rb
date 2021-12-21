class User::AccountsController < ApplicationController

  def index
    @accounts = Account.all
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)
    @account.save
    redirect_to users_path(current_user)
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    if @account.update(account_params)
      redirect_to users_path(current_user)
    else
      render :edit
    end
  end

  def destroy
    @account.destroy
    redirect_to users_path
  end

  private
  def account_params
    params.require(:account).permit(:account_name)
  end

end
