class ContactTypesController < UserController 
  before_action :set_contact_type, only: [:show, :edit, :update, :destroy]
  before_action :session_type
  # GET /contact_types
  # GET /contact_types.json
  def index
    @contact_types = ContactType.where(excluded: "false")
                                .order(:description).page(params[:page])
  end

  # GET /contact_types/1
  # GET /contact_types/1.json
  def show
  end

  # GET /contact_types/new
  def new
    @contact_type = ContactType.new
  end

  # GET /contact_types/1/edit
  def edit
  end

  # POST /contact_types
  # POST /contact_types.json
  def create
    @contact_type = ContactType.new(contact_type_params)

    respond_to do |format|
      if @contact_type.save
        format.html { redirect_to contact_types_path, notice: I18n.t('successfully created') }
        format.json { render :show, status: :created, location: @contact_type }
      else
        format.html { render :new }
        format.json { render json: @contact_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_types/1
  # PATCH/PUT /contact_types/1.json
  def update
    respond_to do |format|
      if @contact_type.update(contact_type_params)
        format.html { redirect_to contact_types_path, notice: I18n.t('successfully updated') }
        format.json { render :show, status: :ok, location: @contact_type }
      else
        format.html { render :edit }
        format.json { render json: @contact_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_types/1
  # DELETE /contact_types/1.json
  def destroy
    @contact_type.destroy
    respond_to do |format|
      format.html { redirect_to contact_types_url, notice: I18n.t('successfully destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_type
      @contact_type = ContactType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_type_params
      params.require(:contact_type).permit(:description, :note, :excluded)
    end
    def session_type
      session[:type] = controller_name
    end
end
