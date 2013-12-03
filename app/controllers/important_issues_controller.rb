class ImportantIssuesController < ApplicationController
  # GET /important_issues
  # GET /important_issues.json
  def index
    @important_issues = ImportantIssue.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @important_issues }
    end
  end

  # GET /important_issues/1
  # GET /important_issues/1.json
  def show
    @important_issue = ImportantIssue.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @important_issue }
    end
  end

  # GET /important_issues/new
  # GET /important_issues/new.json
  def new
    @important_issue = ImportantIssue.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @important_issue }
    end
  end

  # GET /important_issues/1/edit
  def edit
    @important_issue = ImportantIssue.find(params[:id])
  end

  # POST /important_issues
  # POST /important_issues.json
  def create
    @important_issue = ImportantIssue.new(params[:important_issue])

    respond_to do |format|
      if @important_issue.save
        format.html { redirect_to @important_issue, notice: 'Important issue was successfully created.' }
        format.json { render json: @important_issue, status: :created, location: @important_issue }
      else
        format.html { render action: "new" }
        format.json { render json: @important_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /important_issues/1
  # PUT /important_issues/1.json
  def update
    @important_issue = ImportantIssue.find(params[:id])

    respond_to do |format|
      if @important_issue.update_attributes(params[:important_issue])
        format.html { redirect_to @important_issue, notice: 'Important issue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @important_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def move_up
    @important_issue = ImportantIssue.find(params[:id])

    # if the issue is already in first place, there is really no sense in doing anything
    replace_issue = @important_issue.next_issue
    if(replace_issue.nil?)
      respond_to do |format|
        format.html { redirect_to @important_issue, notice: 'Important issue was was left alone since it is higher than any other important issue.' }
        # use 304 (until a better option is found) to indicate there is no change
        format.json { render json: @important_issue.errors, status: 304 }
      end

      # we don't want any multi-render exceptions
      return
    end

    respond_to do |format|
      if @important_issue.swap_with!(replace_issue)
        format.html { redirect_to @important_issue, notice: 'Important issue was successfully moved up.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @important_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  def move_down
    @important_issue = ImportantIssue.find(params[:id])

    # if the issue is already in last place, there is really no sense in doing anything
    replace_issue = @important_issue.prev_issue
    if(replace_issue.nil?)
      respond_to do |format|
        format.html { redirect_to @important_issue, notice: 'Important issue was was left alone since it is lower than any other important issue.' }
        # use 304 (until a better option is found) to indicate there is no change
        format.json { render json: @important_issue.errors, status: 304 }
      end

      # we don't want any multi-render exceptions
      return
    end

    respond_to do |format|
      if @important_issue.swap_with!(replace_issue)
        format.html { redirect_to @important_issue, notice: 'Important issue was successfully moved down.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @important_issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /important_issues/1
  # DELETE /important_issues/1.json
  def destroy
    @important_issue = ImportantIssue.find(params[:id])
    @important_issue.destroy

    respond_to do |format|
      format.html { redirect_to important_issues_url }
      format.json { head :no_content }
    end
  end
end
