class Admin::IssuesController < ApplicationController
  before_filter :authenticate_user!
  # GET /issues
  # GET /issues.json
  respond_to :js, only: [:take_ownership]

  def index
    @issues = Issue.all
    @filter = case params[:filter]
      when 'all'
        'All'
      when 'unassigned'
        'New Unassigned'
      when 'opened'
        'Opened'
      when 'on_hold'
       'On Hold'
     when 'closed'
      'Closed'
    end
    @issues = Issue.send(params[:filter].to_sym) if params[:filter]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @issues }
    end
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @issue = Issue.find_by_hash_name(params[:id])
    @history_items = @issue.history_items.order('created_at ASC').offset(1) # first is initial
    @new_history_item = @issue.history_items.build.new_from(@issue)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @issue }
    end
  end

  def take_ownership
    @issue = Issue.find_by_hash_name(params[:id])
    @issue.assignee = current_user
    @issue.save
  end

  def filter
    @filter = params[:filter]
  end

end
