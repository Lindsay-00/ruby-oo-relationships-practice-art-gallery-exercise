class Artist

  attr_reader :name, :years_experience
  @@all = []
  @@total_experience = 0


  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @all_paintings = []
    @@all << self
    @@total_experience += years_experience
  end

  def self.all
    @@all
  end

  def paintings
    @all_paintings
    
  end

  def galleries
    selected_paintings = Painting.all.select{|each_painting| @all_paintings.include?(each_painting)}
    selected_paintings.map{|each_painting| each_painting.gallery}.uniq
  end

  def cities
    @all_paintings.map{|each_painting| each_painting.gallery.city}.uniq
  end

  def self.total_experience
    @@total_experience
  end

  def self.most_prolific
    paintings_per_year_arr = Artist.all.map do |each_artist|
      each_artist.paintings.length/each_artist.years_experience
    end

    max_ppy = paintings_per_year_arr.max

    Artist.all.select do |each_artist|
      each_artist.paintings.length/each_artist.years_experience == max_ppy
    end

  end

  def create_painting (title, price, gallery)
    @all_paintings << Painting.new(title, price, gallery)
  end
end
