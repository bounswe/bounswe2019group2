FROM node:12.11.0

# Install requirements specific to production
RUN npm install -g serve

WORKDIR /app

ENV PATH /app/node_modules/.bin:$PATH
ENV NODE_OPTIONS --max_old_space_size=4096

COPY package.json /app/package.json
RUN npm install

ADD . /app

RUN npm run-script build

CMD serve -s build -l 5000

EXPOSE 5000
