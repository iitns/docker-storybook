# Select reference image
FROM node:16

# This is optional. Sets the level of logging that you see
ENV NPM_CONFIG_LOGLEVEL warn

# Install @vue/cli
RUN npm install -g @vue/cli

RUN rm -rf /usr/src/app
RUN cd /usr/src && vue create -p "__default_vue_3__" app

# Create app directory
WORKDIR /usr/src/app

# Copy project files into the docker image
COPY . .

# Install app dependencies
RUN npm set progress=false && npm install

# Install Storybook
RUN npx sb init

# Make port 6006 available
EXPOSE 6006

# run storybook app
CMD ["npm", "run", "storybook"]

