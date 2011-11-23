class Post < ActiveRecord::Base
  validates :name, presence: true
  validates :body, presence: true

  def to_s
    name
  end

  def self.recent(count)
    self.order('created_at desc').limit(count)
  end
end
