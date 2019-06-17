class InstructorsController < ApplicationController
    def index
        @instructors = Instructor.all
    end

    def new
        @start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        @end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
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
        @start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        @end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
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
            :active
        )
    end
end