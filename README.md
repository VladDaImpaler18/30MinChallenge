## Table of Contents
* [Introduction](#Introduction)
* [Getting Started](#getting-started)
* [Usage](#usage)


## Introduction
I created a little application for the Ruby Engineer 30 minute challenge. It's objective is to fetch data from a third party website and return it's data as JSON to the user.

## Getting Started
To get started the database must be loaded by using the rake task `rails db:migrate`. Once the schema has been created run the local server with the command `rails s`.

## Usage
While the rails server is active, use the terminal to navigate to the project's working directory and enter the command `curl localhost:3000`