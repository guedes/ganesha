class ChartsController < ApplicationController
  def show
    @script_target = ScriptTarget.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :json => @script_target.chartified_data(params[:date_start], params[:date_end]) }
    end
  end
end
