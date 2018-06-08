class TvShow < ActiveRecord::Base
  belongs_to :user
  has_many :episodes
  has_many :ranks

  validates :title, uniqueness: true
  validates :title, presence: true

  def to_json(_)
    ep = []
    episodes.each do |e|
      ep << {id: e.id, title: e.title}
    end

    JSON.generate({
      id: id,
      title: title,
      episodes: ep
    })
  end
end
