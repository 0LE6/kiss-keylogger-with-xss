FROM nginx:alpine

COPY default.conf /etc/nginx/conf.d/default.conf

COPY /Intranet_Institut_Montilivi_files /usr/share/nginx/html/Intranet_Institut_Montilivi_files

COPY index_monti.html /usr/share/nginx/html/index_monti.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
