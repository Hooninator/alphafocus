json.extract! usr, :id, :usrname, :password, :created_at, :updated_at
json.url usr_url(usr, format: :json)
