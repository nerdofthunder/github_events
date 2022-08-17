# frozen_string_literal: true

require 'excon'

module RepositoryEventsHelper
  GITHUB_ENDPOINT = 'https://api.github.com/repos'

  ACCEPT = 'application/vnd.github+json'
  USER_AGGENT = 'github-events'
  PER_PAGE = 100

  def get_repository_events(owner, repo, page = 1)
    response = Excon.get("#{GITHUB_ENDPOINT}/#{owner}/#{repo}/events",
                         headers: { 'accept' => ACCEPT, 'user-agent' => USER_AGGENT },
                         query: { per_page: PER_PAGE, page: })
    JSON.parse(response.body)
  end

  def filter(json, event_type)
    json.filter do |event|
      event['type'] == event_type
    end
  end
end
