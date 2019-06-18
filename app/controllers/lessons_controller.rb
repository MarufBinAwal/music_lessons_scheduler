class LessonsController < ApplicationController

    def index
        @lessons = Lesson.all 
    end     

    def show
        @lesson = Lesson.find(params[:id])
    end 


    private def lesson_params 
        params.require(:lesson).permit(
            :availability_id,
            :student_id,
            :instrument,
            :misc_notes,
            :price_of_lesson,
            :user,
            :active
        )
    end 

end