class RelationsController < ApplicationController
  def invite_user
    account = Account.find(params[:account_id])
    user = User.find_by_email(params[:email])
    byebug
    unless user.nil? && current_user.id != account.user_id  
      member = user.accounts
      begin 
        member << account
        redirect_to account ,notice: "This user been successfully invited"
      rescue
        redirect_to account ,notice: "This contact already follow this account"       end
    else
        redirect_to account ,notice: "no user has this email or your not are owner of this account"
    end
  end
end
