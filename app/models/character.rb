class Character < ActiveRecord::Base

  belongs_to :television_show


  validates :role, presence: true
  validates :actor, presence: true

  validates :role, uniqueness: { scope: :television_show }

end
