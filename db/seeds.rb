user = User.new(email: 'admin@admin.admin', password: '123456', password_confirmation: '123456', admin: true)
user.skip_confirmation!
user.save!

Category.create(title: 'Web development')
Category.create(title: 'Photo')
Category.create(title: 'Mobile development')
