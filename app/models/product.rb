class Product < ActiveRecord::Base
  belongs_to :category
  has_many :line_items
  has_many :orders, through: :line_items

  validates_presence_of :category_id, :name, :price_cents
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  attr_accessor :price

  attr_accessible :category_id, :description, :image, :name, :price_cents, :upc_code, :price, :taxable

  def price
    price_cents/100.0 if price_cents
  end

  def price= price
  	self.price_cents = (price.to_f*100).round
  end

end

#class User < ActiveRecord::Base
  
#end

# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  price_cents :integer
#  upc_code    :string(255)
#  image       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#

