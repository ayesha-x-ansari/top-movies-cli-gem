require 'nokogiri'
require 'open-uri'
class TopMovies::Movies
  #class UpcomingMovies::Movies

  attr_accessor :title, :url, :genre_index, :timeurl, :infourl, :reviewurl, :videosurl, :ratings, :year, :genre,
  :directedby, :compaany, :desc, :starring
  @@all = []

  def initialize(title=nil, url=nil, genre_index=nil )
    @title     =   title
    @url       =   url
    @genre_index     =   genre_index

    self.class.all << self

    puts "title: #{title}"
    puts url
    puts "genre11111111S #{genre_index}"
  end

  def self.new_from_index_page(movie_row)
    self.new(
    @title =  movie_row.css("h3.movietitle  a").text.strip,
    @url =  "https://wwww.cinemaclock.com#{movie_row.css("h3.movietitle a").attribute("href").text}" ,
    @url =  movie_row.css("h3.movietitle a").text,
    @genre_index  =  movie_row.css("p.moviegenre").text.strip)
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def movieinfo
  # movie_profile ||= Nokogiri::HTML(open("https://www.cinemaclock.com/movies/i-can-only-imagine-2018"))
    movie_profile ||= Nokogiri::HTML(open(self.url))
    
    tim_button ||= "https://wwww.cinemaclock.com#{movie_profile.css("a.buttontoptab.btntim").attr("href").text}"
    puts tim_button
    info_button ||= "https://wwww.cinemaclock.com#{movie_profile.css("a.buttontoptab.btnrev").attr("href").text}"
    puts info_button
    rev_button ||= "https://wwww.cinemaclock.com#{movie_profile.css("a.buttontoptab.btnrev").attr("href").text}"
    puts rev_button
     vid_button ||= "https://wwww.cinemaclock.com#{movie_profile.css("a.buttontoptab.btnvid").attr("href").text}"
    puts vid_button

    scraper_doc     = movie_profile.css("table.desc tr")

    scraper_doc.each  do |row|
    if row.css("td.desc1").text  == "Year"         ||
        row.css("td.desc1").text  ==  "Genre"       ||
        row.css("td.desc1").text  == "Directed by"  ||
        row.css("td.desc1").text  == "Company"
       desc =      row.css("td.desc1").text + ":  "   + row.css("td.desc2").text
       puts desc
       puts "11"
    end
  #  desc =     row.css("td.desc2").text
  # puts row

     end

    starring ||=  nil
    starring_doc   = movie_profile.css("div#actors1 div.aktor div.aktnam")
      starring_doc.each do |row|
        actor_name = row.css("span.acname").text.strip  +  ","
        starring  =    "#{starring  actor_name}"
        puts starring
      end
    end
end
