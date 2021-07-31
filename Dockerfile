FROM node:16.3 as BUILD

WORKDIR /var/www/app
COPY . .

# Preparing
RUN rm -rf node_modules

# Installing dependencies
RUN yarn global add node-prune
RUN npm install


# Cleaning image
RUN node-prune

# Actual image
FROM node:16.3-slim
WORKDIR /var/www/app
COPY --from=BUILD /var/www/app/ ./
COPY --from=BUILD /var/www/app/node_modules ./node_modules
COPY --from=BUILD /var/www/app/package.json ./


EXPOSE 8070

CMD ["node", "app.js"]