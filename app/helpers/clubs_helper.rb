module ClubsHelper
  def get_small_genre_by(big_genre)
    genre_relation = {
      "スポーツ" => ["サッカー", "野球", "テニス"],
      "エンタメ" => ["合唱", "語学", "ダンス"],
      "その他" => ["ディベート", "マーケティング", "その他"]
    }
    return genre_relation[big_genre]
  end
end
