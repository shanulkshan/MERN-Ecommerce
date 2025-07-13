# Use official Node.js LTS image as the base
FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy backend package.json and package-lock.json
COPY backend/package*.json ./backend/

# Install backend dependencies
RUN cd backend && npm install

# Copy backend source code
COPY backend/ ./backend/

# Copy environment file
COPY backend/config/.env ./backend/config/

# Expose the port the backend runs on
EXPOSE 8000

# Change to backend directory and start the application
WORKDIR /app/backend
CMD ["npm", "start"]