FROM ruby:2.6.6-alpine

RUN apk update && apk upgrade && apk add --update --no-cache nano build-base tzdata postgresql-dev

ENV LANG=C.UTF-8
ENV RAILS_ROOT /app
RUN mkdir -p $RAILS_ROOT
WORKDIR $RAILS_ROOT

COPY ./bundle.sh /
RUN dos2unix /bundle.sh
RUN chmod +x /bundle.sh
ENTRYPOINT ["/bundle.sh"]

ENV BUNDLE_PATH=/bundle \
    BUNDLE_BIN=/bundle/bin \
    GEM_HOME=/bundle
ENV PATH="${BUNDLE_BIN}:${PATH}"


EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
