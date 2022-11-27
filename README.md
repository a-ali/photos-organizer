# Photo Organizer

## Ruby Version
3.1.3

## Install

### Using Docker
  - Install Docker
    - Docker: https://docs.docker.com/engine/install
    - Check the Post-Installation Steps if you are on Linux https://docs.docker.com/engine/install/linux-postinstall/

  - Make sure that **git** is installed **and configured**:
    ```bash
      sudo apt install git
      git config --global user.email "your.email@some.domain"
      git config --global user.name "Your Name"
    ```

  - Build the container:
    ```
      git clone git@github.com:a-ali/photos-organizer.git
      cd photos-organizer
      echo APP_USER_ID=`id -u` >> .env
      docker compose up -d
    ```

  - Add the input to `files/photos.txt`
    ```bash
      cp files/photos.example.txt files/photos.txt
    ```

  - Run the `main.rb` script:
    ```bash
      docker container exec photos-organizer bundle exec ruby main.rb
    ```

### Without Docker
  - Install the target Ruby version.
  - Clone the Repo:
    ```bash
      git clone git@github.com:a-ali/photos-organizer.git
    ```
  - Install the dependencies:
    ```bash
      cd photos-organizer
      bundle install
    ```
  - Add the input to `files/photos.txt`
    ```bash
      cp files/photos.example.txt files/photos.txt
    ```
  - Run the `main.rb` script:
    ```bash
      ruby main.rb
    ```

## To run the specs use:
```bash
  docker container exec photos-organizer bin/rspec
```

## TODOs
  - [ ] Organize the Gemfile in groups
  - [ ] RDoc
  - [ ] Overcommit
