class StudentsController < ApplicationController
    before_action :admin_logged_in, except: [:show, :login_form, :authenticate]

    def index
        @students = Student.all
    end
    
    def create
        student = Student.create(allowed_params)
        redirect_to student_path(student)
    end

    def show
        anyone_logged_in
        @student = Student.find(params[:id])
        instructors = @student.lessons.map do |lesson|
            lesson.availability.instructor.id
        end
        if !session[:admin_id] && session[:student_id]!= @student.id
            if session[:instructor_id]
                if !instructors.include?(session[:instructor_id])
                    redirect_to instructor_path(session[:instructor_id])
                end
            else
                redirect_to student_path(session[:student_id])
            end
        end
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        student = Student.find(params[:id])
        student.update(allowed_params)
        redirect_to student_path(student)
    end

    private
    def allowed_params
        params.required(:student).permit(
            :first_name,
            :last_name,
            :date_of_birth,
            :phone_number,
            :email,
            :misc_notes,
            :billing_notes,
            :password
        )
    end


    # def login_form  

    #     if (flash[:alert])
    #         @errors = flash[:alert]
    #     else
    #         @errors = ""
    #     end
    # end

    # def logged_in
    #     if !session.include? :instructor_id || :student_id 
    #         redirect_to '/'
    #     end 
    # end 

    
    # def log_out
    #     session[:instructor_id] = nil && session[:student_id]
    #     redirect_to '/'
    # end



end