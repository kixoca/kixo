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
      slug:  "optimumweb",
      name:  "OptimumWeb",
      tel:   "514 518-5511",
      email: "info@optimumweb.ca",
      url:   "http://optimumweb.ca"
    },
    { # 1
      slug:  "pierre-roy-et-associes",
      name:  "Pierre Roy & Associés",
      tel:   "514 453-9857",
      email: "info@pierreroy.com",
      url:   "http://pierreroy.com"
    }
  ]
)

wheres = Where.create(
  [
    { # 0
      value: "Vaudreuil-Dorion",
      type:  "locality"
    },
    { # 1
      value: "Quebec",
      type:  "region"
    },
    { # 2
      value: "J7V 8P3",
      type:  "postal_code"
    },
    { # 3
      value: "Canada",
      type:  "country"
    },
    { # 4
      value: "L'Île-Perrot",
      type:  "locality"
    },
    { # 5
      value: "J7V 7P8",
      type:  "postal_code"
    }
  ]
)

locations = Location.create(
  [
    { # 0
      business_id:    businesses[0].id,
      door_number:    nil,
      house_number:   "178",
      street_name:    "chemin de l'Anse",
      locality_id:    wheres[0].id,
      region_id:      wheres[1].id,
      postal_code_id: wheres[2].id,
      country_id:     wheres[3].id,
      tel:            "5145185511",
      fax:            nil,
      email:          "info@optimumweb.ca"
    },
    { # 1
      business_id:    businesses[1].id,
      door_number:    "Bureau 202",
      house_number:   "10",
      street_name:    "boulevard Grand",
      locality_id:    wheres[4].id,
      region_id:      wheres[1].id,
      postal_code_id: wheres[5].id,
      country_id:     wheres[3].id,
      tel:            "5144539857",
      fax:            "5144532134",
      email:          "info@pierreroy.com"
    }
  ]
);