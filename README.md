docker-hangoutsbot
==================

<p align="center">
    <a href="https://microbadger.com/images/phlak/hangoutsbot" alt="Microbadger"><img src="https://images.microbadger.com/badges/image/phlak/hangoutsbot.svg"></a>
    <a href="https://ln.phlak.net/join-slack"><img src="https://img.shields.io/badge/Join_our-Slack-611f69.svg" alt="Join our"></a>
    <a href="https://github.com/users/PHLAK/sponsorship"><img src="https://img.shields.io/badge/Become_a-Sponsor-cc4195.svg" alt="Become a Sponsor"></a>
    <a href="https://patreon.com/PHLAK"><img src="https://img.shields.io/badge/Become_a-Patron-e7513b.svg" alt="Become a Patron"></a>
    <a href="https://paypal.me/ChrisKankiewicz"><img src="https://img.shields.io/badge/Make_a-Donation-006bb6.svg" alt="One-time Donation"></a>
</p>

<p align="center">
    Docker image for <a href="https://github.com/hangoutsbot/hangoutsbot">Hangoutsbot</a> client.
</p>

---

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

`-e TZ=America/Phoenix` - Set the timezone for your server. You can find your timezone in this
                          [list of timezones](https://goo.gl/uy1J6q). Use the (case sensitive)
                          value from the `TZ` column. If left unset, timezone will be UTC.

`--restart unless-stopped` - Always restart the container regardless of the exit status, but do not
                             start it on daemon startup if the container has been put to a stopped
                             state before. See the Docker [restart policies](https://goo.gl/Y0dlDH)
                             for additional details.

Troubleshooting
---------------

For general help and support join our [Slack Workspace](https://ln.phlak.net/join-slack).

Please report bugs to the [GitHub Issue Tracker](https://github.com/PHLAK/docker-hangoutsbot/issues).

Copyright
---------

This project is licensed under the [MIT License](https://github.com/PHLAK/docker-hangoutsbot/blob/master/LICENSE).
