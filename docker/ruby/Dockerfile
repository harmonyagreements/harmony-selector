FROM ruby:2.3.1


###############################################################################
# Base Software Install
###############################################################################

ARG PROGREDIOR_NODE_VERSION=10

# Add Node Remote
RUN curl -sL https://deb.nodesource.com/setup_$PROGREDIOR_NODE_VERSION.x | bash -

# Add Yarn Remote
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && apt-get install -y \
  build-essential \
  git \
  locales \
  netcat \
  nodejs \
  sudo \
  vim \
  yarn

###############################################################################
# Railsdock non-root user
###############################################################################

ARG UID
ENV UID $UID
ARG GID
ENV GID $GID
ARG USER=ruby
ENV USER $USER

RUN groupadd -g $GID $USER && \
  useradd -u $UID -g $USER -m $USER && \
  usermod -p "*" $USER && \
  usermod -aG sudo $USER && \
  echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers.d/50-$USER

###############################################################################
# Ruby, Rubygems, and Bundler Defaults
###############################################################################

ENV LANG C.UTF-8

# Point Bundler at /gems. This will cause Bundler to re-use gems that have already been installed on the gems volume
ENV BUNDLE_PATH /gems
ENV BUNDLE_HOME /gems

# Increase how many threads Bundler uses when installing. Optional!
ENV BUNDLE_JOBS 20

# How many times Bundler will retry a gem download. Optional!
ENV BUNDLE_RETRY 5

# Where Rubygems will look for gems, similar to BUNDLE_ equivalents.
ENV GEM_HOME /gems
ENV GEM_PATH /gems

# Add /gems/bin to the path so any installed gem binaries are runnable from bash.
ENV PATH /gems/bin:$PATH

###############################################################################
# Optional Software Install
###############################################################################

#------------------------------------------------------------------------------
# Postgres Client:
#------------------------------------------------------------------------------

ARG INSTALL_PG_CLIENT=false

RUN if [ "$INSTALL_PG_CLIENT" = true ]; then \
  # Install the pgsql client
  apt-get install -y postgresql-client \
;fi

###############################################################################
# Final Touches
###############################################################################

RUN mkdir -p "$GEM_HOME" && chown $USER:$USER "$GEM_HOME"

RUN mkdir -p /app
WORKDIR /app

RUN mkdir -p node_modules && chown $USER:$USER node_modules

USER $USER

RUN gem install bundler -v 1.17.3
