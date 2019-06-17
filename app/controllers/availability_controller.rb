class AvailabilityController < ApplicationController
    
    def index
        @instructor = Instructor.find(params[:instructor_id])
        @availabilities = Availability.all.select do | each_a |
            each_a.instructor == @instructor
        end
    end

end