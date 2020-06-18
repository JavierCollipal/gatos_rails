Rails.application.config.middleware.insert_before 0, Rack::Cors do
   allow do
     origins 'localhost:3000'

     resource '*',
       headers: :any, expose: ["Authorization"],
       methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end

   allow do
     origins 'https://portafoliofrontend.appspot.com'

     resource '*',
              headers: :any, expose: ["Authorization"],
              methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
end
