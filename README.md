# photobooth-app-docker

Prebuilt [photobooth-app](https://github.com/photobooth-app/photobooth-app) Docker image

## What is this?

Minimal Debian container with [photobooth-app](https://github.com/photobooth-app/photobooth-app) intended to be used as a photobooth appliance.

This repository builds a generic version of the latest photobooth-app from the `pip` repository which can then be pulled and run like:

```
podman run -d --name photobooth --privileged --network host -v photobooth-data:/data:Z --device /dev/bus/usb --device /dev/video0 ghcr.io/JohnMertz/photobooth-app
```

Where `photobooth-data` is a directory under the current directory where photos will be stored and configuration files can optionally be created. See [photobooth-app documentation](https://photobooth-app.org/setup/) for more details.
