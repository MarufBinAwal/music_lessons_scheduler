class AdminsController < ApplicationController
    before_action :admin_logged_in, except: [:login_form, :authenticate]

    def index
        @admins = Admin.all
        if flash[:error]
            @error = flash[:error]
        else
            @error = ""
        end
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
        if Admin.all.count <=1
            flash[:error] = "Must have at least 1 admin"
            redirect_to admins_path
        else
            admin = Admin.find(params[:id])
            if admin.id == sessions[:admin_id]
                admin.destroy
                log_out
                redirect_to '/'
            else
                admin.destroy
                redirect_to admins_path
            end
        end
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