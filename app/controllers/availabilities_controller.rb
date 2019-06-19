class AvailabilitiesController < ApplicationController
    
    def index
        @instructor = Instructor.find(params[:instructor_id])

        @availabilities = sorted_availabilities(@instructor.availabilities)
    end

    def show
        @availability = Availability.find(params[:id])
    end

    def new
        @start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        @end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    end

    def create
        start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        end_time = end_times[start_times.index(allowed_params[:start_time])]
        availability = Availability.create(allowed_params)
        availability.update(end_time: end_time)
        redirect_to availability_path(availability)
    end

    def edit
        @availability = Availability.find(params[:id])
        @start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        @end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        @days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    end

    def update
        availability = Availability.find(params[:id])
        start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        end_time = end_times[start_times.index(allowed_params[:start_time])]
        availability.update(allowed_params)
        availability.update(end_time: end_time)
        redirect_to availability_path(availability)
    end

    def destroy
        availability = Availability.find(params[:id])
        instructor = availability.instructor
        availability.destroy
        redirect_to instructor_availabilities_path(instructor)
    end

    private
    def allowed_params
        params.require(:availability).permit(
            :instructor_id,
            :start_time,
            :day
        )
    end

    def sorted_availabilities(unsorted_availabilities)

        time_sort_availabilities = unsorted_availabilities.sort_by do |availability|
            availability.start_time
        end

        days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        availabilities = []

        days.each do |each_day|
            that_day_availabilities = time_sort_availabilities.select do |availability|
                availability.day == each_day
            end
            availabilities << that_day_availabilities
        end

        availabilities.flatten
    end

end