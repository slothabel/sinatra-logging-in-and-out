require 'pry'
module Helpers

def self.current_user(session)
    @user = User.find_by(id: session[:user_id])
    @user
end

def self.is_logged_in?(session)
    @user = User.find_by(id: session[:user_id])
    if !!session.include?(@user)
        false
    else
        true
    end
end

end