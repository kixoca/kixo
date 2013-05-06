class Card
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming

  attr_accessor :card, :number, :exp, :exp_month, :exp_year, :cvc

  validates :number,    :presence => {:message => I18n.t("cards.fields.number.validation.presence")}, :numericality => {:only_integer => true}, :length => {:is => 16}
  validates :exp_month, :presence => {:message => I18n.t("cards.fields.exp_month.validation.presence")}, :numericality => {:only_integer => true}, :inclusion => {:in => 1..12}
  validates :exp_year,  :presence => {:message => I18n.t("cards.fields.exp_year.validation.presence")}, :numericality => {:only_integer => true, :greater_than_or_equal_to => Time.now.year}
  validates :cvc,       :presence => {:message => I18n.t("cards.fields.cvc.validation.presence")}, :numericality => {:only_integer => true}, :length => {:is => 3}

  def persisted?
    false
  end

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end
end
