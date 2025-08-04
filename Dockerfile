FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all files
COPY . .

# Ensure environment variables are available
ENV NODE_ENV=production

# Build the Next.js app
RUN npm run build

# Expose port used by Next.js
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
