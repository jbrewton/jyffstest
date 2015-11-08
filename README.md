Jyffstest
================

Demo
----
[koalas-in-the-rain.elasticbeanstalk.com](http://koalas-in-the-rain.elasticbeanstalk.com)

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
