class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
  end

  def search
    @clubs = Club.search_with_big_genre(params[:big_genre])
                 .search_with_small_genre(params[:small_genre])
                 .search_with_frequency(params[:frequency])
                 .search_with_face(params[:face])
                 .search_with_drink(params[:drink])
                 .search_with_people(params[:people])
                 .where(
                   'place LIKE(?)', "%#{params[:place]}%"
                 )
    render :index
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

end
