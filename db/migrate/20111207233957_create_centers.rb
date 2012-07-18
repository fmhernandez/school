# -*- encoding : utf-8 -*-
class CreateCenters < ActiveRecord::Migration
  def self.up
    create_table :centers do |t|
      t.string :name
      t.string :address
      t.string :description

      t.timestamps
    end
    Center.create :name=>"Madrid", :address=>"C/ Alcala n 12"
    Center.create :name=>"Barcelona", :address=>"Avd. Diagonal n 217"
    Center.create :name=>"Sevilla", :address=>"C/ Luis Montoto n 100"
  end

  def self.down
    drop_table :centers
  end
end
