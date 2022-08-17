# frozen_string_literal: true

require 'rails_helper'

describe EventFilter do
  describe '#filter' do
    it 'returns matching events and ignores events that do not match' do
      content = file_fixture('events.json').read
      json_data = JSON.parse(content)

      filtered_data = helper.filter(json_data, "PushEvent")

      expect(filtered_data.size).to equal 1
      expect(filtered_data.first['id']).to eq '2'
    end
  end
end
