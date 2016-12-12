class Listing < ActiveRecord::Base
  validates :title, :description, :user_id, presence: true
  validate :end_date_greater_than_start_date

  belongs_to :user

  private

  def end_date_greater_than_start_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:date, "range not correct!")
    end
  end
end
