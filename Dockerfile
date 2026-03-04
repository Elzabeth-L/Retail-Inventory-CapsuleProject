FROM node:18-alpine

# 1) Set working directory
WORKDIR /app

# 2) Copy dependency manifests first for caching
COPY package*.json ./

# 3) Install only production dependencies
RUN npm ci --omit=dev

# 4) Copy the rest of the source
COPY . .

# 5) Tell the app which port to listen on (Express will read process.env.PORT)
ENV PORT=8080
EXPOSE 8080

# 6) Start the server
CMD ["node", "server.js"]
