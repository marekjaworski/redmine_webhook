module RedmineWebhook
  class TimelogWrapper
    def initialize(time_entry)
      @time_entry = time_entry
    end

    def to_hash
      {
        :id => @time_entry.issue_id,
        :created_on => @time_entry.created_on,
        :hours => @time_entry.hours,
	      :comment => @time_entry.comments,
	      :project => RedmineWebhook::ProjectWrapper.new(@time_entry.project).to_hash,
        :user => RedmineWebhook::AuthorWrapper.new(@time_entry.user).to_hash
      }
    end
  end
end
