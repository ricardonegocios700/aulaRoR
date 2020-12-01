class AddressesController < UserController
  before_action :set_address, only: [:show, :edit, :update, :destroy]
  before_action :session_type
  before_action :address_type_options, only: [:new, :create, :edit, :update]
  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.where(excluded: "false")
                        .order(:street).page(params[:page])
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @address = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to addresses_path, notice: I18n.t('successfully created') }
        format.json { render :show, status: :created, location: @address }
      else
        format.html { render :new }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @address.update(address_params)
        format.html { redirect_to addresses_path, notice: I18n.t('successfully updated') }
        format.json { render :show, status: :ok, location: @address }
      else
        format.html { render :edit }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: I18n.t('successfully destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      @address = Address.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def address_params
      params.require(:address).permit(:street, :district, :city, :state, :country, :postal_code, :type_address_id, :excluded)
    end
    def session_type
      session[:type] = controller_name
    end

    def address_type_options
      @address_type_options = AddressType.all.select{ |p| p.excluded != true }.pluck(:description, :id)
    end
end
