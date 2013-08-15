class Admin::HistoryItemsController < ApplicationController
  before_filter :authenticate_user!, :fetch_issue

  def new
    @history_item = @issue.history_items.build.new_from(@issue)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @history_item }
    end
  end

  def create
    @history_item = @issue.history_items.build(params[:history_item])
    @history_item.assignee = current_user if params[:history_item][:assignee_id].blank?

    respond_to do |format|
      if @history_item.save
        format.html { redirect_to admin_issue_path(@history_item.issue), notice: 'History item was successfully created.' }
        format.json { render json: @history_item, status: :created, location: @history_item }
      else
        format.html { render action: "new" }
        format.json { render json: @history_item.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def fetch_issue
    @issue = Issue.find_by_hash_name(params[:issue_id])
  end

end
