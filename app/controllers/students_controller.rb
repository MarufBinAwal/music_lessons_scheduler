class StudentsController < ApplicationController

    def index
        @students = Student.all
    end
    
    def create
        student = Student.create(allowed_params)
        redirect_to student_path(student)
    end

    def show
        @student = Student.find(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
    end

    def update
        student = Student.find(params[:id])
        student.update(allowed_params)
        redirect_to student_path(student)
    end

    private
    def allowed_params
        params.required(:student).permit(
            :first_name,
            :last_name,
            :date_of_birth,
            :phone_number,
            :email,
            :misc_notes,
            :billing_notes
        )
    end
end