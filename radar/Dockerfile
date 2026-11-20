# ---- Build stage: compile the static site with webpack ----
FROM node:24-bookworm AS build

# RINGS and QUADRANTS are compiled into the bundle by webpack, so they are
# build-time settings. Override with --build-arg if needed.
ARG RINGS='["Employ", "Explore", "Deprecate", "Retire"]'
ARG QUADRANTS='["Platform", "Development Tools and Automation", "Management and Monitoring", "Languages and Frameworks"]'
ENV RINGS=${RINGS} QUADRANTS=${QUADRANTS}

# Cypress is only used for tests; skip downloading its binary
ENV CYPRESS_INSTALL_BINARY=0

WORKDIR /src/build-your-own-radar
COPY package.json package-lock.json ./
RUN npm ci

COPY . ./
RUN npm run build:prod

# ---- Runtime stage: nginx serving static files, no Node.js ----
FROM nginx:stable

COPY default.template /etc/nginx/conf.d/default.conf
COPY --from=build /src/build-your-own-radar/dist/ /opt/build-your-own-radar/
COPY --from=build /src/build-your-own-radar/spec/end_to_end_tests/resources/localfiles/ /opt/build-your-own-radar/files/

# nginx must write its cache and pid file as a non-root user
RUN chown -R nginx:nginx /var/cache/nginx \
  && sed -i 's#/run/nginx.pid#/tmp/nginx.pid#' /etc/nginx/nginx.conf

USER nginx
EXPOSE 80

# Override parent image's entrypoint script, which rewrites config as root
ENTRYPOINT []
CMD ["nginx", "-g", "daemon off;"]
