# Curax

[CurateND](https://curate.nd.edu) on [Hyrax](http://github.com/samvera/hyrax/). RAWR!

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
