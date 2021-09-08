## Table of Contents
* [Introduction](#Introduction)
* [Getting Started](#getting-started)
* [Usage](#usage)


## Introduction
I created a little application for the Ruby Engineer 30 minute challenge. Its objective is to fetch data from a third party website and return it's data as JSON to the user. This application includes error handling, and tests for the controller and ActiveModel. The model does not use the database, so any migrations are unnecessary.

## Getting Started
When in the project directory execute the command `bundle install` to install any required gems. Once completed, run the local server with the command `rails s`.

## Usage
While the rails server is active, open another terminal and navigate to the project directory and enter the command `curl localhost:3000`