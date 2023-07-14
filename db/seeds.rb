# frozen_string_literal: true

Category.create(category_name: 'Mobiles')
Category.create(category_name: 'Bikes')
Category.create(category_name: 'Cars')
Category.create(category_name: 'Electronics & Appliances')
Category.create(category_name: 'Furniture')
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?