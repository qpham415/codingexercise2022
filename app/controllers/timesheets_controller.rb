class TimesheetsController < ApplicationController
  def index
    @timesheets = Timesheet.all
  end

  def show
    @timesheet = Timesheet.find(params[:id])
  end

  def new
    @timesheet = Timesheet.new
  end

  def create
    @timesheet = Timesheet.new(timesheet_params)

    if @timesheet.save
      redirect_to @timesheet
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @timesheet = Timesheet.find(params[:id])
  end

  def update
    @timesheet = Timesheet.find(params[:id])

    if @timesheet.update(timesheet_params)
      update_timesheet
      redirect_to @timesheet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @timesheet = Timesheet.find(params[:id])
    @timesheet.destroy
    redirect_to timesheets_path
  end

  def update_timesheet
    @timesheet.total_cost = @timesheet.rate.to_f * @timesheet.total_time.to_f
    @timesheet.save
  end

  private
    def timesheet_params
      params.require(:timesheet).permit(:description, :total_time, :rate, :total_cost)
    end
end
