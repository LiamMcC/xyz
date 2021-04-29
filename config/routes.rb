Rails.application.routes.draw do

  devise_for :user


  
  

  root 'happykid#home'
  
  get '/contact' =>'happykid#contact'


  get '/news/:id' => 'happykid#news'

  get '/happening/:id' => 'happykid#happening'


  post '/contact' => 'happykid#create'
 get '/staff' => 'happykid#staff'
 get '/add/staff' => 'happykid#addstaff'
  get '/editstaff/:id' => 'happykid#editstaff'
  post '/editstaff/:id' => 'happykid#changestaff'
post '/add/staff' => 'happykid#makestaff'
get '/singlestaff/:id' => 'happykid#singlestaff'
get '/editstaffimage/:id' => 'happykid#editstaffimage'
post '/editstaffimage/:id' => 'happykid#changestaffimage'

####################### Admin routes here ###################################

# Upload video
post '/admin' => 'happykid#savevid'

#Admin
  get '/admin' => "happykid#admin"

  #Admin info section
  get '/add/info' => 'happykid#addinfo'
  post 'add/info' => 'happykid#makeinfo' 
  get '/editinfo/:id' => 'happykid#editinfo'
  post '/editinfo/:id' => 'happykid#changeinfo'
  get '/deleteinfo/:id' => 'happykid#deleteinfo'
  # Admin opening times
  
  get '/add/openigtime' => 'happykid#addtime'
  post "/add/openigtime" => 'happykid#maketime'
  get '/edittime/:id' => 'happykid#edittime'
  post '/edittime/:id' => 'happykid#changetime'
  get '/deletetime/:id' => 'happykid#deletetime'



  # Admin promo details 
  get 'add/promo' =>'happykid#addpromo'

# Post request to make a new promo
  post 'add/promo' =>'happykid#makepromo'
  
# Get request to open edit promo form  
  get 'editpromo/:id' =>'happykid#editpromo'


  # Post request to update edit promo form  
  post 'editpromo/:id' =>'happykid#changepromo'

  # Delete promo
  get '/deletepromo/:id' => 'happykid#deletepromo'

# get request to add news form 
get 'add/news' =>'happykid#addnews'

# route to get page to change videos for news
get 'editnewsvid/:id' => 'happykid#editnewsvid'
post 'editnewsvid/:id' => 'happykid#changenewsvideo'
# Post request to make a new news
post 'add/news' =>'happykid#makenews'


# Get request to open edit news form  
get 'editnews/:id' =>'happykid#editnews'

# Post request to edit news item  
post 'editnews/:id' =>'happykid#changenews'


# Get request to delete news
get '/deletnews/:id' => 'happykid#deletenews'


####################### Admin routes end here ###################################


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
