class AccountsController < ApplicationController
  before_action :set_account, only: %i[ show edit update destroy ]

  # GET /accounts or /accounts.json
  def index
    @accounts = current_user.accounts
  end

  # GET /accounts/1 or /accounts/1.json
  def show
    current_user.update( current_tenant_id: params[:id] )
  end

  # GET /accounts/new
  def new
    @account = Account.new
  end

  # GET /accounts/1/edit
  def edit
  end

  # POST /accounts or /accounts.json
  def create
    @account = Account.new(account_params)
    @account.user_id = current_user.id
    respond_to do |format|
      if @account.save
        format.html { redirect_to @account, notice: "Account was successfully created." }
        format.json { render :show, status: :created, location: @account }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accounts/1 or /accounts/1.json
  def update
    respond_to do |format|
      if @account.update(account_params)
        format.html { redirect_to @account, notice: "Account was successfully updated." }
        format.json { render :show, status: :ok, location: @account }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accounts/1 or /accounts/1.json
  def destroy
    
    unless @account == 0
      if current_user.id != @account.user_id 
          render json: "vos no podes borrar esto mi socio"
      else
        @account.destroy
        respond_to do |format|
          format.html { redirect_to accounts_url, notice: "Account was successfully destroyed." }
          format.json { head :no_content }
        end
      end
    else
      render json: "al parecer ya fue borrado"
    end
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
      params.require(:account).permit( :name)
    end
end
