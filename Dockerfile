FROM node:lts-alpine

# Set working directory
WORKDIR /app

# Copy dependencies and install
COPY package*.json ./
RUN npm ci

# Copy everything else
COPY . .

# Build Next.js app
RUN npm run build

# Tell Azure the port we want to use
ENV PORT=8080
ENV NODE_ENV=production

# Tell Azure and Next.js to listen on the correct port
EXPOSE 8080

# Start app
CMD ["node", "node_modules/next/dist/bin/next", "start", "-p", "8080"]
