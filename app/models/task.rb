class Task < ApplicationRecord
  belongs_to :project

  def completed?
    !status.blank?
  end
end
