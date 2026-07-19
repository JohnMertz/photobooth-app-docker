FROM debian:trixie-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        python3 \
        python3-pip \
        python3-venv \
        python3-dev \
        ffmpeg \
        libturbojpeg0 \
        libgl1 \
        libgphoto2-dev \
        libexif12 \
        libgphoto2-6 \
        libgphoto2-port12 \
        libltdl7 \
        fonts-noto-color-emoji \
        curl \
    && rm -rf /var/lib/apt/lists/*

# Create application environment
RUN python3 -m venv /opt/photobooth

ENV PATH="/opt/photobooth/bin:${PATH}"

# Install photobooth using binary wheels where possible
RUN pip install --upgrade pip && \
    pip install --prefer-binary photobooth-app

# Persistent application data
VOLUME ["/data"]

WORKDIR /data

EXPOSE 8000

CMD ["photobooth"]
