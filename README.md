# Maintenance Device App

## Overview

This repository contains code to run a Ruby on Rails web app for a "maintenance" device, which consist of an electricity sensor, a vibration sensor, and a magnetic field sensor connected to a TI C32200sf board via a Grove Base Boosterpack. 

The web application allows users to see data from the sensors in a browser window.


## Requirements

In order to use this code, you will need to have rails installed and bundler installed.

To see the live updating web app functionality implemented in the `live_update` branch or the `live_app_update` branch, you will need to have a redis server installed.  If you are on a mac, you can do this by running `brew install redis`.


## Set up

Connect one end of a USB cable to the usb port at the top of the TI C32200SF board and the other end to a USB port on your computer.  

Connect the three to the following ports on the Grove Base Boosterpack:
* Connect the electricity sensor to port J6.  
* Connect the vibration sensor to port J8.
* Connect the magnetic field sensor to port J9.

For more information about the sensors and their interfaces, see [the Apiotics Portal page for a Maintenance Device worker](https://portal.apiotics.com/workers/109).


## Branches

There are four branches in this repository, each with slightly different functionality.

* The `master` branch contains code for a rails application for the Maintenance Device.
* The `app_update` branch builds off the master branch and contains additional logic to turn the background of the row for any device red if the devices sensors detect a magnetic field or vibration above a certain threshold, or if the electric field value is greater than 2.
* The `live_update` branch also builds off the master branch but contains additional logic to automatically update the data from the sensors on the web app.
* The `live_app_update` branch contains the additional logic from the app_update branch AND the live_update branch, to automatically update the web app with data from the sensors, and to turn the row red if a magnetic field, vibration, or electric field greater than 2 is detected.

Note: For the `live_update` branch and the `live_app_update` branch, you will need to install a redis server in order to see updates on the web app without refreshing the page.


## Implementation

1. Decide which branch in the repository has the functionality you want, and clone it onto your local machine.

2. If you are using Linux, uncomment the following line in your Gemfile:
`# gem 'mini_racer', platforms: :ruby`.

3. In `config/initializers/apiotics.rb`, set config.public_key and config.private_key to the public and private keys of your Hive, which can be found on the Apiotics portal near the top of your Hive's page. Copy and paste the corresponding keys instead of "nil" in the following lines:
```
  config.public_key = nil #set this to an Environment variable
  config.private_key = nil #set this to an Environment variable
```

4. If you don't already have bundler installed, run `gem install bundler` then run `bundle`.

5. Run `rake db:migrate`.

6. To start communication with the web app, run `rake dev_comms:start`.

7. If you are using the `live_update` or `live_app_update` branch, start a redis server by opening a new terminal and running `redis-server`.  Leave this terminal open in the background.  If you are using the `master` or `app_update` branch, skip this step.

8. To start your Rails server, run `rails server` (or `rails s`).

9. To see the web app, browse to <http://localhost:3000/maintenance_devices>.


Note: 
If you decide to modify any code in the rails app, you will need to run `dev_comms:restart` (or `dev_comms:stop` then `dev_comms:start`) in order to see the updated functionality on the web app. 


## More Info
* [Ruby on Rails Apiotics Gem](https://portal.apiotics.com/docs/4)
* [Maintenance Device page in Apiotics Portal](https://portal.apiotics.com/workers/109)
