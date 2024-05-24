# frozen_string_literal: true

# class
class Metrics
  def values
    rand(1000)
  end

  private

  def config
    YAML.load_file('config.yml')
  end
end
