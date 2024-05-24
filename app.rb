# frozen_string_literal: true

require 'sinatra'
require 'prometheus/client'
require 'prometheus/client/formats/text'

require_relative 'metrics'

# class
class App < Sinatra::Base

  Prometheus::Client.registry.gauge(:devops_test_metrics, docstring: 'test', labels: %i[project])

  get '/' do
    "<h1>Customized Exporter</h1></br><a href='metrics'>Metrics</a>"
  end

  get '/metrics', provides: 'text/plain' do
    gauge = Prometheus::Client.registry.get(:devops_test_metrics)
    metrics_value = Metrics.new.values
    gauge.set(metrics_value, labels: { project: 'project_101' })
    Prometheus::Client::Formats::Text.marshal(Prometheus::Client.registry)
  end
end
