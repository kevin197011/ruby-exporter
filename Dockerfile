FORM ruby:3.0.0

COPY . /srv/app
WORKDIR /srv/app
RUN bundle install

EXPOSE 9292

CMD ["bundle", "exec", "unicorn", "-p", "9292", "-c", "unicorn.conf"]