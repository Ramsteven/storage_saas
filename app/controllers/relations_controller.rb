class RelationsController < ApplicationController
  def invite_user
    account = Account.find(params[:account_id])
    user = User.find_by_email(params[:email])
    unless user.nil?   
      member = user.accounts
      begin 
        member << account
        render json: "welcome"
      rescue
        render json: "This contact already follow this account"
      end
    else
      render json: "any user have this email"
    end
  end
end
