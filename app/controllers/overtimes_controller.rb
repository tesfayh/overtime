class OvertimesController < ApplicationController
	 before_filter :auth, only: [:create, :destroy, :edit, :update, :show, :report, :index]
	def new
		@overtime = Overtime.new
		@user = User.all
	end

	def index
		@reports = Overtime.where(:user_id => current_user.id)
	     render :layout => false
		
    end
    def pdf
    	@reports = Overtime.where(:user_id => current_user.id)
    	

    end
	def edit
		@overtime = Overtime.find(params[:id])
	end

	def show
		@overtime  = Overtime.find(params[:id])
	end

    def showot
    	@overtimes = Overtime.where(:user_id => current_user.id)
    	render 'showot'
    end
	def update
		@overtime = Overtime.new(ot_params)
		@overtime.user_id = current_user.id
		if @overtime.update_attributes(ot_params)
			flash[:success] = "Your overtime has been updated"
			redirect_to '/update'
		else
			render 'edit'
		end

	end

	def destroy
		@ot = Overtime.find(params[:id])
		@ot.destroy
		redirect_to '/update', notice: "OT deleted successfuly!"
	end
	def report
		@reports = Overtime.where(:user_id => current_user.id)
		
	end
	def create
		@overtime = Overtime.new(ot_params)
		@overtime.user_id = current_user.id
		if @overtime.save
		    

			@user = User.where(:name => params[:name])
			#@overtime.user_id = user.id
		#if	@overtime.save	
			redirect_to '/update', notice: "you have saved your OT! "
		#else
		#	render 'new', notice: "error saving OT"
		#end
		else
		  render 'new', notice: "error saving OT"
		end
	
	end

	def ot_params
		params.require(:overtime).permit(:user_id, :stimehours, :stimeminutes, :etimehours, :etimeminutes, :sdayofot, :edayofot, :ETAP, :STAP, :name )
	end
end





