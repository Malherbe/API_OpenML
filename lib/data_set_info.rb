# frozen_string_literal: true

require 'http'
require 'yaml'

config = YAML.safe_load(File.read('config/secrets.yml'))

def oml_api_path(path, config)
  "https://www.openml.org/api/v1/json/#{path}?api_key=#{config['OPENML_TOKEN']}"
end

def call_oml_url(url)
  HTTP.get(url)
end

oml_response = {}
oml_results = {}

data_info_url = oml_api_path('data/1', config)
oml_response[data_info_url] = call_oml_url(data_info_url)
data_info = oml_response[data_info_url]

oml_results['description'] = data_info['description']

oml_results['name'] = data_info['name']

oml_results['format'] = data_info['format']

oml_results['tag'] = data_info['tag']

oml_results['original_data_url'] = data_info['original_data_url']

File.write('spec/fixtures/oml_results.yml', oml_results.to_yaml)