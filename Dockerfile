# Use Node.js 19.7.0-alpine as base image
FROM node:19.7.0-alpine

# Set environment variable
ENV NODE_ENV=production

# Create and set working directory
RUN mkdir /labone && chown -R node:node /labone
WORKDIR /labone

# Switch to node user for security
USER node

# Copy project files into the container
COPY --chown=node:node . .

# Install dependencies
RUN npm install

# Expose the port for the app
EXPOSE 3000

# Start the application
CMD ["node", "src/index.js"]