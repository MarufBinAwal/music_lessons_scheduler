class ApplicationController < ActionController::Base
    before_action :logged_in
   before_action :require_login


    def logged_in
        if !session.include? :instructor_id
            redirect_to '/'
        end 
    end 




    private

    def require_login
        return head(:forbidden) unless session.include? :instructor_id
    end 


end
