class SessionsController < ApplicationController
  def create
    grades = Hash.new
    grades["Bob"] = 82
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json:  {:status => "OK"} }
    end
  end

  def failure()
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { render json:  {:status => "FAIL"} }
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end
end
