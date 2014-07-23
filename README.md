mono-aspnetvnext Docker image
=============================

The image contains everything needed to play with ASP.NET vNext projects on Mono. This fork uses the mono-3.6.0-branch to get the HelloMVC app working.

# Requirements

* **Docker**: [https://www.docker.io](https://www.docker.io)

# Pull Docker Image
`docker pull prozachj/docker-mono-aspnetvnext`

# Run Docker image
To run the image, follow these steps:

`docker run -i -p 80:5000 -t prozachj/docker-mono-aspnetvnext /bin/bash`

This downloads and runs the image with your local port 8o forwarded to the container and connects you to a Bash shell inside the container.

 
#### HelloWorldWeb `docker pull prozachj/docker-mono-aspnetvnext:web`
(The 'web' tag has an entrypoint set so that you don't need this step)

1. `cd ~/HelloWorldVNext/src/helloworldweb`
2. Start the test web server by running `k web`

The "Hello World" web application should now be running, access it by browsing to http://localhost

#### HelloWorldMVC `docker pull prozachj/docker-mono-aspnetvnext:mvc`
(The 'mvc' tag has an entypoint set so that you don't need this step)

1. `cd ~HelloWorldVNext/src/hellomvc`
2. Start the test web server by running `k web`

The "HelloMVC" Razor application should now be running, access it by browsing to http://localhost

When you exit from the Bash shell, the container will be terminated.
To map a directory from the host machine to the container, you can use the `-v` option, e.g. `-v ~/:/hosthome` will map your home directory to the `/hosthome` directory in the container. This is a simple way to share your own projects with the container.


