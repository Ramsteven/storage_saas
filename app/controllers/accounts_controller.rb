class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = current_user.accounts
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    current_user.update(current_tenant_id: params[:id])
    @boxes = Box.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_account
      begin
        @account = Account.find(params[:id])
      rescue
        @account = 0
      end
    end

    # Only allow a list of trusted parameters through.
    def account_params
      params.require(:account).permit(:plan, :name)
    end
end
