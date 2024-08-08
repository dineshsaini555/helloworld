# Step 1: Use an official Node.js runtime as the base image
FROM node:18-alpine

# Step 2: Set the working directory inside the container
WORKDIR /app

# Step 3: Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Step 4: Install dependencies
RUN npm install

# Step 5: Copy the rest of the application code to the container
COPY . .

# Step 6: Build the React application for production
RUN npm run build

# Step 7: Install a simple HTTP server to serve the static files
RUN npm install -g serve

# Step 8: Expose the port the app will run on
EXPOSE 8000

# Step 9: Command to run the application
CMD ["serve", "-s", "build"]