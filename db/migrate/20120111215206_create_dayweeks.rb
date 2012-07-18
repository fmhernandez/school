# -*- encoding : utf-8 -*-
class CreateDayweeks < ActiveRecord::Migration
  def self.up
    create_table :dayweeks do |t|
      t.string :dayname
      t.string :abbreviation

      t.timestamps
    end
    Dayweek.create :dayname=>"Monday", :abbreviation=>"Mon"
    Dayweek.create :dayname=>"Tuesday", :abbreviation=>"Tue"
    Dayweek.create :dayname=>"Wednesday", :abbreviation=>"Wed"    
    Dayweek.create :dayname=>"Thursday", :abbreviation=>"Thu"  
    Dayweek.create :dayname=>"Friday", :abbreviation=>"Fri"      
    Dayweek.create :dayname=>"Saturday", :abbreviation=>"Sat"        
    Dayweek.create :dayname=>"Sunday", :abbreviation=>"Sun"            
    
  end

  def self.down
    drop_table :dayweeks
  end
end
