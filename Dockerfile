FROM ruby:onbuild
ENV RAILS_ENV production
ENV SECRET_KEY_BASE a7adfd5a101d5a5d395e9c4a06fbf0aa59a464fc838a7b2cc54c655138949ea8911e4821cd0f3d93adaeb0033dc87f9f2f4f31b802a849a9be62e61f1212a35d
EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0", "-p", "3000"]
