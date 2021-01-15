# GQL Server #

This project is to explore setting up graphql on expressjs. The goal is to create backend interfaces for Redis, Postgres, Wordpress & MongoDB. Its a work in progress as a personal project for now. 

Currently GQL is not setup yet. This current build includes the following:

- ESLint setup
- prettier setup
- includes .nvmrc
- Typescript setup
- A basic express app with json output

## Prerequisites ##
- installation of yarn
- usage and installation of node verion defined in `.nvmrc`
- create an `.env` file at root level with a port to serve express if a different one is needed

## To run the app ##
1. at root where the package.json file lives run `yarn install`
2. then run `yarn start`

You should then see a hello world message in json output.

## WIP ##
Currently setting up sample postgres database to use for GQL data source.
to test connnection and return some sample user data run `node -e 'require("./server/datasource/console")("./server/datasource/postgres/postgres.handler")'` from within the project root onn the command line.