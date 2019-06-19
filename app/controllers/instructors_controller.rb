class InstructorsController < ApplicationController
    
    def full_index
        flash[:full_index] = true
        redirect_to instructors_path
    end
    
    def index
        @instructors = Instructor.all
    end

    def new
        @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    end
    
    def create
        instructor = Instructor.create(allowed_params)
        instructor.update(active: true)
        desired_days = []
        days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        days.each do |each_day|
            if params[each_day] == each_day
                desired_days << each_day
            end
        end
        starting_availabilities(instructor,desired_days)
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
    end

    def update
        instructor = Instructor.find(params[:id])
        instructor.update(allowed_params)
        if instructor.active == false
            instructor.deactivate_availabilities
            redirect_to instructors_path
        else
            redirect_to instructor_path(instructor)
        end
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

    def starting_availabilities(instructor,desired_days)
        start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        desired_days.each do |day|
            start_times.count.times do |index|
                Availability.create(start_time: start_times[index], end_time: end_times[index], day: day, instructor: instructor, active: true)
            end
        end
    end
end