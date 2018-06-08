class Rank < ActiveRecord::Base
  belongs_to :user
  belongs_to :tv_show

  validates_uniqueness_of :user_id, scope: :tv_show_id

  after_save do
    tv_show_id = self.tv_show.id
    ranks = Rank.where(tv_show_id: tv_show_id).pluck(:value)
    rank = ranks.inject{ |sum, el| sum + el } / ranks.size
    tv_show.update_attribute(:rank, rank)
  end
end
