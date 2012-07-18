# -*- encoding : utf-8 -*-
class CreateTeachers < ActiveRecord::Migration
  def self.up
    create_table :teachers do |t|
      t.string :dni
      t.string :name
      t.string :surname1
      t.string :surname2
      t.string :phone1
      t.string :phone2
      t.string :address
      t.timestamps
    end
    Teacher.create :dni=>"12334578G", :name=>"Pedro", :surname1=>"Lopez", :surname2=>"Martinez", :phone1=>"663-23-12-54", :address=>"C/ del pez n 27 3A"
    Teacher.create :dni=>"34589201G", :name=>"Luisa", :surname1=>"Montero", :surname2=>"Roman", :phone1=>"623-14-23-11", :address=>"Plza. Anton Martin 1 1A"    
    Teacher.create :dni=>"22356712G", :name=>"Ana", :surname1=>"Pi", :surname2=>"Cambo", :phone1=>"221-65-43-67", :address=>"C/ Gran via de Hortaleza n 3"
  end

  def self.down
    drop_table :teachers
  end
end
