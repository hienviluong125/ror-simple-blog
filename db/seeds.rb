admin_user = User.find_by(email: 'admin@gmail.com')

#create admin account
User.create(email: 'admin@gmail.com', password: 'admin123', admin: true) unless admin_user.present?

#seed posts
FactoryBot.create_list(:post, 20, :with_remote_thumbnail)
