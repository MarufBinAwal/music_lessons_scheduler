class InstructorsController < ApplicationController
    def index
        @instructors = Instructor.all
    end

    def new
        
    end
    
    def create
        byebug
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

    private
    def allowed_params
        params.required(:instructor).permit(
            :first_name,
            :last_name,
            :date_of_birth,
            :phone_number,
            :email,
            :instruments,
            :pay_rate,
            :misc_notes,
            :active
        )
    end
end