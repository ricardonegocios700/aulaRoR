class ContactsController < UserController
  before_action :set_contact, only: [:show, :edit, :update, :destroy]
  before_action :session_type
  before_action :contact_type_options, only: [:new, :create, :edit, :update]
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = Contact.where(excluded: "false")
                        .order(:name).page(params[:page])
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = Contact.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to contacts_path, notice: I18n.t('successfully created') }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to contacts_path, notice: I18n.t('successfully updated') }
        format.json { render :show, status: :ok, location: @contact }
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to contacts_url, notice: I18n.t('successfully destroyed') }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contact_params
      params.require(:contact).permit(:name, :email, :telephone, :cell_phone, :person_id, :contact_type_id, :excluded)
    end
    def session_type
      session[:type] = controller_name
    end

    def contact_type_options
      @contact_type_options = ContactType.all.select{ |p| p.excluded != true }.pluck(:name, :id)
    end
end
