class InstructorsController < ApplicationController
    def index
        @instructors = Instructor.all
    end
    
    def create
        instructor = Instructor.create(allowed_params)
        redirect_to instructor_path(instructor)
    end

    def show
        @instructor = Instructor.find(params[:id])
    end

    def edit
        @instructor = Instructor.find(params[:id])
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(allowed_params)
        redirect_to instructor_path(instructor)
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
            :status
        )
    end
end