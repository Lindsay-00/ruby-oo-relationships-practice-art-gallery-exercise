class Gallery

  attr_reader :name, :city
  @@all = []

  def initialize(name, city)
    @name = name
    @city = city
    @@all << self
  end

  def self.all
    @@all
  end

  def paintings
    Painting.all.select{|each_painting| each_painting.gallery == self}.uniq
  end

  def artists
    #Artist.all.select{|each_artist| each_artist.paintings.map{|each_painting| each_painting.gallery == self}}.uniq
    
      Artist.all.select do |each_artist|
        each_artist.paintings.map do |each_painting|
          each_painting.gallery == self
        end.include?(true)
      end.uniq
    
  end

  def artist_names
    self.artists.map{|each_artist| each_artist.name}.uniq
  end

  def most_expensive_painting
    list_of_prices = self.paintings.map{|each_painting| each_painting.price}
    max_price = list_of_prices.max
    self.paintings.select{|each_painting| each_painting.price == max_price}
  end
end
