#!/usr/bin/env puma
# frozen_string_literal: true

# threads 1, 1
port 9292
workers 1 if RbConfig::CONFIG['host_os'] =~ /linux/i
preload_app!
# plugin 'metrics'
