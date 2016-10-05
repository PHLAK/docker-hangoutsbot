docker-hangoutsbot
==================

Docker image for [Hangoutsbot](https://github.com/hangoutsbot/hangoutsbot) client.

[![](https://images.microbadger.com/badges/image/phlak/hangoutsbot.svg)](http://microbadger.com/#/images/phlak/hangoutsbot "Get your own image badge on microbadger.com")

Running the Container
---------------------

First create a named data volume to hold the persistent config data:

    docker volume create --name hangoutsbot-data

**First run & authentication**

The first time you run the bot you have to authenticate it manually.  To do
this run the bot interactively and follow the instructions given:

    docker run -it --rm -v hangoutsbot-data:/etc/hangoutsbot phlak/hangoutsbot

**Running the bot**

Once authenticated you can use `Ctrl + C` to kill the running container and run
a daemonized instance of the bot image:

    docker run -dt -v hangoutsbot-data:/etc/hangoutsbot --name hangoutsbot phlak/hangoutsbot

#### Optional 'docker run' Arguments

`--restart always` - Always restart the container regardless of the exit status. See the Docker
                     [restart policies](https://goo.gl/OI87rA) for additional details.

Troubleshooting
---------------

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-hangoutsbot/issues).

Copyright
---------

This project is liscensed under the [MIT License](https://github.com/PHLAK/docker-hangoutsbot/blob/master/LICENSE).
