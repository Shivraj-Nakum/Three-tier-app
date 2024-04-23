
# Cloud-IA-2 Three-Tier Application

  

This project demonstrates a three-tier application using Docker, MySQL, Node.js, and Nginx.


## Getting Started

  

1. Clone this repository.

2. Run `docker-compose up --build` in the root directory.

3. Access the frontend at `http://localhost`.

4. Access the backend at `http://localhost:3000`.

5. Access the database using a MySQL client with the credentials defined in `db/Dockerfile`.

  

## Services

  

-  **Database**: MySQL database running on port 3306.

-  **Backend**: Node.js application running on port 3000.

-  **Frontend**: Static files served by Nginx on port 80.

  

# Dockerfile Explanation

  
  

## Dockerfile Explanation for backend

  

-  `FROM node:14`

> This line specifies the base image for the Docker container. It uses the official Node.js image with the tag `14`, which means it's using Node.js version 14.

  

-  `WORKDIR /usr/src/app`

>Sets the working directory inside the container to `/usr/src/app`. All subsequent commands will be run from this directory.

  

-  `COPY package*.json ./`

>Copies the `package.json` and `package-lock.json` files from your project into the working directory of the container. These files are necessary for installing the project's dependencies.

  

-  `RUN npm install`

>Installs the project's dependencies as specified in `package.json` and `package-lock.json`.

  

-  `COPY . .`

>Copies the rest of your project's files into the working directory of the container. This includes your application's source code.

  

-  `EXPOSE 3000`

>Informs Docker that the container listens on the specified network port at runtime. In this case, it's port 3000.

  

-  `CMD [ "node", "server.js" ]`

>Specifies the command to run your application. In this case, it's running `node server.js`, which starts your Node.js application.

  

## Dockerfile Explanation for frontend

  

-  `FROM nginx:alpine`

>This line specifies the base image for the Docker container. It uses the official Nginx image with the tag `alpine`, which is a lightweight version of Nginx.

  

-  `COPY index.html /usr/share/nginx/html/index.html`

>Copies the `index.html` file from your project into the Nginx server's default HTML directory. This is the main HTML file that will be served by Nginx.

  

-  `COPY style.css /usr/share/nginx/html/style.css`

>Copies the `style.css` file from your project into the Nginx server's default HTML directory. This CSS file will be used to style the HTML page.

  

-  `COPY script.js /usr/share/nginx/html/script.js`

>Copies the `script.js` file from your project into the Nginx server's default HTML directory. This JavaScript file can be used to add interactivity to the HTML page.

  

-  `COPY nginx.conf /etc/nginx/conf.d/default.conf`

>Copies a custom Nginx configuration file (`nginx.conf`) from your project into the Nginx server's configuration directory. This allows you to customize the behavior of the Nginx server.

  

-  `EXPOSE 80`

>Informs Docker that the container listens on the specified network port at runtime. In this case, it's port 80, which is the default port for HTTP.

  

-  `CMD ["nginx", "-g", "daemon off;"]`

>Specifies the command to run Nginx in the foreground. This is necessary for Docker containers to keep running.

  

## Dockerfile Explanation for database 

  

-  `FROM mysql:5.7`

>This line specifies the base image for the Docker container. It uses the official MySQL image with the tag `5.7`, which is MySQL version 5.7.

  

-  `ENV MYSQL_ROOT_PASSWORD=rootpassword`

>Sets an environment variable `MYSQL_ROOT_PASSWORD` to `rootpassword`. This is the password for the MySQL root user.

  

-  `ENV MYSQL_DATABASE=mydatabase`

>Sets an environment variable `MYSQL_DATABASE` to `mydatabase`. This is the name of the default database that will be created when the container is started.

  

-  `ENV MYSQL_USER=myuser`

>Sets an environment variable `MYSQL_USER` to `myuser`. This is the name of the default user that will be created when the container is started.

  

-  `ENV MYSQL_PASSWORD=mypassword`

>Sets an environment variable `MYSQL_PASSWORD` to `mypassword`. This is the password for the default user that will be created when the container is started.

  

-  `COPY init.sql /docker-entrypoint-initdb.d/`

>Copies the `init.sql` file from your project into the `/docker-entrypoint-initdb.d/` directory in the container. This directory is used by the MySQL Docker image to execute SQL scripts when the container is started for the first time. The `init.sql` file can contain SQL commands to initialize your database, such as creating tables or inserting data.

  
## Docker Hub
 - https://hub.docker.com/repository/docker/shivraj03/cloud_ia-2_three_tier_app-frontend/general
 - https://hub.docker.com/repository/docker/shivraj03/cloud_ia-2_three_tier_app-backend/general
 - https://hub.docker.com/repository/docker/shivraj03/cloud_ia-2_three_tier_app-db/general

  

## License 

This project is licensed under the MIT License.