class ApplicationController < ActionController::Base
    before_action :anyone_logged_in, except: [:login_form, :authenticate]

   def login_form
        if (flash[:alert])
            @errors = flash[:alert]
        else
            @errors = ""
        end
        render layout: false
        reset_session
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
                redirect_to '/'
            end
        elsif value == "student"
            student = Student.find_by(email:(params[:email]))
            if student != nil && student.authenticate(params[:password])
                session[:student_id] = student.id
                redirect_to student_path(session[:student_id])
            else
                flash[:alert] = "Email or password is invalid"
                redirect_to '/'
            end
        elsif value == "admin"
            admin = Admin.find_by(email:(params[:email]))
            if admin != nil && admin.authenticate(params[:password])
                session[:admin_id] = admin.id
                redirect_to lessons_path
            else
                flash[:alert] = "Email or password is invalid"
                redirect_to '/'
            end
        end
    end



    
    def log_out
        reset_session
        redirect_to '/'
    end

    def anyone_logged_in
        unless session.include?(:student_id) || session.include?(:instructor_id) || session.include?(:admin_id)
            redirect_to '/'
        end 
    end

    def staff_logged_in
        unless session.include?(:instructor_id) || session.include?(:admin_id)
            redirect_to student_path(session[:student_id])
        end 
    end

    def admin_logged_in
        unless session.include?(:admin_id)
            if session[:student_id]
                redirect_to student_path(session[:student_id])
            else
                redirect_to instructor_path(session[:instructor_id])
            end
        end
    end

end
