# -*- encoding : utf-8 -*-

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

businesses = Business.create(
  [
    { # 0
      :slug  => "optimumweb",
      :name  => "OptimumWeb",
      :tel   => "514 518-5511",
      :email => "info@optimumweb.ca",
      :url   => "http://optimumweb.ca"
    },
    { # 1
      :slug  => "pierre-roy-et-associes",
      :name  => "Pierre Roy & Associés",
      :tel   => "514 453-9857",
      :email => "info@pierreroy.com",
      :url   => "http://pierreroy.com"
    }
  ]
)

locations = Location.create(
  [
    { # 0
      :business_id  => businesses[0].id,
      :door_number  => nil,
      :house_number => "178",
      :street_name  => "chemin de l'Anse",
      :locality     => "Vaudreuil-Dorion",
      :region       => "Quebec",
      :postal_code  => "J7V 8P3",
      :country      => "Canada",
      :tel          => "5145185511",
      :fax          => nil,
      :email        => "info@optimumweb.ca"
    },
    { # 1
      :business_id  => businesses[1].id,
      :door_number  => "Bureau 202",
      :house_number => "10",
      :street_name  => "boulevard Grand",
      :locality     => "L'Île-Perrot",
      :region       => "Quebec",
      :postal_code  => "J7V 7P8",
      :country      => "Canada",
      :tel          => "5144539857",
      :fax          => "5144532134",
      :email        => "info@pierreroy.com"
    },
    {
      :business_id  => businesses[1].id,
      :door_number  => "Bureau 802",
      :house_number => "1290",
      :street_name  => "rue St-Denis",
      :locality     => "Montréal",
      :region       => "Quebec",
      :postal_code  => "H2X 3J7",
      :country      => "Canada",
      :tel          => "5142828667",
      :fax          => "5142829667",
      :email        => "info@pierreroy.com"
    }
  ]
);