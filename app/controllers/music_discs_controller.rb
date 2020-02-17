class MusicDiscsController < ApplicationController
  load_and_authorize_resource
  before_action :is_authenticated
  before_action :set_music_disc, only: [:show, :edit, :update, :destroy, :addSong, :removeSong]

  # GET /music_discs
  # GET /music_discs.json
  def index
    @music_discs = MusicDisc.all
  end

  # GET /music_discs/1
  # GET /music_discs/1.json
  def show
  end

  # GET /music_discs/new
  def new
    @music_disc = MusicDisc.new
  end

  # GET /music_discs/1/edit
  def edit
  end

  # POST /music_discs
  # POST /music_discs.json
  def create
    @music_disc = MusicDisc.new(music_disc_params)
    @music_disc.user = current_user
    respond_to do |format|
      if @music_disc.save
        format.html { redirect_to @music_disc }
        format.json { render :show, status: :created, location: @music_disc }
      else
        format.html { render :new }
        format.json { render json: @music_disc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /music_discs/1
  # PATCH/PUT /music_discs/1.json
  def update
    songs_to_remove = @music_disc.songs.select {|song| !music_disc_params[:music_category_ids].include?(song.music_category.id.to_s)}
    songs_to_remove.each do | song |
      @music_disc.songs.delete(song)
    end
    respond_to do |format|
      if @music_disc.update(music_disc_params)
        format.html { redirect_to @music_disc }
        format.json { render :show, status: :ok, location: @music_disc }
      else
        format.html { render :edit }
        format.json { render json: @music_disc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /music_discs/1
  # DELETE /music_discs/1.json
  def destroy
    @music_disc.destroy
    respond_to do |format|
      format.html { redirect_to music_discs_url }
      format.json { head :no_content }
    end
  end

  # GET 'song/add
  def addSong
    song = Song.find(params[:song_id])
    @music_disc.songs << song
    @music_disc.save
    respond_to do |format|
      format.html { redirect_to @music_disc}
    end
  end

  def removeSong
    song = Song.find(params[:song_id])
    @music_disc.songs.delete(song)
    @music_disc.save
    respond_to do |format|
      format.html { redirect_to @music_disc}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music_disc
      id = params[:id].nil? ? params[:music_disc_id] : params[:id]
      @music_disc = MusicDisc.find(id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def music_disc_params
      params.require(:music_disc).permit(:title, :discography, :group_name, { music_category_ids: []}, :image)
    end
end
