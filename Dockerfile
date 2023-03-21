# Build the react project
FROM node:18-alpine as builder
WORKDIR /app

# Install the node_modules first
COPY package*.json ./
RUN npm ci

# Copy the rest of the files
COPY . .

# Build the react application
RUN npm run build

# Default env variables
ENV PORT=80
ENV HOST=0.0.0.0

ENV OPENAI_API_KEY=