class OtsController < ApplicationController
	
	def index
		@ot = Ot.new
	end

	def create
		@ot = Ot.new(ot_params)
		ot.user_id = current_user.id
		if @ot.save
			redirect_to 'ots/new', notice: "you have saved your OT! "
		else
			flash[:error] = "Your OT hasn't been saved"
		end
	end

	def ot_params
		params.require(:ot).permit(:starting_time, :ending_time, :sdayofOt, :edayofOt, :ESAP, :STAP )
	end
end
