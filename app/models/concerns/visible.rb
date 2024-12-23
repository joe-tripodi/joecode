
module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = [ "draft", "published", "archived" ]

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: "published").count
    end
  end

  def archived?
    status == "archived"
  end
end
