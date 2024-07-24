FROM klakegg/hugo:0.101.0-alpine AS build

WORKDIR /src

COPY . .

RUN \
  apk add --no-cache git && \
  rm -rf themes/cupper-hugo-theme && \
  git clone https://github.com/zwbetz-gh/cupper-hugo-theme.git themes/cupper-hugo-theme && \
  hugo

FROM linuxserver/nginx:1.26.1

COPY  --from=build /src/public /config/www
