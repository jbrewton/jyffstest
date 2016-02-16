Jyffstest
================
**Ruby on Rails Challenge:
Design a Simple Real-time Single-Room Chat Application**

**Purpose:** Demonstrate
a basic understanding of Ruby/Rails with database interaction

**Requirements**

Using RoR, design a simple web-based chatroom / message board
application with real-time polling.  The
application needs to have only one room and can assume that all posts go to
this room.  There is no need to
incorporate any user accounts, logins or session handling.  Assume the room is a public forum.

The application should be a single page that shows the message
contents of the room and has a form for submitting a post.  Since there is no requirement for logins or
session handling, the form for posting a message should require both a name and
a message to be entered.   

Messages should be posted using any method that allows the
contents of the chatroom to be updated in real-time without a page
refresh.  

Additional information and assumptions:

·      
The server is running Rails with a MySQL
database backend

·      
The server has installed all of the basic Ruby gems/
services etc.. needed to communicate with the database and handle web requests

·      
Use of open source 3

rd party
Javascript libraries (Jquery, Bootstrap, Angular, Node .. whatever) 

·      
The HTML layout should make use of at least some
basic CSS-based formatting

Take as much time as it takes to meet your definition of
done.

When complete, please submit all of the assets that will
allow the application to be deployed:

·      
A SQL file to create any necessary database
structure

·      
The application web root containing needed Ruby
files, Javascript files, and CSS files for the application to run

·      
(optional) A file with any special deployment or
usage instructions should there be anything we need to know in order to get
your application to work

Demo
----
Implemented using Redis and WebSockets for communication

[koalas-in-the-rain.elasticbeanstalk.com](http://koalas-in-the-rain.elasticbeanstalk.com) - offline

Getting Started
---------------
Set values in .env file using .env.example
Install and run Redis

```
bundle exec rake db:setup
bundle exec rails s -b lvh.me
```
[browse to jyffstest.lvh.me:3000](http://jyffstest.lvh.me:3000)

Deploying:
Beanstalk needs access to an ElastiCache node running Redis.
Set `CACHE_NODE` to the endpoint and make sure the EC2 instance is in the same VPC as the cache node.
Open inbound port 6379 on EC2 and good times will be had.


Documentation and Support
-------------------------
Should be pretty simple, type in a name then a message and submit

Issues
-------------
I'm sure this time could be spent playing video games

Similar Projects
----------------
[PRISM](https://en.wikipedia.org/wiki/PRISM_(surveillance_program))

Contributing
------------

Credits
-------

License
-------
