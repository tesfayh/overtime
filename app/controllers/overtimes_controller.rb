class OvertimesController < ApplicationController
	
	 before_filter :auth, only: [:create, :destroy, :edit, :update, :show, :report, :index, :showot, :new, :otreport]
	
	def new
		@overtime = Overtime.new
		@user = User.all
	end

	def index
		@reports = Overtime.where(:user_id => current_user.id)
		
		 begin
       		if params[:month]
		 		@month = params[:month]
			end
		rescue =>e
			@month = Time.now.month
	        @error= e.message
		end
		respond_to do |format|
	      format.html
	      format.pdf do
        	render pdf: "#{current_user.name} OT Report", 
        	      :layout => false, 
        	       template: 'overtimes/index.pdf.erb',
        	       layout: 'pdf.html.erb',
        	       title:  'Lion Bank OT System',
        	       disposition: 'inline'
      end
    end
    end

    def pdf
    	@reports = Overtime.where(:user_id => current_user.id)
	end

	def otreport
		 @reports = Overtime.all
		 begin
       		if params['report']['month']
		 		@month   = params['report']['month']
			end
		rescue =>e
			@month = Time.now.month
	        @error= e.message
		end
		 
		 render 'overtime_report',:layout => false

	end

	def edit
		@overtime = Overtime.find(params[:id])
	end

	def show
		@overtime  = Overtime.find(params[:id])
	end

    def showot
    	@overtimes = Overtime.where(:user_id => current_user.id).order(:sdayofot).reverse_order
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
		begin
       		if params['report']['month']
		 		@month   = params['report']['month']
			end
		rescue =>e
			@month = Time.now.month
	        @error= e.message
		end
	end

	def create
		@overtime = Overtime.new(ot_params)
		@overtime.user_id = current_user.id
		if @overtime.save
		    
			@overtime = Overtime.new(ot_params)
			if	  params[:userid][:name] != ''
				@overtime.user_id =  params[:userid][:name]
				if	@overtime.save	
					redirect_to '/update', notice: "you have saved your OT! "
				else
					redirect_to '/newot', notice: "OT for your partner is not added"
				end
			else
				redirect_to '/update', notice: "you have saved your OT! "
		    end
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





