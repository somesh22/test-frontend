# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package*.json ./

# Install app dependencies
RUN npm ci --only=production

# Copy the app source code to the working directory
COPY . .

# Build the React app
RUN npm run build

# Set the command to start the React app
CMD ["npm", "run", "start"]

