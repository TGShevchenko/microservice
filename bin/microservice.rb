#!/usr/bin/env ruby
require_relative '../config/setup'
require 'sneakers/runner'
require 'logger'
require 'mailer'
require 'httplog'

Sneakers.configure(
  amqp: SETTINGS['amqp_url'],
  daemonize: false,
  log: STDOUT
)
Sneakers.logger.level = Logger::INFO
Httplog.options[:log_headers] = true

Sneakers::Runner.new([Microservice]).run