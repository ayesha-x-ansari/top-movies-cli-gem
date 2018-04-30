class TopMovies::CLI
  def call
    TopMovies::Scraper.new.make_comingsoon_movies
    list_movies
    menu
  end

  def list_movies
    print_topmovies
  end

  def menu
    puts 'Enter the number of movie you want more information on or type "exit" to quit.' 
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0
        movie = TopMovies::Movies.find(input.to_i)
        puts movie
        print_movie(movie)
      elsif input == "list"
        list_movies
        puts "ddddddddddddddddddddddddddddddddddddddd"
      elseif input == "exit"
        puts "dddddddddddddddddd"
        goodbye
      else
        puts 'Not sure what you want, type "list" to list movies again or type "exit" to quit.'
      end
    end
  end

  def print_topmovies
    puts ""
    puts "---------------------------#{TopMovies::Movies.all.size} Top Movies ---------------------------"
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
  def print_movie(movie)
    puts ""
    puts "----------------------------------------#{movie.title} ------------------------------------"
    puts ""
    puts "Time:             #{movie.timeurl}"
    puts "Info:             #{movie.infourl}"
    puts "Review:           #{movie.reviewurl}"
    puts "Videos:           #{movie.videosurl}"
    puts "Ratings:          #{movie.ratings}"
    puts "Year:             #{movie.year}"
    puts "Genre:            #{movie.genre}"
    puts "Directed By:      #{movie.directedby}"
    puts "Company:          #{movie.company}"
    puts "-------------------------------------D E S C R I P T I O N-----------------------------------"
    puts ""
    puts "#{movie.desc}"
    puts ""
    puts "----------------------------------------S T A R R I N G----------------------------------------"
    puts "                                         "
    puts "Starring:              #{movie.starring}"
    puts "                                         "
  end


  def goodbye
    puts "Have a nice day. See you again Good Bye"
  end
end
