FROM ruby:3.1.3-alpine3.16

ARG APP_USER_ID
ENV APP_USER             photos-organizer
ENV PROJECT_DIRECTORY    photos-organizer
ENV USER_HOME_DIRECTORY  /home/${APP_USER}
ENV APP_PATH             ${USER_HOME_DIRECTORY}/${PROJECT_DIRECTORY}
ENV BUNDLED_GEMS_PATH    ${APP_PATH}/.bundle
ENV BUNDLE_APP_CONFIG    ${BUNDLED_GEMS_PATH}
ENV BUNDLE_BIN           ${BUNDLED_GEMS_PATH}/bin
ENV BUNDLE_PATH          ${BUNDLED_GEMS_PATH}
ENV PATH ${BUNDLE_BIN}:${PATH}

# Upgrade packages.
RUN apk --no-cache --available upgrade

# Install system dependencies required both at runtime and build time.
RUN apk add --no-cache build-base git vim openssh bash-completion curl gnupg

WORKDIR ${USER_HOME_DIRECTORY}

RUN adduser -s /bin/bash -u ${APP_USER_ID} -h ${USER_HOME_DIRECTORY} -D ${APP_USER} && \
  mkdir -p ${APP_PATH} ${BUNDLED_GEMS_PATH} && \
  chown -R ${APP_USER}:${APP_USER} ${APP_PATH} ${BUNDLED_GEMS_PATH}

# Copy entrypoint to docker home directory
COPY docker/entrypoint.sh ${USER_HOME_DIRECTORY}/entrypoint.sh
RUN chmod +x ${USER_HOME_DIRECTORY}/entrypoint.sh

# Save IRB Console's history
RUN echo -e "require 'irb/ext/save-history'\n\
  IRB.conf[:SAVE_HISTORY] = 500\n\
  IRB.conf[:HISTORY_FILE] = '${APP_PATH}/.irb-history'\n" >> ${USER_HOME_DIRECTORY}/.irbrc

COPY docker/bashrc ${USER_HOME_DIRECTORY}/.bashrc

USER ${APP_USER}
WORKDIR ${APP_PATH}

COPY --chown=${APP_USER} Gemfile .
COPY --chown=${APP_USER} Gemfile.lock .
