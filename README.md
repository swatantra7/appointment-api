# README

This README would normally document whatever steps are necessary to get the
application up and running.

Black-Widow is a platform where you can manage your medication order, patient information and available pharmacists at one place.

# System Dependencies

* OS - Ubuntu 16.04/higher OR CentOS 6/7
* RVM
* Ruby 2.5.1
* Rails 6.0.3
* Git 2.16.3 or latest version
* DB- PostgreSQL 10.x or higher

# App Setup

Execute following rake:
* rake db:create
* rake db:migrate
* rake db:seed

This rake will execute all required DB migrations for App setup with seed data.
## Seed Data - Following Records will get created with above rake
1. Roles
2. Default Slots For Doctors

# Config Files
Need to add following configuration files in directory app/config:
* config/database.yml
* config/secrets.yml

For more detail please check 'yml.example' in app directory.

Use following rake to generate secret keys -
* rake secrets

# Background Jobs

No background jobs added yet.


## Automated Testing Setup