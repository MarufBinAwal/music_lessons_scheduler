class ApplicationController < ActionController::Base
#    before_action :logged_in
#    before_action :require_login
#    skip_before_action :require_login, only: [:login_form, :authenticate]
#    skip_before_action :logged_in, only: [:login_form, :authenticate]


   def login_form  
        if (flash[:alert])
            @errors = flash[:alert]
        else
            @errors = ""
        end
    end 



def authenticate
    value = params[:user]
    if value == "instructor"
        instructor = Instructor.find_by(email:(params[:email]))
        if instructor != nil && instructor.authenticate(params[:password])
            session[:instructor_id] = instructor.id
            redirect_to instructor_path(session[:instructor_id])
        else
            flash[:alert] = "Email or password is invalid"
        end
    elsif value == "student"
        student = Student.find_by(email:(params[:email]))
        if student != nil && student.authenticate(params[:password])
            session[:student_id] = student.id
            redirect_to student_path(session[:student_id])
        else
            flash[:alert] = "Email or password is invalid"
        end
    end
end


    def logged_in
        if !session.include?(:instructor_id) || !session.include?(:student_id) 
            redirect_to '/'
        end 
    end 

    
    def log_out
        session[:instructor_id] = nil
        redirect_to '/'
    end



    # private

    # def require_login
    #     return head(:forbidden) unless session.include?(:instructor_id) || session.include?(:student_id)
    # end 


end
