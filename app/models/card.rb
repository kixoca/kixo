class Card
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :token, :number, :exp_month, :exp_year, :cvc

  validates :number,    :presence => true, :numericality => {:only_integer => true}, :length => {:is => 16}
  validates :exp_month, :presence => true, :numericality => {:only_integer => true}, :inclusion => {:in => 1..12}
  validates :exp_year,  :presence => true, :numericality => {:only_integer => true, :greater_than_or_equal_to => Time.now.year}
  validates :cvc,       :presence => true, :numericality => {:only_integer => true}, :length => {:is => 3}

  def persisted?
    false
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
