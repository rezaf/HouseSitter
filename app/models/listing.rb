class Listing < ActiveRecord::Base
  validates :title, :description, :user_id, presence: true
  validate :start_date_not_later_than_end_date

  belongs_to :user

  private

  def start_date_not_later_than_end_date
    if start_date.present? && end_date.present? && start_date > end_date
      errors.add(:date, "range not correct!")
    end
  end
end
