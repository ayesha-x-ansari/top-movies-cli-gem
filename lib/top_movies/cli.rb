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
    puts "Enter the number of movie from 1 to #{TopMovies::Movies.all.size} you want more information on or" +  ' type "exit" to quit.' 
    input = nil
    while input != "exit"
      input = gets.strip.downcase

      if input.to_i > 0  && input.to_i  <=  TopMovies::Movies.all.size 
        movie = TopMovies::Movies.find(input.to_i)
        print_movie(movie)
      elsif input.to_i  >  TopMovies::Movies.all.size
        puts "You entered number #{input.to_i}."       
        puts "Enter the number of movie from 1 to #{TopMovies::Movies.all.size} you want more information on or" +  ' type "list" to list movies or  "exit" to quit.'
      elsif input == "list"
        list_movies
      elsif input == "exit"
        puts ""
        goodbye
        puts ""
      else
        puts "Not sure what you want, enter the number of movie from 1 to #{TopMovies::Movies.all.size} you want more information on or" +  ' type "list" to list movies or  "exit" to quit.'
      end
    end
  end

  def print_topmovies
    puts ""
    puts "---------------------------#{TopMovies::Movies.all.size} Top Movies ---------------------------"
    puts ""

    TopMovies::Movies.all.each.with_index(1) do |movies, index|
      if index < 10
        index = "0#{index}"
      end
        puts "#{index}.  #{movies.title}"
    end
  end
  def print_movie(movie)
    puts ""
    puts "----------------------------------------#{movie.title} ------------------------------------"
    puts ""
    puts "Time:             #{movie.time_url}"
    puts "Info:             #{movie.info_url}"
    puts "Review:           #{movie.review_url}"
    puts "Videos:           #{movie.video_url}"
    puts "Ratings:          #{movie.get_rating}"
    puts "Year:             #{movie.get_year}"
    puts "Genre:            #{movie.get_genre}"
    puts "Directed By:      #{movie.get_directedby}"
    puts "Company:          #{movie.get_company}"
    puts "-------------------------------------D E S C R I P T I O N-----------------------------------"
    puts ""
    puts "#{movie.get_desc}"
    puts ""
    puts "----------------------------------------S T A R R I N G----------------------------------------"
    puts " "                                                                                             
    puts "Starring:              #{movie.get_starring}"
    puts " "
    puts "------------------------------------------------------------------------------------------------"
    puts " "
    puts "Enter the number of movie from 1 to #{TopMovies::Movies.all.size} you want more information on or" +  ' type "list" to list movies or  "exit" to quit.'
  end


  def goodbye
    puts "Have a nice day. See you again Good Bye"
  end
end
