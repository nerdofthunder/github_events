# frozen_string_literal: true

require 'rails_helper'

describe GithubApiClient do
  describe '#get' do
    it 'calls Excon get' do
      # TODO: This currently reaches out to the actual github api.
      # Tests should not be dependent on external services.
      # Considder using VCR, or mocks to decouple.
      response = helper.get('rubocop', 'rubocop-rails', 1)
      
      expect(response[0]['id']).not_to be_empty
    end
  end
end
