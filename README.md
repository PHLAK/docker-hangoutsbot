docker-hangoutsbot
==================

Docker image for [Hangoutsbot](https://github.com/hangoutsbot/hangoutsbot) client.

[![](https://images.microbadger.com/badges/image/phlak/hangoutsbot.svg)](http://microbadger.com/#/images/phlak/hangoutsbot "Get your own image badge on microbadger.com")

### Running the container

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


##### Optional 'docker run' Arguments

`--restart always` - Always restart the container regardless of the exit status. See the Docker
                     [restart policies](https://goo.gl/OI87rA) for additional details.


-----

**Copyright (c) 2016 Chris Kankewicz <Chris@ChrisKankiewicz.com>**

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
