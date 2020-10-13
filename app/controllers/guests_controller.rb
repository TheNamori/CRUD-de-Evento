class GuestsController < ApplicationController
  before_action :set_guest, only: %i[show edit update destroy]
  before_action :selections, only: %i[create new edit update show]

  # GET /guests
  # GET /guests.json
  def index
    @guests = Guest.all
  end

  # GET /guests/1
  # GET /guests/1.json
  def show; end

  # GET /guests/new
  def new
    @guest = Guest.new
  end

  # GET /guests/1/edit
  def edit; end

  # POST /guests
  # POST /guests.json
  def create
    @guest = Guest.new(guest_params)

    respond_to do |format|
      if @guest.save
        format.html { redirect_to @guest, notice: 'Participante criado com sucesso!' }
        format.json { render :show, status: :created, location: @guest }
      else
        format.html { render :new }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guests/1
  # PATCH/PUT /guests/1.json
  def update
    respond_to do |format|
      if @guest.update(guest_params)
        format.html { redirect_to @guest, notice: 'Participante editado com sucesso!' }
        format.json { render :show, status: :ok, location: @guest }
      else
        format.html { render :edit }
        format.json { render json: @guest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guests/1
  # DELETE /guests/1.json
  def destroy
    @guest.destroy
    respond_to do |format|
      format.html { redirect_to guests_url, notice: 'Participante excluido com sucesso' }
      format.json { head :no_content }
    end
  end

  def selections
    @category_selection = Category.all
    @gender_selection = %w[Masculino Feminino Outros]
    @state_selection = %w[
      Acre
      Alagoas
      Amapá
      Amazonas
      Bahia
      Ceará
      Distrito\ Federal
      Espírito\ Santo
      Goiás
      Maranhão
      Mato\ Grosso
      Mato\ Grosso\ do\ Sul
      Minas\ Gerais
      Pará
      Paraíba
      Paraná
      Pernambuco
      Piauí
      Rio\ de\ Janeiro
      Rio\ Grande\ do\ Norte
      Rio\ Grande\ do\ Sul
      Rondônia
      Roraima
      Santa\ Catarina
      São\ Paulo
      Sergipe
      Tocantins
    ]
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_guest
    @guest = Guest.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def guest_params
    params.require(:guest).permit(:name,
                                  :age,
                                  :gender,
                                  :category_id,
                                  :street,
                                  :neighborhood,
                                  :cep,
                                  :street_number,
                                  :state,
                                  phones_attributes: %i[id phone _destroy])
  end
end
