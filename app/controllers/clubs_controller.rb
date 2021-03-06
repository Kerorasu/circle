class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
    # @small_genres = []
  end

  # GET /clubs/1
  # GET /clubs/1.json
  def show
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
      config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
      config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
      config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end

    begin
      timelines = client.user_timeline(@club.twitter_id)
      @tweets = []
    rescue
    end

    if timelines.present?
      timelines.each do |timeline_tweet|
         tweet = client.status(timeline_tweet.id)
         @tweets << tweet.text
      end
    end
  end





  def search
    # @small_genres = []
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

  def get_small_genre_search
    genre_relation = {
      "" => [["未選択", ""]],
      "スポーツ" => [["未選択", ""], "サッカー", "野球", "テニス"],
      "エンタメ" => [["未選択", ""], "合唱", "語学", "ダンス"],
      "その他" => [["未選択", ""], "ディベート", "マーケティング", "その他"]
    }
    @small_genres = genre_relation[params[:big_genre]]
  end

  def get_small_genre_form
    genre_relation = {
      "スポーツ" => ["サッカー", "野球", "テニス"],
      "エンタメ" => ["合唱", "語学", "ダンス"],
      "その他" => ["ディベート", "マーケティング", "その他"]
    }
    @small_genres = genre_relation[params[:big_genre]]
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

end
