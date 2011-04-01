class CollectedDataController < ApplicationController
  # GET /collected_data
  # GET /collected_data.xml
  def index
    @collected_data = CollectedDatum.includes(:script_target).order("created_at DESC").page(params[:page]).per(10)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @collected_data }
    end
  end

  # GET /collected_data/1
  # GET /collected_data/1.xml
  def show
    @collected_datum = CollectedDatum.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @collected_datum }
    end
  end
end
