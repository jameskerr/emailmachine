class Template < ActiveRecord::Base
  attr_accessible :name, :selected, :asset_host

  def self.current
  	where(selected: true).first
  end

  def self.current=(template)
  	template.update_attribute(:selected, true)
  	Template.where(selected: true).each do |t|
  		t.update_attribute(:selected, false) unless t.id == template.id
  	end
  end

end
