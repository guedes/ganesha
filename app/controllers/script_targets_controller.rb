class ScriptTargetsController < ApplicationController
  respond_to :html, :js, :json, :xml

  def index
    @script_target = ScriptTarget.new
    respond_with @script_targets = ScriptTarget.all
  end

  def show
    respond_with(@script_target = ScriptTarget.find(params[:id]))
  end

  def new
    respond_with(@script_target = ScriptTarget.new)
  end

  def edit
    respond_with(@script_target = ScriptTarget.find(params[:id]))
  end

  def create
    @script_target = ScriptTarget.new(params[:script_target])
    flash[:notice] = 'Script successfully associated.' if @script_target.save
    respond_with @script_target
  end

  def update
    @script_target = ScriptTarget.find(params[:id])
    if @script_target.update_attributes(params[:script_target])
      flash[:notice] = 'Configuration was successfully updated.'
    end

    respond_with @script_target
  end

  def destroy
    @script_target = ScriptTarget.find(params[:id])
    @script_target.destroy

    flash[:notice] = 'Configuration was successfully destroyed.'

    respond_with @script_target
  end
end
