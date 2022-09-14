##Series Review Application (Sinatra & React Application)
The following is the structure of my application:

MODELS:
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

CONTROLLERS
    application
        '/'
    user
        get '/signup'
        get '/login'
        get '/logout'
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
        get '/reviews/new'
        get '/reviews/:id/edit'
        patch '/reviews/:id
            > updates reviews with  id == :id
        post '/reviews'
            > creates new review
        delete '/reviews/:id/delete'
            > deletes old review with id == :id
VIEWS
    index
         show latest review
    user
        action; create new user
        view > see all reviews
    movie
        show erb > show all review for movie
        new erb
    review
        show.erb > action: delete review
        edit.erb > action: update review if owner
        new.erb > action: create review
