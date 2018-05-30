class Episode < ActiveRecord::Base
  belongs_to :tv_show
  before_create :set_episode_number

  validates_uniqueness_of :title, scope: :tv_show_id
  validates :title, presence: true

  def set_episode_number
    last_number = self.tv_show.episodes.last.try(:episode)
    last_number == nil ? self.episode = 1 : self.episode = last_number + 1
  end
end
