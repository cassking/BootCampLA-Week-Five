class Article < ActiveRecord::Base
  has_many :comments
  has_many :article_authorships
  has_many :authors, through: :article_authorships

   # def comments
   #   Comment.where(article_id: id)

  #   # sql = "SELECT * FROM comments WHERE article_id = #{id}"
  #   # Comment.find_by_sql(sql)
  #   Comment.where(article_id: id)
  #
   # end
end
