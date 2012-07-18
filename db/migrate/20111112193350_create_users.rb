# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :password
      t.string :description

      t.timestamps
    end
    User.create :name=>"Admin", :password=>"admin"
  end

  def self.down
    drop_table :users
  end
end
