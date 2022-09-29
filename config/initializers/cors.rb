Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      # origins 'http://localhost:3000', 'http://localhost:3001', 'http://localhost:3002'
      origins ["https://calm-brushlands-14039.herokuapp.com/", "http://calm-brushlands-14039.herokuapp.com/", "http://localhost:3000", "http://localhost:3001"]
  
      resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head]
    end
  end