require "bcrypt"
salt = BCrypt::Engine.generate_salt
encrypted_password = BCrypt::Engine.hash_secret('password', salt)

User.create!(:email => "bike@bikelover.org", :encrypted_password => encrypted_pa
ssword).save(validate: false);

Bike.create!(log_number: 1, brand: "Schwinn", model: "Paramount", bike_type: "Ro
ad", color: "Radiant Coppertone", purpose: "Sale", price: 300, serial_number: "2
2bikebike22")
Bike.create!(log_number: 2, brand: "Schwinn", model: "Paramount", bike_type: "
Road", color: "Flamboyant Lime", purpose: "Freecyclery", serial_number: "33bikeb
ike33")
