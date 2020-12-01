class PeopleController < UserController 
  before_action :set_person, only: [:show, :edit, :update, :destroy]
  before_action :set_type
  before_action :address_type_options,
                :set_shift_options,
                :contact_type_options, only: [:new, :create, :edit, :update]
  # GET /people
  # GET /people.json
  def set_type
    if params[:type]
      session[:type] = params[:type]
    end
  end

  def index
    if params[:type] == "client" 
    #Se usar algum relacionamento na index, usar o include
    # @people = Person.includes(:shift)
    #                  .where(client: "true", excluded: "false")
    #                  .page(params[:page])
      @people = Person.where(client: "true", excluded: "false").page(params[:page])
    elsif params[:type] == "provider"
      @people = Person.where(provider: "true", excluded: "false").page(params[:page])
    else
      @people = Person.where(user: "true", excluded: "false").page(params[:page])
    end
  end

  # GET /people/1
  # GET /people/1.json
  def show
  end

  # GET /people/new
  def new
    @person = Person.new
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people
  # POST /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to people_path(type: session[:type]), notice: I18n.t('successfully created') }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1
  # PATCH/PUT /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to people_path(type: session[:type]), notice: I18n.t('successfully updated') }
      else
        format.html { render :edit }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1
  # DELETE /people/1.json
  def destroy
    @person.destroy
    respond_to do |format|
      format.html { redirect_to people_url, notice: I18n.t('successfully destroyed') }
      format.json { head :no_content }
    end
  end

  private
    def set_person_type_options
      #@person_type_options = PersonType.all.pluck(:description, :id)
      @person_type_options = [["provider", 1], ["client", 2], ["user", 3]]
    end
    def set_shift_options
      #@person_type_options = PersonType.all.pluck(:description, :id)
      @shift_options = Shift.all.select{ |p| p.excluded != true }.pluck(:description, :id)
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :nickname, :email, :telephone, :rg, :cpf, :cnpj, :ie, :shift_id, :user_id, :excluded, :provider, :user, :client, 
        contacts_attributes: [:name, :email, :telephone, :cell_phone, :person_id, :contact_type_id, :excluded, :_destroy], 
        addresses_attributes: [:id, :street, :district, :city, :state, :country, :postal_code, :type_address_id, :excluded, :_destroy])
    end
    def address_type_options
      @address_type_options = AddressType.all.select{ |p| p.excluded != true }.pluck(:description, :id)
    end
    def contact_type_options
      @contact_type_options = ContactType.all.select{ |p| p.excluded != true }.pluck(:description, :id)
    end
end
