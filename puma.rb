#!/usr/bin/env puma
# frozen_string_literal: true

# threads 1, 1
port 9292
workers 1
preload_app!
# plugin 'metrics'
