require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the RepositoryEventsHelper. For example:
#
# describe RepositoryEventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe RepositoryEventsHelper, type: :helper do
  describe '#get_repository_events' do
    it 'calls Excon get' do
      # TODO: This currently reaches out to the actual github api.
      # Tests should not be dependent on external services.
      # Considder using VCR, or mocks to decouple.
      response = helper.get_repository_events('rubocop', 'rubocop-rails', 1)

      expect(response[0]['id']).not_to be_empty
    end
  end

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
