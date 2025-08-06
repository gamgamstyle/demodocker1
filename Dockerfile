FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Set environment variable
ENV NODE_ENV=production
ENV PORT=8080

# Build the app
RUN npm run build

# Expose the correct port
EXPOSE 8080

# Start the app on port 8080
CMD ["node", "node_modules/next/dist/bin/next", "start", "-p", "8080"]
