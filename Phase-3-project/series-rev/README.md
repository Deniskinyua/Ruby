##Series Review Application (Sinatra & React Application)
The following is the structure of my application:

#MODELS:
    User
        Has many reviews
        Has a password
        is unique
            attr: username
            attr: password
            attr: email
    Movie:
        Has many reviews
        is unique
            attr: movie name
    review:
        belongs to the user
        belongs to the movie
            attr: content
            attr: rating
            foreign key: movie_id
            foreign key: user_id

#CONTROLLERS
    application
        '/'
            > shows index
    user
        get '/signup'
            > shows signup of the user
        get '/login'
            > shows the login of the user
        get '/logout'
            > clears the session
            > redirect to the movie movie
    movie
        get '/movies/:id'
            >shows movie/show
        get '/movies/new'
            >shows movie/new
        post'/movies'
            > creates new review
            >redirect movie/:id
    review
        get '/reviews/:id'
            > shows review /shows
        get '/reviews/new'
        get '/reviews/:id/edit'
            > shows review /edit
        patch '/reviews/:id
            > updates reviews with  id == :id
            > redirect to reviews/:id
        post '/reviews'
            > creates new review
            >redirect '/reviews/:id'
        delete '/reviews/:id/delete'ww
            > deletes old review with id == :id
#VIEWS
    index
         show latest review
    user
        action; create new user
        view > see all reviews
    movie
        show erb > show all review for movie
        new erb > create movie > post to /movies
    review
        show.erb > action: delete review if owner > delete to  /reviews/:id/delete
          > link_to:/reviews/:id/
        edit.erb > action: update review if owner > patch to /reviews/:id
        new.erb > action: create review > post to /reviews
