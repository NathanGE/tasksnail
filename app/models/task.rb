class Task < ActiveRecord::Base
  belongs_to :user

  scope :complete, -> { where(complete: true) }
  scope :incomplate, -> { where(complete: nil) }

  def mark_complete!
    self.update_attribue(:complete, true)
  end
end
