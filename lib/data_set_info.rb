# frozen_string_literal: true

require 'careerjet/api_client'
# require 'http'
require 'yaml'

# config = YAML.safe_load(File.read('config/secrets.yml'))

# def oml_api_path(path, config)
#   "https://www.openml.org/api/v1/json/#{path}?api_key=#{config['OPENML_TOKEN']}"
# end

# def call_oml_url(url)
#   HTTP.get(url)
# end

 oml_response = {}
oml_results = {}

# ## HAPPY DATA INFO REQUEST
# data_info_url = oml_api_path('data/1', config)
# oml_response[data_info_url] = call_oml_url(data_info_url)
# data_info = JSON.parse(oml_response[data_info_url].body.to_s)

# oml_results['name'] = data_info['data_set_description']['name']

# oml_results['description'] = data_info['data_set_description']['description']

# oml_results['format'] = data_info['data_set_description']['format']

# oml_results['tag'] = data_info['data_set_description']['tag']

# oml_results['original_data_url'] = data_info['data_set_description']['original_data_url']

# ## BAD DATA INFO REQUEST
# bad_data_info_url = oml_api_path('data/99999999', config)
# oml_response[bad_data_info_url] = call_oml_url(bad_data_info_url)
# JSON.parse(oml_response[data_info_url].body.to_s)


cj_api_client = Careerjet::APIClient.new(locale: :en_GB)
oml_results = cj_api_client.search(
  keywords: 'ruby',
  location: 'london',
  affid: '213e213hd12344552',
  user_ip: '11.22.33.44',
  user_agent: 'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0',
  url: 'http://www.example.com/jobsearch?q=ruby&l=london'
)

File.write('spec/fixtures/oml_results.yml', oml_results.to_yaml)