say_status "migrating", " dev database"

inside destination_path do

  rake "db:migrate db:seed", :env => "development"

end