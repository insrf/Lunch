module WorkWithDate
  extend ActiveSupport::Concern

  module ClassMethods
    def today
      where("created_at::date = ?",Time.now.to_date)
    end
  end
end
