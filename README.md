# Curax

[CurateND](https://curate.nd.edu) on [Hyrax](http://github.com/samvera/hyrax/). RAWR!

## Running Locally

1. Install Postres (assumes [Homebrew](https://brew.sh/))

    ```console
    $ brew postgres
    ```

2. Install bundler

    ```console
    $ gem install bundler
    ```

3. Install bundled gems

    ```console
    $ bundle install
    ```

4. Create the Postgres database (if necessary):

    ```console
    $ bundle exec rake db:create
    ```

5. Ensure up to date database scheme:

  - Start fresh (deleting all application database records)

    ```console
    $ bundle exec db:schema:load
    ```

  - Incremental update (preserving application database records)

    ```console
    $ bundle exec db:migrate
    ```

6. Start the Fedora and SOLR server; This will download both as needed.

    ```console
    $ bundle exec rake hydra:server
    ```

7. Open your favorite browser and go to http://localhost:3000
