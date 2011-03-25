class CollectedDataController < ApplicationController
  # GET /collected_data
  # GET /collected_data.xml
  def index
    @collected_data = CollectedDatum.order("created_at DESC").page(params[:page]).per(10)

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

  # POST /collected_data
  # POST /collected_data.xml
  def create
    @collected_datum = CollectedDatum.new(params[:collected_datum])

    respond_to do |format|
      if @collected_datum.save
        format.html { redirect_to(@collected_datum, :notice => 'Collected datum was successfully created.') }
        format.xml  { render :xml => @collected_datum, :status => :created, :location => @collected_datum }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @collected_datum.errors, :status => :unprocessable_entity }
      end
    end
  end
end
