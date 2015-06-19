class OvertimesController < ApplicationController
	 before_filter :auth, only: [:create, :destroy, :edit, :update, :show, :report, :index, :showot, :new, :ot_report]
	def new
		@overtime = Overtime.new
		@user = User.all
	end

	def index
		@reports = Overtime.where(:user_id => current_user.id)

		respond_to do |format|
	      format.html
	      format.pdf do
        	render pdf: "#{current_user.name} OT Report", 
        	      :layout => false, 
        	       template: 'overtimes/index.pdf.erb',
        	       layout: 'pdf.html.erb',
        	       disposition: 'inline'
      end
    end
    end
    def pdf
    	@reports = Overtime.where(:user_id => current_user.id)
	end
	def ot_report
		 @reports = Overtime.all
		 render 'overtime_report',:layout => false

	end
	def edit
		@overtime = current_user.overtimes.find(params[:id])
	end

	def show
		@overtime  = Overtime.find(params[:id])
	end

    def showot
    	@overtimes = Overtime.where(:user_id => current_user.id)
    	render 'showot'
    end
	def update
		@overtime = current_user.overtimes.find(params[:id])
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
		    
			#@overtime = Overtime.new(ot_params)
			#user = User.select(:id).where(name: params[:userid][:name])
			#@overtime.user_id = user.first.id
		#if	@overtime.save	
			redirect_to '/update', notice: "you have saved your OT! "
	#	else
	#		render 'new', notice: "error saving OT"
	#	end
		else
		  redirect_to '/newot'
		  flash[:error] = "error: Users should only enter one OT per day." 
		end
	
	end

	def ot_params
		params.require(:overtime).permit(:user_id, :stimehours, :stimeminutes, :etimehours, :etimeminutes, 
										:beforeEOD, :EOD, :afterEOD, :sdayofot, :edayofot, :ETAP, :STAP, :name ,:userid)
	end
end





