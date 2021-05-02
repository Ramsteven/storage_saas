class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action { ActsAsTenant.current_tenant ? : :set_tenant }


  def set_tenant
    current_account = Account.find_it
    set_current_tenant(current_account)
  end
end
