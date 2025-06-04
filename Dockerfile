FROM n8nio/n8n:latest

# Instalar tini para manejo de procesos
USER root
RUN apk add --no-cache tini

# Variables de entorno
ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=10000
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_USER_MANAGEMENT_DISABLED=true

# Crear directorio de datos y configurar permisos
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n && \
    chmod 755 /home/node/.n8n

# Cambiar a usuario node
USER node

# Exponer puerto
EXPOSE 10000

# Configurar entrypoint y comando
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]
