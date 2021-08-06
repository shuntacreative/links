class AddSelfIntroductionToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :my_introduction, :text
  end
end
