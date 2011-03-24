class CollectedDataController < ApplicationController
  # GET /collected_data
  # GET /collected_data.xml
  def index
    @collected_data = CollectedDatum.all

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

  # GET /collected_data/new
  # GET /collected_data/new.xml
  def new
    @collected_datum = CollectedDatum.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @collected_datum }
    end
  end

  # GET /collected_data/1/edit
  def edit
    @collected_datum = CollectedDatum.find(params[:id])
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

  # PUT /collected_data/1
  # PUT /collected_data/1.xml
  def update
    @collected_datum = CollectedDatum.find(params[:id])

    respond_to do |format|
      if @collected_datum.update_attributes(params[:collected_datum])
        format.html { redirect_to(@collected_datum, :notice => 'Collected datum was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @collected_datum.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /collected_data/1
  # DELETE /collected_data/1.xml
  def destroy
    @collected_datum = CollectedDatum.find(params[:id])
    @collected_datum.destroy

    respond_to do |format|
      format.html { redirect_to(collected_data_url) }
      format.xml  { head :ok }
    end
  end
end
