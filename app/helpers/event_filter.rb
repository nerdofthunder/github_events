# frozen_string_literal: true

module EventFilter
  def filter(json, event_type)
    json.filter do |event|
      event['type'] == event_type
    end
  end
end
