# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [0.2.7] - 2017-05-16
### [Fixed]
- Change method encode base 64, use strict instead of urlsafe
- Use Hash response with symbol
- Refractoring response
- ~~Fix json response~~

## [0.2.6] - 2017-04-24
### [Fixed]
- Refractoring send_command

### [Added]
- Add spec test
- Add response obect for send_command

## [0.2.5] - 2017-04-11
### [Added]
- Method for listing all events compatible with gem

### [Fixed]
- Response body is empty return 204

## [0.2.4] - 2017-04-05
### [Fixed]
- Format response

## [0.2.3] - 2017-04-04
### [Added]
- Command push_stream

### [Fixed]
- Model use acronym for DASH and HLS

## [0.1.2] - 2017-03-14
### [Fixed]
- Save configuration evostream in model

## [0.1.1] - 2017-03-13
### [Fixed]
- Path gem
- Spec execution with rake
- Cleanning initializer

### [Added]
- Spec for requests event

## [0.1.0] - 2017-03-10
### [Added]
- Create event InStreamCreated InStreamClosed and OutStreamCreated
- Send event with command automaticaly
- Configure DSL service
