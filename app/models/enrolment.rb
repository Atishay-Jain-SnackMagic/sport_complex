class Enrolment < ApplicationRecord
  belongs_to :user
  belongs_to :batch

  validates :start_date, :end_date, presence: true, current_month: { allow_blank: true }
  validate :ensure_start_date_more_than_current_date, if: [ :start_date, :end_date ]
  validate :ensure_batch_is_active, if: :batch_id?
  validate :user_active_enrolments_does_not_clash, :user_unique_sport_at_a_location, if: [ :user_id?, :batch_id? ], on: :create
  validates :amount, numericality: { only_integer: true, greater_than: 0, allow_blank: true }

  before_create :set_amount, unless: :amount?

  private def ensure_start_date_more_than_current_date
    return if start_date < end_date

    errors.add(:start_date, 'should be more than the end date')
  end

  private def user_active_enrolments_does_not_clash
    return unless user.active_enrolments
      .joins(:batch)
      .where('(batches.start_time <= ? AND batches.end_time > ?) OR (batches.start_time < ? and batches.end_time >= ?)', batch.start_time.to_fs(:time), batch.start_time.to_fs(:time), batch.end_time.to_fs(:time), batch.end_time.to_fs(:time))
      .any?

    errors.add(:time, 'clashes with other enrolled batches')
  end

  private def user_unique_sport_at_a_location
    return unless user.active_enrolments
      .joins(:batch)
      .where(batch: { sports_location_id: batch.sports_location_id })
      .any?

    errors.add(:user, 'already enrolled at this location')
  end

  private def ensure_batch_is_active
    errors.add(:batch, 'is inactive') unless batch.sports_location.is_active?
  end

  private def set_amount
    self.amount = batch.amount
  end
end
