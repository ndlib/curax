# Curax

[CurateND](https://curate.nd.edu) on [Hyrax](http://github.com/samvera/hyrax/). RAWR!

## Secret Management

Instead of the Rails convention of config/secrets.yml, Curax leverages [Figaro](https://github.com/laserlemon/figaro).

There are two primary files for Figaro:

* [config/application.yml](./config/application.yml)
* [config/initializers/figaro_required_env_variables.rb](./config/initializers/figaro_required_env_variables.rb)

**NOTE: These files are checked into the repository, so do not include any "live" values of sensitive nature (e.g. passwords).**
You will need to add those values to the associated secrets repository. See [scripts/update_secrets.sh](./scripts/update_secrets.sh) for details on adding those secrets.

## Running Locally

1. Install Postres (assumes [Homebrew](https://brew.sh/))

    ```console
    $ brew install postgres
    ```

2. Install Ruby 2.4.2 (required by .ruby-version file)

    ```console
    $ rbenv install 2.4.2
    ```

3. Install bundler

    ```console
    $ gem install bundler
    ```

4. Install bundled gems

    ```console
    $ bundle install
    ```

5. Create the Postgres database (if necessary):

    ```console
    $ bundle exec rake db:create
    ```

6. Ensure up to date database scheme:

  - Start fresh (deleting all application database records)

    ```console
    $ bundle exec rake db:schema:load
    ```

  - Incremental update (preserving application database records)

    ```console
    $ bundle exec rake db:migrate
    ```

7. Start the Fedora and SOLR server; This will download both as needed.

    ```console
    $ bundle exec rake hydra:server
    ```

8. Open your favorite browser and go to http://localhost:3000
