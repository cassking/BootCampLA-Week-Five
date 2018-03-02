# class CreateGenres < ActiveRecord::Migration
#   def change
#     create_table :genres do |t|
#       t.string :name, null: false # add null: false constraint
#
#       t.timestamps null: false
#     end
#
#     add_index :genres, :name, unique: true # add uniqueness constraint
#   end
# end
class Song < ActiveRecord::Base
  #validates :year, presence: true
  # validates :year, numericality: true, length: { is: 4 }
  #validates :year, numericality: true, length: { minimum: 2, maximum: 4 }

end
class Song < ActiveRecord::Base
  #refer to http://guides.rubyonrails.org/active_record_validations.html#length

  # validates :year, presence: true
  # validates :year, numericality: true, length: { minimum: 2, maximum: 4 }
  validates :title, presence: true
  validates :artist, presence: true
  validates :album, presence: true
  validates :year,numericality: true, length: true, in: 2..4
  validates :track_number, numericality: true, length: true, in: 1..3
  validates :genre, presence: true
  validates :length_in_seconds, numericality: true, length: true, in: 1..4
  #https://stackoverflow.com/questions/23232660/activerecord-validation-for-image-url
  validates :image, format: { with: /\.(png|jpg)\Z/i }
end
