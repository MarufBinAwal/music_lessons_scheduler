class AdminsController < ApplicationController
    before_action :admin_logged_in, except: [:login_form, :authenticate]

    def index
        @admins = Admin.all
    end

    def new

    end

    def create
        Admin.create(allowed_params)
        redirect_to admins_path
    end

    def edit
        @admin = Admin.find(params[:id])
    end

    def update
        Admin.update(allowed_params)
        redirect_to admins_path
    end

    def destroy
        admin = Admin.find(params[:id])
        admin.destroy
        redirect_to admins_path
    end

    private

    def allowed_params
        params.require(:admin).permit(
            :name,
            :email,
            :password
        )
    end

end