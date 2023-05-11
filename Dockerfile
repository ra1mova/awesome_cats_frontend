# Build stage
FROM node:14 AS build
WORKDIR /app
COPY awesome_cats_frontend/package*.json /app
RUN npm install
COPY awesome_cats_frontend/ /app
RUN npm run build

# Production stage
FROM nginx:alpine
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
