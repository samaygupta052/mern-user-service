# =====================
# Stage 1: Build
# =====================
FROM node:20-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy all source code
COPY . .

# Optional: Build if using TypeScript or transpilers
# RUN npm run build

# =====================
# Stage 2: Production image
# =====================
FROM node:20-alpine

# Set working directory
WORKDIR /app

# Copy dependencies and source from builder
COPY --from=builder /app ./

# Set environment variable
ENV NODE_ENV=production

# Expose service port
EXPOSE 5000

# Start the server
CMD ["node", "src/server.js"]
