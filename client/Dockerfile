# Use the Node 17 Alpine image as the builder stage
FROM node:16-alpine as builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json into the container
COPY package.json .
COPY package-lock.json .

# Install the dependencies using npm
RUN npm install

# Copy the rest of the application code into the container
COPY . .

# Build the application
RUN npm run build

# Use the Nginx image to serve the built application
FROM nginx:1.19.0

# Set the working directory inside the container
WORKDIR /usr/share/nginx/html

# Remove any existing content in the working directory
RUN rm -rf ./*

# Copy the built application from the builder stage to the Nginx directory
COPY --from=builder /app/build .

# Start Nginx when the container starts
ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
