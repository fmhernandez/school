# -*- encoding : utf-8 -*-
class CreateStudents < ActiveRecord::Migration
  def self.up
    create_table :students do |t|
      t.string :name
      t.string :surname1
      t.string :surname2
      t.string :email
      t.string :phone1
      t.string :phone2

      t.timestamps
    end
    Student.create :name=>"Fernando", :surname1=>"Sanchez", :surname2=>"Perez", :email=>"fsanchez@hotmail.com", :phone1=>"91-234-65-78", :phone2=>"623-12-89"    
    Student.create :name=>"Ana", :surname1=>"Jimenez", :surname2=>"Sanz", :email=>"ajsanz@gmail.com", :phone1=>"91-289-32-18", :phone2=>"679-23-11"        
    Student.create :name=>"Veronica", :surname1=>"Santos", :surname2=>"Santos", :email=>"asantos@gmail.com", :phone1=>"91-389-12-99", :phone2=>"679-34-90-02"            
  end

  def self.down
    drop_table :students
  end
end
