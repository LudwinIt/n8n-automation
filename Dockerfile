FROM n8nio/n8n:latest

ENV N8N_HOST=0.0.0.0
ENV N8N_PORT=10000
ENV N8N_PROTOCOL=https
ENV NODE_ENV=production
ENV N8N_ENCRYPTION_KEY=mysecretkey123456789
ENV N8N_USER_MANAGEMENT_DISABLED=true

USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

EXPOSE 10000

CMD ["tini", "--", "n8n", "start"]
