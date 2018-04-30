class TopMovies::CLI
  def call
    puts "Upconing Movies"
  #  UpcomingMovies::Scraper.new.make_comingsoon_movies
    TopMovies::Scraper.new.make_comingsoon_movies
    list_movies
    menu
    "checking menu"
    goodbye
  end

  def list_movies
    puts "Listed Below Are Upcming Movies"
    print_topmovies
    #@movies  =  UpcomingMovies::Movies.today
    #@movies.each.with_index(1)   do |movies, i|
    #  puts "#{i},. #{movies.name} - #{movies.price} #{movies.url}"
    #end
  end

  def menu
    puts "Enter the number of movie you want more information on or type exit to "
    input = nil
    while input != "exit"
      puts "enter the number of movie you want to find more detail on."
      input = gets.strip.downcase

      if input.to_i > 0
        # the_movies =  @movies[input.to_i - 1 ]
        # puts "#{the_movies.name} - #{the_movies.price} #{the_movies.url}"
        TopMovies::Movies.movieinfo

      elsif input == "list"
        list_movies
      else
          puts " Not sure what ypu want type list or exit"
      end
    end
  end

  def print_topmovies
    puts ""
    puts "---------------------------Top Movies ---------------------------"
    puts ""

    TopMovies::Movies.all.each.with_index(1) do |movies, index|
      if movies.title !=  ""
        if index < 10
          index = "0#{index}"
        end
        puts "#{index}.  #{movies.title}"
      end
    end
  end
  def print_restaurant(movies)
    puts ""
    puts "----------------------------------------#{movies.title} ------------------------------------"
    puts ""
    puts "Time:             #{movies.timeurl}"
    puts "Info:             #{movies.infourl}"
    puts "Review:           #{movies.reviewurl}"
    puts "Videos:           #{movies.videosurl}"
    puts "Ratings:          #{movies.ratings}"
    puts "Year:             #{movies.year}"
    puts "Genre:            #{movie.genre}"
    puts "Directed By:      #{movies.directedby}"
    puts "Company:          #{movie.company}"
    puts "-------------------------------------D E S C R I P T I O N-----------------------------------"
    puts ""
    puts "#{movies.desc}"
    puts ""
    puts "----------------------------------------S T A R R I N G----------------------------------------"
    puts "                                         "
    puts "Starring:              #{movies.starring}"
    puts "                                         "
  end


  def goodbye
    puts "see you again bye"
  end
end
