mono-aspnetvnext Docker image
=============================

The image contains everything needed to play with ASP.NET vNext projects on Mono. This fork uses the mono-3.6.0-branch

# Requirements

* **Docker**: [https://www.docker.io](https://www.docker.io)

# Run Docker image
To run the image, follow these steps:

1. `docker run -i -p 8080:8080 -t prozachj/mono-aspnetvnext /bin/bash`. This downloads and runs the image with your local port 8080 forwarded to the container and connects you to a Bash shell inside the container.
2. `cd ~/helloworld/src/helloworldweb`
3. Run `kpm restore` to restore the necessary packages
4. Start the test web server by running `k web`

The "Hello World" web application should now be running, access it by browsing to http://localhost:8080.

When you exit from the Bash shell, the container will be terminated.
To map a directory from the host machine to the container, you can use the `-v` option, e.g. `-v ~/:/hosthome` will map your home directory to the `/hosthome` directory in the container. This is a simple way to share your own projects with the container.


