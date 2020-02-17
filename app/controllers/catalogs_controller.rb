class CatalogsController < ApplicationController
  include Pagy::Backend
  load_and_authorize_resource
  before_action :is_authenticated
  before_action :set_catalog, only: [:show, :edit, :update, :destroy, :getContents, :addContent, :removeContent]

  # GET /catalogs
  # GET /catalogs.json
  def index
    @catalogs = Catalog.list_public()
  end

  def owns
    @catalogs = Catalog.owns(current_user.id)
  end

  # GET /catalogs/1
  # GET /catalogs/1.json
  def show
  end

  # GET /catalogs/new
  def new
    @catalog = Catalog.new
  end

  # GET /catalogs/1/edit
  def edit
  end

  # POST /catalogs
  # POST /catalogs.json
  def create
    @catalog = Catalog.new(catalog_params)
    @catalog.user = current_user
    respond_to do |format|
      if @catalog.save
        format.html { redirect_to @catalog }
        format.json { render :show, status: :created, location: @catalog }
      else
        format.html { render :new }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalogs/1
  # PATCH/PUT /catalogs/1.json
  def update
    respond_to do |format|
      if @catalog.update(catalog_params)
        format.html { redirect_to @catalog }
        format.json { render :show, status: :ok, location: @catalog }
      else
        format.html { render :edit }
        format.json { render json: @catalog.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalogs/1
  # DELETE /catalogs/1.json
  def destroy
    @catalog.destroy
    respond_to do |format|
      format.html { redirect_to catalogs_url }
      format.json { head :no_content }
    end
  end

  # GET /catalogs/add_content/:id
  def getContents
    search = params[:search].present? ? params[:search] : '*'
    @recordType = params[:recordType].present? ? params[:recordType] : 'Movie'
    response = Object.const_get(@recordType).pagy_search(search).records
    @pagy, @contents = pagy_elasticsearch_rails(response, items: ENV['TABLE_PAGINATION_ITEMS'].to_i)
    respond_to do |format|
      format.html { render :add_content }
    end
  end

  # PUT /catalogs/:id/add_content
  def addContent
    permitted = catalog_add_or_remove_content_params
    record = Object.const_get(permitted["recordType"]).find(permitted["recordId"])
    record.addToCatalog(@catalog)
    respond_to do | format |
      format.json { render json: { 'success': true } }
    end
  end

  # DELETE /catalogs/:id/content
  def removeContent
    permitted = catalog_add_or_remove_content_params
    record = Object.const_get(permitted["recordType"]).find(permitted["recordId"])
    record.removeFromCatalog(@catalog)
    respond_to do | format |
      format.json { render json: { 'success': true } }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog
      id = params[:id].nil? ? params[:catalog_id] : params[:id]
      @catalog = Catalog.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_params
      params.require(:catalog).permit(:name, :catalog_category_id, :privacy, :image)
    end

    def catalog_add_or_remove_content_params
      params.permit(:recordType, :recordId)
    end
end
