class OvertimesController < ApplicationController
	 before_filter :auth, only: [:create, :destroy, :edit, :update, :show, :report]
	def new
		@overtime = Overtime.new
	end

	def index
		 
    end

	def edit
		@overtime = Overtime.find(params[:id])
	end

	def show
		@overtimes = Overtime.where(:user_id => current_user.id)
	end

	def update
		@overtime = Overtime.new(ot_params)
		@overtime.user_id = current_user.id
		if @overtime.update_attributes(ot_params)
			flash[:success] = "Your overtime has been updated"
			redirect_to root_url
		else
			render 'edit'
		end

	end

	def destroy
		@ot = Overtime.find(params[:id])
		@ot.destroy
		flash[:success] = "OT deleted successfuly!"
		redirect_to root_url
	end
	def report
		@reports = Overtime.where(:user_id => current_user.id)
	end
	def create
		@overtime = Overtime.new(ot_params)
		@overtime.user_id = current_user.id
		if @overtime.save
			redirect_to root_url, notice: "you have saved your OT! "
		else
			flash[:error]  = "Your OT hasn't been saved"
			flash[:notice] = "Your OT for this day have already been registered!"
			redirect_to '/newot'
		end
	end

	def ot_params
		params.require(:overtime).permit(:user_id, :stimehours, :stimeminutes, :etimehours, :etimeminutes, :sdayofot, :edayofot, :ETAP, :STAP )
	end
end





