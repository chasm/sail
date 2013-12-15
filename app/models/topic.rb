class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  before_save :set_slug

  belongs_to :user
  embeds_many :notes

  field :id
  field :title
  field :slug

  validates :title, :user_id, presence: true
  validates :title, uniqueness: true

  private

  def set_slug
    self.slug = self.title.downcase.gsub(/ /, '_')
  end
end