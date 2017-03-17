Modulecounts
------------

Uses 'rake cron' to poll all known repos for data each night.

May fail in development if you have ipv6 enabled - seems to cause
problems connecting to some repositories.


Dev Setup
---------

Runs on Heroku cedar stack with MRI 2.3.2

To run bundle install:

   PATH=$PATH:/Library/PostgreSQL/9.3/bin/ bundle


A Note on Migrations
--------------------

A couple notes after going through and fixing it so migrations work from an
empty database again:

- Always save! or equivalent so that exceptions will be raised.
- Do not update stats or counts in the migrations. This breaks when
  the db structure changes later on - you'll end up trying to work on
  tables that haven't been created yet.
- Plan on running rake cron to load data immediately after rake
  db:migrate since you can't do an update_counts from within
  migrations.
