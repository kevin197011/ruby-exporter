# frozen_string_literal: true

require 'sinatra'
require 'prometheus/client'
require 'prometheus/client/formats/text'

require_relative 'metrics'

# class
class Application < Sinatra::Base
  get '/' do
    "<h1>Customized Exporter</h1></br><a href='metrics'>Metrics</a>"
  end

  get '/metrics', provides: 'text/plain' do
    Prometheus::Client.registry.gauge(:devops_test_metrics, docstring: 'test', labels: [:project])
    gauge = Prometheus::Client.registry.get(:devops_test_metrics)
    gauge_value = Metrics.new.values
    gauge.set(gauge_value, labels: { project: 'project_101' })
    Prometheus::Client::Formats::Text.marshal(Prometheus::Client.registry)
  end
end
