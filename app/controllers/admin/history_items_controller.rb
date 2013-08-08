class HistoryItemsController < ApplicationController

  def new
    @history_item = HistoryItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @history_item }
    end
  end


  def create
    @history_item = HistoryItem.new(params[:history_item])

    respond_to do |format|
      if @history_item.save
        format.html { redirect_to @history_item, notice: 'History item was successfully created.' }
        format.json { render json: @history_item, status: :created, location: @history_item }
      else
        format.html { render action: "new" }
        format.json { render json: @history_item.errors, status: :unprocessable_entity }
      end
    end
  end

end
