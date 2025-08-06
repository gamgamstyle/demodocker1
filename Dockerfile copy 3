# Build stage
FROM node:lts-alpine AS builder

WORKDIR /app

COPY package*.json ./
RUN npm ci

COPY . .
RUN npm run build

# Production stage
FROM node:lts-alpine

WORKDIR /app

# Copy only what's needed
COPY --from=builder /app/.next ./.next
COPY --from=builder /app/public ./public
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./

ENV NODE_ENV=production
ENV PORT=8080
EXPOSE 8080

# Safer than relying on node_modules/.bin/next
CMD ["npx", "next", "start", "-p", "8080"]
