class RelatedWordsController < ApplicationController
  #before_action :set_related_word, only: %i[ show edit update destroy ]

  # GET /related_words or /related_words.json
  def index
    @related_words = RelatedWord.all
  end

  # GET /related_words/1 or /related_words/1.json
  def show
    api = Apikey.find_by(api_key: params[:api_key])
    api['count'] += 1
    if api.save
      word = params[:word_id]

      word_id = Word.where(word_name: word)
      @related_words = RelatedWord.where(word_id: word_id.ids)
      render json:{
        id: @related_words
      }
    else
      flash[:notice] = 'Invalid'
      redirect_to apikeys_path
    end
  end

  # GET /related_words/new
  def new
    @related_word = RelatedWord.new
  end

  # GET /related_words/1/edit
  def edit
  end

  # POST /related_words or /related_words.json
  def create
    @related_word = RelatedWord.new(related_word_params)

    respond_to do |format|
      if @related_word.save
        format.html { redirect_to @related_word, notice: "Related word was successfully created." }
        format.json { render :show, status: :created, location: @related_word }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @related_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /related_words/1 or /related_words/1.json
  def update
    respond_to do |format|
      if @related_word.update(related_word_params)
        format.html { redirect_to @related_word, notice: "Related word was successfully updated." }
        format.json { render :show, status: :ok, location: @related_word }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @related_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /related_words/1 or /related_words/1.json
  def destroy
    @related_word.destroy
    respond_to do |format|
      format.html { redirect_to related_words_url, notice: "Related word was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_related_word
      @related_word = RelatedWord.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def related_word_params
      params.require(:related_word).permit(:related_word, :word_id)
    end
end
