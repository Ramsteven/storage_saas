class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :set_tenant 

  def set_tenant
    if current_tenant.nil?
      current_account = Account.where( id: params[:account_id].to_i).first
      set_current_tenant(current_account)
      byebug
    end
  end
end
