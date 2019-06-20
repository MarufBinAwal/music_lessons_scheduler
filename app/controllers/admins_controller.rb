class AdminsController < ApplicationController
    before_action :admin_logged_in, except: [:login_form, :authenticate]

    def index
        @admins = Admin.all
    end

    def new

    end

    def create

    end

    def edit
        @admin = Admin.find(params[:id])
    end

    def update

    end

end