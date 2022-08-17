class RepositoryEventsController < ApplicationController
  def index
  end

  def search
    repo_details = search_params
    github_response = helpers.get_repository_events(repo_details[:owner], repo_details[:repository])
    @filtered_data = helpers.filter(github_response, repo_details[:event_type])
  end

  private
  def search_params
    params.permit(:owner, :repository, :event_type)
  end
end
