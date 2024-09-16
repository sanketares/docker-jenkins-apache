# Use the official Apache image from the Docker Hub
FROM httpd:2.4

# Copy the HTML files to the Apache server's default directory
COPY html/ /usr/local/apache2/htdocs/

# Expose port 80
EXPOSE 80
