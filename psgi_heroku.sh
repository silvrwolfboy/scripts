#!/bin/bash

# Creates Heroku's cedar stack for Perl 5 + Plack web application.

APP_NAME=$1
heroku create $APP_NAME --stack cedar --buildpack https://github.com/miyagawa/heroku-buildpack-perl.git
