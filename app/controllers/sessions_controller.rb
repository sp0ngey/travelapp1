require 'pp'
=begin

FOM IDENTITY:
-------------
Entering the session control CREATE method from identity
{"provider"=>"identity",
 "uid"=>"6",
 "info"=>{"name"=>"James", "email"=>"j.h@gmail.com"},
 "credentials"=>{},
 "extra"=>{}}

FROM FACEBOOK:
--------------
Entering the session control CREATE method from facebook
{"provider"=>"facebook",
 "uid"=>"512853310",
 "info"=>
  {"nickname"=>"james.hume.581",
   "email"=>"james.hume@gmail.com",
   "name"=>"James Hume",
   "first_name"=>"James",
   "last_name"=>"Hume",
   "image"=>"http://graph.facebook.com/512853310/picture?type=square",
   "urls"=>{"Facebook"=>"https://www.facebook.com/james.hume.581"},
   "verified"=>true},
 "credentials"=>
  {"token"=>
    "CAAHZBzV9LOLEBAHoKbuSZBnguZC85p7doiQI3kXeaDOYcuTMrjnZAhYDDO768cmDPKR7jTZCZAHQGXcjt6eZAklGYgiY2LHxdSm1YxS74CLk7WHlpVFumuZCZCJUF9lpa9YETuG22eeDBX2SofIMVXiMM",
   "expires_at"=>1382691301,
   "expires"=>true},
 "extra"=>
  {"raw_info"=>
    {"id"=>"512853310",
     "name"=>"James Hume",
     "first_name"=>"James",
     "last_name"=>"Hume",
     "link"=>"https://www.facebook.com/james.hume.581",
     "username"=>"james.hume.581",
     "gender"=>"male",
     "email"=>"james.hume@gmail.com",
     "timezone"=>1,
     "locale"=>"en_US",
     "verified"=>true,
     "updated_time"=>"2013-07-05T16:15:58+0000"}}}
=end

class SessionsController < ApplicationController
  def create
    logger.debug  "Entering the session controll CREATE method from " + params['provider']

    auth = request.env["omniauth.auth"]
    dump = PP.pp(auth, "")
    logger.debug dump


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
      format.json { render json:  {:status => "FAIL", :reason => params['message']} }
    end
  end

  def destroy
    session[:user_id] = nil
    logger.debug("Session id is " + ((session[:user_id].nil?) ? "NIL" : session[:user_id]));
    redirect_to root_url, :notice => "Signed out!"
  end
end
