class Task < ApplicationRecord
    validates :title, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true

    validates :memo, length: { maximum: 30 }

    validate :start_end_check

    validate :start_check

    def start_end_check
      return if start_date.blank? || end_date.blank?
      errors.add(:end_date, "は開始日より前の日付は登録できません。") if self.end_date < self.start_date
    end
    end

    def start_check
      return if start_date.blank?
      errors.add(:start_date, "は今日以降のものを選択してください") if start_date < Date.today
    end
