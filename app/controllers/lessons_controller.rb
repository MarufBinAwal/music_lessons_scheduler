class LessonsController < ApplicationController

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

    def show
        @lesson = Lesson.find(params[:id])
    end 

    def edit
        @lesson = Lesson.find(params[:id])
        @availabilities = Availability.all.select do |each_availability|
            each_availability.active
        end
        @students = Student.all
    end

    def update
        lesson = Lesson.find(params[:id])
        lesson.update(allowed_params)
        if !lesson.active
            #update lesson.active with user who archived the lesson
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