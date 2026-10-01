FROM node:20-slim

ENV NODE_ENV=production
WORKDIR /app

# Install deps first for layer caching
COPY package*.json ./
RUN npm ci --omit=dev

COPY . .

# multer diskStorage target
RUN mkdir -p uploads && chown -R node:node /app
USER node

EXPOSE 3000
CMD ["node", "index.js"]
