FROM nginx:1.27-alpine

# Serve the project as a static site for Hugging Face Spaces (port 7860).
COPY index.html /usr/share/nginx/html/index.html

# Spaces expects the app to listen on port 7860.
RUN sed -i 's/listen       80;/listen       7860;/' /etc/nginx/conf.d/default.conf \
    && sed -i 's/listen  \[::\]:80;/listen  [::]:7860;/' /etc/nginx/conf.d/default.conf

EXPOSE 7860

CMD ["nginx", "-g", "daemon off;"]
