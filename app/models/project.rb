class Project < ActiveRecord::Base
  before_create :create_slug
  before_update :create_slug

  validates :name, presence: true
  validates :body, presence: true

  def to_s
    name
  end

  def to_param
    "#{ id }-#{ self.slug }"
  end

  private

  def create_slug
    self.slug = self.name.parameterize
  end
end
