class ChartsController < ApplicationController
  def show
    @script_target = ScriptTarget.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render :text => @script_target.chartified_data.to_json }
    end
  end
end
