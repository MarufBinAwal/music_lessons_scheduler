class InstructorsController < ApplicationController
    

    
    def index
        @instructors = Instructor.all
    end

    def new
        
    end
    
    def create
        instructor = Instructor.create(allowed_params)
        redirect_to instructor_path(instructor)
    end

    def show
        @instructor = Instructor.find(params[:id])
        if (@instructor.active == true)
            @status = "Active"
        else
            @status = "Inactive"
        end
    end

    def edit
        @instructor = Instructor.find(params[:id])
        @availabilities = Availability.all.select do | each_a |
            each_a.instructor == @instructor
        end
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(allowed_params)
        redirect_to instructor_path(instructor)
    end

    def destroy
        instructor = Instructor.find(params[:id])
        instructor.destroy
        redirect_to instructors_path
    end

    def allowed_params
        params.required(:instructor).permit(
            :first_name,
            :last_name,
            :date_of_birth,
            :phone_number,
            :password,
            :email,
            :instruments,
            :pay_rate,
            :misc_notes,
            :active
        )
    end

    def login_form
        
    end

    def authenticate
        instructor = Instructor.find_by(email:(params[:email]))
        if instructor != nil && instructor.authenticate(params[:password])
            session[:instructor_id] = instructor.id
            redirect_to instructor_path(session[:instructor_id])
        else
            #error
        end
    end

    def log_out
        session[:instructor_id] = nil
        redirect_to '/'
    end
end