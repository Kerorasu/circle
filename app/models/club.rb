class Club < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true
  validates :big_genre, presence: true
  validates :small_genre, presence: true
  validates :frequency, presence: true
  validates :place, presence: true
  validates :pr, presence: true
  validates :face, presence: true
  validates :drink, presence: true
  validates :people, presence: true
  validates :twitter_id, presence: true

  scope :search_with_big_genre, ->(big_genre) { where(big_genre: big_genre) if big_genre.present? }
  scope :search_with_small_genre, ->(small_genre) { where(small_genre: small_genre) if small_genre.present? }
  scope :search_with_frequency, ->(frequency) { where(frequency: frequency) if frequency.present? }
  scope :search_with_face, ->(face) { where(face: face) if face.present? }
  scope :search_with_drink, ->(drink) { where(drink: drink) if drink.present? }
  scope :search_with_people, ->(people) { where(people: people) if people.present? }
end
