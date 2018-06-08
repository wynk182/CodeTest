class User < ApplicationRecord
  after_create :set_age

  def set_age
    # birth_date = self.birth_date
    now = Time.now.utc.to_date
    update(age: (
      now.year - birth_date.year - ((now.month > birth_date.month || (now.month == birth_date.month && now.day >= birth_date.day)) ? 0 : 1)
    ))
  end
end