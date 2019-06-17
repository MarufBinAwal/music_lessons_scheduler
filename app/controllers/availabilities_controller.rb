class AvailabilitiesController < ApplicationController
    
    def index
        @instructors = Instructor.all
        
    end

    def show
        @instructor = Instructor.find(params[:id])
        @availabilities = Availability.all.select do | each_a |
            each_a.instructor == @instructor
        end
    end

    def new
        @start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        @end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
    end

    def create
        start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        end_time = end_times[start_times.index(allowed_params[:start_time])]
        availability = Availability.create(allowed_params)
        availability.update(end_time: end_time)
        redirect_to availability_path(allowed_params[:instructor_id])
    end

    private
    def allowed_params
        params.require(:availability).permit(
            :instructor_id,
            :start_time,
            :end_time,
            :day
        )
    end

end