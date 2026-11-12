FROM nginx:1.28-bookworm

RUN apt-get update && apt-get upgrade -y

RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs

RUN                                                                       \
  apt-get install -y                                                      \
  libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libnss3                 \
  libxss1 libasound2 libxtst6 xauth xvfb g++ make

WORKDIR /src/build-your-own-radar
COPY package.json ./
COPY package-lock.json ./
RUN npm ci

COPY . ./
# The script is committed without the executable bit (builds on Windows hide this)
RUN chmod +x ./build_and_start_nginx.sh

# Override parent node image's entrypoint script (/usr/local/bin/docker-entrypoint.sh),
# which tries to run CMD as a node command
ENTRYPOINT []
CMD ["./build_and_start_nginx.sh"]
