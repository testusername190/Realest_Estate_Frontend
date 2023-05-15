# FROM node:alpine
# WORKDIR /frontend
# COPY ./package*.json ./
# RUN npm install
# RUN npm install --save react-router-dom redux redux-thunk react-redux
# RUN npm install --save node-sass
# RUN npm install --save uuid
# RUN npm install --save axios
# RUN npm install --save react-helmet
# # RUN npm install axios
# # RUN npm install react-razorpay --save
# # RUN npm install react-icons --save
# # RUN npm install react-router-dom --save
# COPY . .
# CMD [ "npm","start" ]

#Telling Docker to use the the node:17-alpine image as the base image
FROM node:12-alpine
# Layer 2: Telling Docker to create a directory called `/frontend` in the container and set it as the working directory.
WORKDIR /frontend

# Layer 3: Copying the package.json file from the root of the project to the `frontend` directory in the container.
COPY ./package.json ./
COPY ./package-lock.json ./

# Layer 4: Installing the dependencies listed in the package.json file.
RUN npm i --force
# RUN NODE_ENV=development npm i --force

# Layer 5: Copying all the files from the root of the project to the `/frontend` directory in the container.
COPY . .

# Layer 6: Telling Docker that the container will listen on port 3000.
EXPOSE 3000

# Layer 7: Telling Docker to run the `npm start` command when the container is started.
CMD [ "npm", "start" ]
