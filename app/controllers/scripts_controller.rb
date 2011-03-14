class ScriptsController < ApplicationController
  # GET /scripts
  # GET /scripts.xml
  def index
    @scripts = Script.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @scripts }
    end
  end

  # GET /scripts/1
  # GET /scripts/1.xml
  def show
    @script = Script.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /scripts/new
  # GET /scripts/new.xml
  def new
    @script = Script.new
    @targetables = params[:target]

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @script }
    end
  end

  # GET /scripts/1/edit
  def edit
    @script = Script.find(params[:id])
  end

  # POST /scripts
  # POST /scripts.xml
  def create
    @script = Script.new(params[:script])
    @targetables = params[:target]

    respond_to do |format|
      if @script.save
        #FIXME: needs refactor for readability?
        @script.data_collectors.create( @targetables.first.first.classify.constantize.find(@targetables.first.second).collect { |x| { :targetable => x } } )


        format.html { redirect_to(@script, :notice => 'Script was successfully created.') }
        format.xml  { render :xml => @script, :status => :created, :location => @script }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /scripts/1
  # PUT /scripts/1.xml
  def update
    @script = Script.find(params[:id])

    respond_to do |format|
      if @script.update_attributes(params[:script])
        format.html { redirect_to(@script, :notice => 'Script was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @script.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /scripts/1
  # DELETE /scripts/1.xml
  def destroy
    @script = Script.find(params[:id])
    @script.destroy

    respond_to do |format|
      format.html { redirect_to(scripts_url) }
      format.xml  { head :ok }
    end
  end
end
