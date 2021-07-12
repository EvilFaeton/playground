# syntax=docker/dockerfile:1
FROM ruby:2.6
RUN apt-get update -qq && apt-get install -y postgresql-client


# Node.js
ENV NODE_VERSION=14.x
RUN set -xe; \
	# Node.js repo
	curl -fsSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -; \
	echo "deb https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee /etc/apt/sources.list.d/nodesource.list; \
	echo "deb-src https://deb.nodesource.com/node_${NODE_VERSION} jessie main" | tee -a /etc/apt/sources.list.d/nodesource.list; \
	# yarn repo
	curl -fsSL https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -; \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list; \
	apt-get update >/dev/null; \
	apt-get -y --no-install-recommends install >/dev/null \
		nodejs \
		yarn \
	;\
	apt-get clean; rm -rf /var/lib/apt/lists/*;



WORKDIR /app
COPY Gemfile /app/Gemfile
COPY Gemfile.lock /app/Gemfile.lock
RUN bundle install
RUN yarn install



# Add a script to be executed every time the container starts.
COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh
ENTRYPOINT ["start.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]

