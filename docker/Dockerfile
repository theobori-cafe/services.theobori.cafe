FROM klakegg/hugo:0.101.0-alpine as build

RUN apk add git

WORKDIR /src

COPY . .

ENV THEME themes/cupper-hugo-theme

RUN rm -rf ${THEME} && \
    git clone https://github.com/zwbetz-gh/cupper-hugo-theme.git ${THEME}

RUN hugo

FROM nginx:latest as run

COPY --from=build /src/public/ /usr/share/nginx/html/
COPY ./docker/nginx/default.conf /etc/nginx/conf.d/default.conf
