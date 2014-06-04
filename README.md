mono-aspnetvnext Docker image
=============================

The image contains everything needed to play with ASP.NET vNext projects on Mono.

# Requirements

* **Docker**: [https://www.docker.io](https://www.docker.io)

# Run Docker image
To run the image, follow these steps:

1. `docker run -i -p 8080:8080 -t akoeplinger/mono-aspnetvnext /bin/bash`. This downloads and runs the image with your local port 8080 forwarded to the container and connects you to a Bash shell inside the container.

To run the "Hello World" sample, follow these steps:

1. `cd ~/helloworld/src/helloworldweb`
2. Start the test web server by running `k web`

The "Hello World" web application should now be running, access it by browsing to http://localhost:8080.
