# -*- encoding : utf-8 -*-
class CreateLounges < ActiveRecord::Migration
  def self.up
    create_table :lounges do |t|
      t.string :name
      t.string :description
      t.integer :center_id

      t.timestamps
    end
  end

  def self.down
    drop_table :lounges
  end
end
