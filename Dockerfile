# Base image 
FROM node:14-alpine3.15

# Defines exposed port  
EXPOSE 4000

# Creates working directory inside container to move code
WORKDIR /api

# Copy files from local to defines working directory
COPY . .

# Install dependencies
RUN npm install

# Run scripts to lauch api 
CMD ["npm", "run", "dev"]


