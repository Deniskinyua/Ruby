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




CONTROLLERS
    application
        '/'
    user
        get '/signup'
        get '/login'
        get '/logout'
    movie
        get '/movies/:id'
        get '/movies/new'
        post'/movies'
            > creates nw review

    review

VIEWS

