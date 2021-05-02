class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :authenticate_user!
  before_action :set_tenant, except: { :sessionsController => [:new,:create] } 


  def set_tenant
    if current_user
      current_account = Account.where(id: current_user.current_tenant_id).first
      set_current_tenant(current_account)
    end
  end
end
