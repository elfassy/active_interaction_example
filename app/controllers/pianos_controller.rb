class PianosController < ApplicationController
  before_action :set_piano, only: [:show, :edit, :update, :destroy]

  # GET /pianos
  # GET /pianos.json
  def index
    @pianos = Piano.all
  end

  # GET /pianos/1
  # GET /pianos/1.json
  def show
  end

  # GET /pianos/new
  def new
    User.first_or_create!(name: 'Bob')
    @piano = CreatePiano.new
  end

  # GET /pianos/1/edit
  def edit
  end

  # POST /pianos
  # POST /pianos.json
  def create
    outcome = CreatePiano.run(params: params[:piano], user: User.first)

    respond_to do |format|
      if outcome.valid?
        @piano = outcome.result
        format.html { redirect_to @piano, notice: 'Piano was successfully created.' }
        format.json { render :show, status: :created, location: @piano }
      else
        @piano = outcome
        format.html { render :new }
        format.json { render json: @piano.errors , status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pianos/1
  # PATCH/PUT /pianos/1.json
  def update
    respond_to do |format|
      if @piano.update(piano_params)
        format.html { redirect_to @piano, notice: 'Piano was successfully updated.' }
        format.json { render :show, status: :ok, location: @piano }
      else
        format.html { render :edit }
        format.json { render json: @piano.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pianos/1
  # DELETE /pianos/1.json
  def destroy
    @piano.destroy
    respond_to do |format|
      format.html { redirect_to pianos_url, notice: 'Piano was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_piano
      @piano = Piano.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def piano_params
      params.require(:piano).permit(:name)
    end
end
