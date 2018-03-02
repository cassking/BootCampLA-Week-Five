class Article
  attr_accessor :title, :url, :description, :errors

  # def initialize(title,url,description)
  #   @title = title
  #   @url = url
  #   @description = description
  #   @errors =[]
  # end
  def initialize(article={})
     @title = article["title"]
     @url = article["url"]
     @description = article["description"]
     @errors =[]
   end

  def self.all
   articles_array = []
   articles_data = db_connection { |conn| conn.exec("SELECT * FROM articles")}
     articles_data.each do |article_hash|
       article_instances << Article.new(
      "title" => "#{article_hash["title"]}",
      "url" => "#{article_hash["url"]}",
      "description" => "#{article_hash["description"]}"
      })
     end
   articles_array
  end
  def valid?

      if @title == "" || @url == "" || @description == ""
        @errors << "Please completely fill out form"
        false
      end

      if @url != "" && @url.include?("http") == false
        @errors << "Invalid URL"
      end

      articles_list = Article.all
      if articles_list.any? { |article| article.url == @url } == true
        @errors << "Article with same url already submitted"
      end

      if @description != "" && @description.length < 20
        @errors << "Description must be at least 20 characters long"
      end

      @errors.empty?
    end
  def save
    if valid?
      db_connection do |conn|
        conn.exec_params("INSERT INTO articles (title, url, description) VALUES ($1, $2, $3)",[@title, @url, @description])
      end
      true
    else
      false
    end
  end

end
