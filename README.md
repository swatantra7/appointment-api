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


# Api Documentation

* http://localhost:3000/api-docs/index.html

Need to Login Using email - patient@example.com, password- password(created from seed)

create token and then click on authorize and enter "Token token= {token}" inside value.


## Automated Testing OutPut

Appointment
  #check Shot
.    should be valid
  associations
.    is expected to belong to users_slot required: true
.    is expected to belong to patient required: true
.    is expected to belong to doctor required: true
  #Check Appointment Object
.    should be valid

User
  associations
.    is expected to have many appointments class_name => Appointment
.    is expected to have many users_slots class_name => Users::Slot
.    is expected to have many tokens class_name => Users::Token
.    is expected to belong to role required: true


Deprecation Warnings:

Requiring `rspec/autorun` when running RSpec via the `rspec` command is deprecated. Called from /home/adminh/.rvm/gems/ruby-2.5.8/gems/bootsnap-1.5.0/lib/bootsnap/load_path_cache/core_ext/kernel_require.rb:23:in `require'.


If you need more of the backtrace for any of these deprecations to
identify where to make the necessary changes, you can configure
`config.raise_errors_for_deprecations!`, and it will turn the
deprecation warnings into errors, giving you the full backtrace.

1 deprecation warning total

Finished in 0.32877 seconds (files took 1.22 seconds to load)
9 examples, 0 failures

Finished in 0.32877 seconds (files took 1.22 seconds to load)
9 examples, 0 failures