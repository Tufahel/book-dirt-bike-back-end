Rails.application.config.middleware.insert_before 0, Rack::Cors do
    allow do
      # origins 'http://localhost:3000', 'http://localhost:3001', 'http://localhost:3002'
      origins ["https://incredible-unicorn-5f0c7d.netlify.app", "http://incredible-unicorn-5f0c7d.netlify.app", "http://localhost:3000", "http://localhost:3001"]
  
      resource '*',
               headers: :any,
               methods: %i[get post put patch delete options head],
               expose: ["Authorization", "access-token", "expiry", "client", "uid", "token-type"],
               max_age: 600
    end
  end