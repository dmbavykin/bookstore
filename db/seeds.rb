user = User.new(email: 'admin@admin.admin', password: '123456', password_confirmation: '123456', admin: true)
user.skip_confirmation!
user.save

Category.create(title: 'Web development')
Category.create(title: 'Photo')
Category.create(title: 'Mobile development')

Delivery.create(title: 'Nova Poshta', days: '3 days', price: 50.0, active: true)
Delivery.create(title: 'Mist Express', days: '5 days', price: 40.0, active: true)
