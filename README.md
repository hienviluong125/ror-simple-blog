# README

### Ruby version: 2.6.6
### Rails version: 6.0.3.4

### Postgres version: 12.x

### Gem using:
- Devise: for basic authentication flow
- Carrierwave: for handle media uploading
- Pundit: for handle authorization using policy pattern
- ActionText: for implement richtext editor
- Pagy: pagination
- Rspec, shoulda-matchers, simplecov, faker: for unit testing and data seeding

### 3rd party using:
- Cloudinary: Media storage service
- Sendgrid: Mail service
- Heroku: Cloud platform

### CI/CD:
- Using github action
- Auto run rspec testing everytime that code was commited to github
- Auto run rspec testing and deploy to heroku everytime that code was commited to `main` branch

### Heroku production
https://immense-wildwood-59860.herokuapp.com/

### Environment configuration
```
# required on development && production
DATABASE_USERNAME=username
DATABASE_PASSWORD=passowrd
DATABASE_PORT=5432
DATABASE_HOST=localhost

# required on production
CLOUD_NAME=your_cloudinary_name
CLOUD_API_KEY=your_cloudinary_api_key
CLOUD_API_SECRET=your_cloudinary_api_secret
SENDGRID_API_KEY=your_sendgrid_api_key
DOMAIN_NAME=your_domain_name
MAILER_SENDER=example@gmail.com
```

### Setup guide
1. create `.env` on root directory follow `sample.env` file
2. run `rake db:create` command to create database
3. run `rake db:migrate` command to run migration
4. run `rake db:seed` command to seed data ( optional )
  admin account will have following information after run `rake db:seed`
  - email: admin@gmail.com
  - password: admin123
5. run `rails s` command to start server
6. run `./bin/webpack-dev-server` command to start webpack dev server ( optional )
