class Topic
  include Mongoid::Document
  include Mongoid::Timestamps

  belongs_to :user
  embeds_many :notes

  field :id
  field :title

  validates :title, :user_id, presence: true
  validates :title, uniqueness: true
end