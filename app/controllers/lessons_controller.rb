class LessonsController < ApplicationController
    before_action :admin_logged_in, except: [:edit, :update, :login_form, :authenticate]
    before_action :staff_logged_in, only: [:edit, :update]

    def full_index
        flash[:full_index] = true
        redirect_to lessons_path
    end

    def index
        @lessons = Lesson.all
        @instructors = Instructor.all
    end
    
    def new
        @availabilities = Availability.all
        @students = Student.all
    end

    def create
        lesson = Lesson.new(allowed_params)
        lesson.update(active: true) #add admin name to user from session id when creating a lesson
        redirect_to student_path(lesson.student)
    end

    def edit
        @lesson = Lesson.find(params[:id])
        if !session[:admin_id] && session[:instructor_id]!= @lesson.availability.instructor.id
            redirect_to instructor_path(session[:instructor_id])
        end
        @availabilities = Availability.all.select do |each_availability|
            each_availability.active
        end
        @students = Student.all
    end

    def update
        lesson = Lesson.find(params[:id])
        if !session[:admin_id] && session[:instructor_id]!= lesson.availability.instructor.id
            redirect_to instructor_path(session[:instructor_id])
        end
        lesson.update(allowed_params)
        if !lesson.active
            #make so only instructor can archive a lesson
            admin = Admin.find(session[:admin_id])
            lesson.update(user: admin.name)
        end
        redirect_to student_path(lesson.student)
    end


    private
    
    def allowed_params 
        params.require(:lesson).permit(
            :availability_id,
            :student_id,
            :instrument,
            :misc_notes,
            :price_of_lesson,
            :active
        )
    end 

end