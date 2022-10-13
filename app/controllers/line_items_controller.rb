class LineItemsController < ApplicationController
  def create
    @timesheet = Timesheet.find(params[:timesheet_id])
    @line_item = @timesheet.line_items.create(line_item_params)
    update_timesheet
    redirect_to timesheet_path(@timesheet)
  end

  def destroy
    @timesheet = Timesheet.find(params[:timesheet_id])
    @line_item = @timesheet.line_items.find(params[:id])
    @line_item.destroy
    update_timesheet
    redirect_to timesheet_path(@timesheet)
  end

  def edit
    @timesheet = Timesheet.find(params[:timesheet_id])
    @line_item = @timesheet.line_items.find(params[:id])
  end

  def update
    @timesheet = Timesheet.find(params[:timesheet_id])
    @line_item = @timesheet.line_items.find(params[:id])

    if @line_item.update(line_item_params)
      update_timesheet
      redirect_to @timesheet
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def update_timesheet
    @timesheet.total_time = LineItem.where(timesheet_id: @timesheet).sum(:minutes)
    @timesheet.total_cost = @timesheet.rate.to_f * LineItem.where(timesheet_id: @timesheet).sum(:minutes).to_f
    @timesheet.save
  end

  private
    def line_item_params
      params.require(:line_item).permit(:date, :minutes)
    end
end
