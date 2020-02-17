class CatalogCategoriesController < ApplicationController
  before_action :is_authenticated
  before_action :set_catalog_category, only: [:show, :edit, :update, :destroy]

  # GET /catalog_categories
  # GET /catalog_categories.json
  def index
    @catalog_categories = CatalogCategory.all
  end

  # GET /catalog_categories/1
  # GET /catalog_categories/1.json
  def show
  end

  # GET /catalog_categories/new
  def new
    @catalog_category = CatalogCategory.new
  end

  # GET /catalog_categories/1/edit
  def edit
  end

  # POST /catalog_categories
  # POST /catalog_categories.json
  def create
    @catalog_category = CatalogCategory.new(catalog_category_params)

    respond_to do |format|
      if @catalog_category.save
        format.html { redirect_to catalog_categories_url }
        format.json { render :show, status: :created, location: @catalog_category }
      else
        format.html { render :new }
        format.json { render json: @catalog_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catalog_categories/1
  # PATCH/PUT /catalog_categories/1.json
  def update
    respond_to do |format|
      if @catalog_category.update(catalog_category_params)
        format.html { redirect_to  catalog_categories_url }
        format.json { render :show, status: :ok, location: @catalog_category }
      else
        format.html { render :edit }
        format.json { render json: @catalog_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catalog_categories/1
  # DELETE /catalog_categories/1.json
  def destroy
    respond_to do |format|
      if @catalog_category.catalogs.count > 0
        format.html { redirect_to catalog_categories_url, notice: { catalog_error: 'Atencion! No se puede eliminar ya que es utilizada en catalogos.' } }
      else
        @catalog_category.destroy
        format.html { redirect_to catalog_categories_url}
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catalog_category
      @catalog_category = CatalogCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catalog_category_params
      params.require(:catalog_category).permit(:name)
    end
end
