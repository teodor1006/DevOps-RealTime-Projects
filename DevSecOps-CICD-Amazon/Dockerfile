# Use the official base image
FROM node:16

# Set the working directory inside the container
WORKDIR /app

# Copy all json files starting with package to the container
COPY package*.json  ./

# Install dependencies
RUN npm install 

# Copy the rest of the code to the container
COPY . .

# Build the ReactApp
RUN npm run build 

# Expose the port on which the app will run (3000 by default)
EXPOSE 3000

# Start the app when the container starts
CMD [ "npm", "start" ]



