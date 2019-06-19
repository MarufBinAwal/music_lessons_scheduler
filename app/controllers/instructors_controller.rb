class InstructorsController < ApplicationController
    

    def index
        @instructors = Instructor.all
    end

    def new
        
    end
    
    def create
        instructor = Instructor.create(allowed_params)
        starting_availabilities(instructor)
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

    # def login_form  

    #     if (flash[:alert])
    #         @errors = flash[:alert]
    #     else
    #         @errors = ""
    #     end
    # end

    # def authenticate
    #     instructor = Instructor.find_by(email:(params[:email]))
    #     if instructor != nil && instructor.authenticate(params[:password])
    #         session[:instructor_id] = instructor.id
    #         redirect_to instructor_path(session[:instructor_id])
    #     else
    #         flash[:alert] = "Email or password is invalid"
    #     end
    # end


    # def log_out
    #     session[:instructor_id] = nil
    #     redirect_to '/'
    # end
    
    def starting_availabilities(instructor)
        days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
        start_times = ["1:00 PM", "1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM"]
        end_times = ["1:30 PM", "2:00 PM", "2:30 PM", "3:00 PM", "3:30 PM", "4:00 PM", "4:30 PM", "5:00 PM", "5:30 PM", "6:00 PM", "6:30 PM", "7:00 PM", "7:30 PM", "8:00 PM", "8:30 PM", "9:00 PM"]
        days.each do |day|
            start_times.count.times do |index|
                Availability.create(start_time: start_times[index], end_time: end_times[index], day: day, instructor: instructor)
            end
        end
    end


end