# syntax=docker/dockerfile:1

# A multi-stage Dockerfile
# First stage
# as base allows us to refer to this build stage in other build stages.
FROM node:14.15.4 as base

WORKDIR /code

COPY package.json package.json
COPY package-lock.json package-lock.json

# Second stage
# we add a new build stage labeled test. We will use this stage for running our tests.
FROM base as test
RUN npm ci
COPY . .
CMD [ "npm", "run", "test" ]

# Third stage
FROM base as prod
RUN npm ci --production
COPY . .
CMD [ "node", "server.js" ]



# FROM node:12.18.1
# ENV NODE_ENV=production

# WORKDIR /app

# COPY ["package.json", "package-lock.json*", "./"]

# RUN npm install --production

# COPY . .

# CMD [ "node", "server.js" ]