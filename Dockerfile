# Use official Node 16 LTS as base image
FROM node:16-bullseye

# Set working directory
WORKDIR /app

# Copy package.json and yarn.lock first
COPY package.json yarn.lock ./

# Install dependencies using Yarn
RUN yarn install 

# Copy rest of the app
COPY . .

# Build the React app
RUN yarn build

# Install a lightweight static server
RUN yarn global add serve

# Expose the app port
EXPOSE 3000

# Start the app using serve
CMD ["serve", "-s", "build", "-l", "3000"]
