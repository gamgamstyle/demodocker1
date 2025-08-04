FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy everything else
COPY . .

# Set environment to production
ENV NODE_ENV=production

# Azure expects apps to listen on $PORT
ENV PORT=8080

# Build the Next.js app
RUN npm run build

# Expose the port for Azure
EXPOSE 8080

# Start the Next.js app with the correct port
CMD ["npx", "next", "start", "-p", "8080"]
