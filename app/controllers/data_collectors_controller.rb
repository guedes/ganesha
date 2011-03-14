class DataCollectorsController < ApplicationController
  respond_to :html, :js, :json, :xml

  def index
    @data_collector = DataCollector.new
    respond_with @data_collectors = DataCollector.all
  end

  def show
    respond_with(@data_collector = DataCollector.find(params[:id]))
  end

  def new
    respond_with(@data_collector = DataCollector.new)
  end

  def edit
    respond_with(@data_collector = DataCollector.find(params[:id]))
  end

  def create
    @data_collector = DataCollector.new(params[:data_collector])
    flash[:notice] = 'Data collector was successfully created.' if @data_collector.save
    respond_with @data_collector
  end

  def update
    @data_collector = DataCollector.new(params[:data_collector])
    if @data_collector.update_attributes(params[:data_collector])
      flash[:notice] = 'Data collector was successfully updated.'
    end

    respond_with @data_collector
  end

  def destroy
    @data_collector = DataCollector.find(params[:id])
    @data_collector.destroy

    flash[:notice] = 'Data collector was successfully destroyed.'

    respond_with @data_collector
  end
end
