class ChangeRankToFloat < ActiveRecord::Migration
  def change
    change_column :tv_shows, :rank, :float
  end
end
