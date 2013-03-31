# OpenBadges-Rails

Ruby on Rails Open Badges Issuer


## Create db tables
    openbadges-rails> rake db:migrate


## Load seed data into db
    openbadges-rails> rake db:seed


## Add an administrator for Open Badges admin interface
    openbadges-rails> rake app:add_admin[<email>,<password>] // Without spaces


## Testings
    openbadges-rails> rake test              // Run all tests
    openbadges-rails> rake app:test:units    // Run unit tests only

## Uploaded Images

Uploaded images are stored in
    /public/:class/:attachment/:id_:filename

    Example:
    test/dummy/public/open_badges/badges/image/1_teleport.png

For uploading unit test, images are stored in
    openbadges-rails/tmp/test/:class/:attachment/:id_:filename

    Example:
    openbadges-rails/tmp/test/open_badges/badges/images/1_Smiley_face.jpg