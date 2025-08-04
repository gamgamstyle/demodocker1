FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy only package files first and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app
COPY . .

# Set production mode and port for Azure
ENV NODE_ENV=production
ENV PORT=8080

# Build Next.js app
RUN npm run build

# Expose Azure port
EXPOSE 8080

# Use npx to start Next.js directly on correct port
CMD ["npx", "next", "start", "-p", "8080"]
