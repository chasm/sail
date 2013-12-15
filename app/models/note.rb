class Note
  include Mongoid::Document
  include Mongoid::Timestamps

  embedded_in :topic

  field :id
  field :title
  field :content
  field :user_name
  field :user_id

  validates :title, :content, :user_name, :user_id, presence: true
  validates :title, uniqueness: { scope: :topic }
end