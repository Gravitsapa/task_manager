class Task < ActiveRecord::Base
  belongs_to :project

  def completed?
    !status.blank?
  end
end
