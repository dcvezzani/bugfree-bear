class NormalIssuesController < ApplicationController
  # GET /normal_issues
  # GET /normal_issues.json
  def index
    @normal_issues = NormalIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @normal_issues }
    end
  end

  # GET /normal_issues/1
  # GET /normal_issues/1.json
  def show
    @normal_issue = NormalIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @normal_issue }
    end
  end

  # GET /normal_issues/new
  # GET /normal_issues/new.json
  def new
    @normal_issue = NormalIssue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @normal_issue }
    end
  end

  # GET /normal_issues/1/edit
  def edit
    @normal_issue = NormalIssue.find(params[:id])
  end

  # POST /normal_issues
  # POST /normal_issues.json
  def create
    @normal_issue = NormalIssue.new(params[:normal_issue])

    respond_to do |format|
      if @normal_issue.save
        format.html { redirect_to @normal_issue, notice: 'Normal issue was successfully created.' }
        format.json { render json: @normal_issue, status: :created, location: @normal_issue }
      else
        format.html { render action: "new" }
        format.json { render json: @normal_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /normal_issues/1
  # PUT /normal_issues/1.json
  def update
    @normal_issue = NormalIssue.find(params[:id])

    respond_to do |format|
      if @normal_issue.update_attributes(params[:normal_issue])
        format.html { redirect_to @normal_issue, notice: 'Normal issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @normal_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /normal_issues/1
  # DELETE /normal_issues/1.json
  def destroy
    @normal_issue = NormalIssue.find(params[:id])
    @normal_issue.destroy

    respond_to do |format|
      format.html { redirect_to normal_issues_url }
      format.json { head :no_content }
    end
  end
end
