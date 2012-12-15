# encoding: UTF-8

# clear existing seed data
Locale.destroy_all
Category.destroy_all
Topic.destroy_all
Profession.destroy_all
Rating.destroy_all
QuestionStatus.destroy_all
QuestionVisibility.destroy_all

# ratings
rating = Rating.create(:name => "Disappointing")
rating = Rating.create(:name => "Poor")
rating = Rating.create(:name => "Average")
rating = Rating.create(:name => "Good")
rating = Rating.create(:name => "Excellent")

# question statuses
question_status = QuestionStatus.create(:name => "Open")
question_status = QuestionStatus.create(:name => "Answered")
question_status = QuestionStatus.create(:name => "Closed")
question_status = QuestionStatus.create(:name => "Denied")

# question visibilities
question_visibility = QuestionVisibility.create(:name => "Public")
question_visibility = QuestionVisibility.create(:name => "Private")

# guide statuses
guide_status = GuideStatus.create(:name => "Published")
guide_status = GuideStatus.create(:name => "Draft")

# locales
locale = Locale.create(:name => "English", :code => "en")
locale = Locale.create(:name => "Français", :code => "fr")

# categories, topics, and professions

category = Category.create(:name => "Legal")

  topic = Topic.create(:name => "Bankruptcy", :category_id => category.id)
  topic = Topic.create(:name => "Business", :category_id => category.id)
  topic = Topic.create(:name => "Car Accidents", :category_id => category.id)
  topic = Topic.create(:name => "Child Custody", :category_id => category.id)
  topic = Topic.create(:name => "Child Support", :category_id => category.id)
  topic = Topic.create(:name => "Criminal Defense", :category_id => category.id)
  topic = Topic.create(:name => "Divorce", :category_id => category.id)
  topic = Topic.create(:name => "DUI", :category_id => category.id)
  topic = Topic.create(:name => "Employment", :category_id => category.id)
  topic = Topic.create(:name => "Family", :category_id => category.id)
  topic = Topic.create(:name => "Foreclosure", :category_id => category.id)
  topic = Topic.create(:name => "Immigration", :category_id => category.id)
  topic = Topic.create(:name => "Mariage", :category_id => category.id)
  topic = Topic.create(:name => "Personal Injury", :category_id => category.id)
  topic = Topic.create(:name => "Real Estate", :category_id => category.id)

  profession = Profession.create(:name => "Attorney", :category_id => category.id)
  profession = Profession.create(:name => "Lawyer", :category_id => category.id)

category = Category.create(:name => "Health")

  topic = Topic.create(:name => "Acne", :category_id => category.id)
  topic = Topic.create(:name => "Angina", :category_id => category.id)
  topic = Topic.create(:name => "Asthma", :category_id => category.id)
  topic = Topic.create(:name => "Botox", :category_id => category.id)
  topic = Topic.create(:name => "Breast Augmentations", :category_id => category.id)
  topic = Topic.create(:name => "Cataract", :category_id => category.id)
  topic = Topic.create(:name => "Cervical Cancer", :category_id => category.id)
  topic = Topic.create(:name => "Face Lift", :category_id => category.id)
  topic = Topic.create(:name => "HPV", :category_id => category.id)
  topic = Topic.create(:name => "Invisalign", :category_id => category.id)
  topic = Topic.create(:name => "LASIK", :category_id => category.id)
  topic = Topic.create(:name => "Liposuction", :category_id => category.id)
  topic = Topic.create(:name => "Melanoma", :category_id => category.id)
  topic = Topic.create(:name => "Pregnancy", :category_id => category.id)
  topic = Topic.create(:name => "Rhinoplasty", :category_id => category.id)
  topic = Topic.create(:name => "Root Canal", :category_id => category.id)
  topic = Topic.create(:name => "Teeth Whitening", :category_id => category.id)
  topic = Topic.create(:name => "Tummy Tuck", :category_id => category.id)

category = Category.create(:name => "Finance")

  topic = Topic.create(:name => "Accounting", :category_id => category.id)
  topic = Topic.create(:name => "Bankruptcy", :category_id => category.id)
  topic = Topic.create(:name => "Bookkeeping", :category_id => category.id)
  topic = Topic.create(:name => "Credit", :category_id => category.id)
  topic = Topic.create(:name => "Estates", :category_id => category.id)
  topic = Topic.create(:name => "Franchise", :category_id => category.id)
  topic = Topic.create(:name => "Investment", :category_id => category.id)
  topic = Topic.create(:name => "Mortgage", :category_id => category.id)
  topic = Topic.create(:name => "Mutual Funds", :category_id => category.id)
  topic = Topic.create(:name => "Payroll", :category_id => category.id)
  topic = Topic.create(:name => "Personal Finance", :category_id => category.id)
  topic = Topic.create(:name => "Stocks", :category_id => category.id)
  topic = Topic.create(:name => "Taxes", :category_id => category.id)

  profession = Profession.create(:name => "Accountant", :category_id => category.id)
  profession = Profession.create(:name => "Bankruptcy Trustee", :category_id => category.id)
  profession = Profession.create(:name => "Investment Broker", :category_id => category.id)
  profession = Profession.create(:name => "Real Estate Broker", :category_id => category.id)

# countries, regions, and localities

country = Country.create(:name => "Canada")

  region = Region.create(:name => "Ontario", :country_id => country.id)

    locality = Locality.create(:name => "Barrie", :population => 128430, :region_id => region.id)
    locality = Locality.create(:name => "Belleville", :population => 48821, :region_id => region.id)
    locality = Locality.create(:name => "Brampton", :population => 433806, :region_id => region.id)
    locality = Locality.create(:name => "Brant", :population => 34415, :region_id => region.id)
    locality = Locality.create(:name => "Brantford", :population => 90192, :region_id => region.id)
    locality = Locality.create(:name => "Brockville", :population => 21957, :region_id => region.id)
    locality = Locality.create(:name => "Burlington", :population => 164415, :region_id => region.id)
    locality = Locality.create(:name => "Cambridge", :population => 120371, :region_id => region.id)
    locality = Locality.create(:name => "Chatham-Kent", :population => 108177, :region_id => region.id)
    locality = Locality.create(:name => "Clarence-Rockland", :population => 20790, :region_id => region.id)
    locality = Locality.create(:name => "Cornwall", :population => 45965, :region_id => region.id)
    locality = Locality.create(:name => "Dryden", :population => 8195, :region_id => region.id)
    locality = Locality.create(:name => "Elliot Lake", :population => 11549, :region_id => region.id)
    locality = Locality.create(:name => "Greater Sudbury", :population => 157857, :region_id => region.id)
    locality = Locality.create(:name => "Guelph", :population => 114943, :region_id => region.id)
    locality = Locality.create(:name => "Haldimand County", :population => 45212, :region_id => region.id)
    locality = Locality.create(:name => "Hamilton", :population => 504559, :region_id => region.id)
    locality = Locality.create(:name => "Kawartha Lakes", :population => 74561, :region_id => region.id)
    locality = Locality.create(:name => "Kenora", :population => 15177, :region_id => region.id)
    locality = Locality.create(:name => "Kingston", :population => 117207, :region_id => region.id)
    locality = Locality.create(:name => "Kitchener", :population => 204668, :region_id => region.id)
    locality = Locality.create(:name => "London", :population => 352395, :region_id => region.id)
    locality = Locality.create(:name => "Markham", :population => 261573, :region_id => region.id)
    locality = Locality.create(:name => "Mississauga", :population => 668549, :region_id => region.id)
    locality = Locality.create(:name => "Niagara Falls", :population => 82184, :region_id => region.id)
    locality = Locality.create(:name => "Norfolk County", :population => 60847, :region_id => region.id)
    locality = Locality.create(:name => "North Bay", :population => 53966, :region_id => region.id)
    locality = Locality.create(:name => "Orillia", :population => 30259, :region_id => region.id)
    locality = Locality.create(:name => "Oshawa", :population => 141590, :region_id => region.id)
    locality = Locality.create(:name => "Ottawa", :population => 812129, :region_id => region.id)
    locality = Locality.create(:name => "Owen Sound", :population => 21753, :region_id => region.id)
    locality = Locality.create(:name => "Pembroke", :population => 13930, :region_id => region.id)
    locality = Locality.create(:name => "Peterborough", :population => 74898, :region_id => region.id)
    locality = Locality.create(:name => "Pickering", :population => 87838, :region_id => region.id)
    locality = Locality.create(:name => "Prince Edward County", :population => 25496, :region_id => region.id)
    locality = Locality.create(:name => "Port Colborne", :population => 18599, :region_id => region.id)
    locality = Locality.create(:name => "Quinte West", :population => 42697, :region_id => region.id)
    locality = Locality.create(:name => "Sarnia", :population => 71419, :region_id => region.id)
    locality = Locality.create(:name => "Sault Ste. Marie", :population => 74948, :region_id => region.id)
    locality = Locality.create(:name => "St. Catharines", :population => 131989, :region_id => region.id)
    locality = Locality.create(:name => "St. Thomas", :population => 36110, :region_id => region.id)
    locality = Locality.create(:name => "Stratford", :population => 30461, :region_id => region.id)
    locality = Locality.create(:name => "Temiskaming Shores", :population => 10442, :region_id => region.id)
    locality = Locality.create(:name => "Thorold", :population => 18224, :region_id => region.id)
    locality = Locality.create(:name => "Thunder Bay", :population => 109140, :region_id => region.id)
    locality = Locality.create(:name => "Timmins", :population => 42997, :region_id => region.id)
    locality = Locality.create(:name => "Toronto", :population => 2503281, :region_id => region.id)
    locality = Locality.create(:name => "Vaughan", :population => 238866, :region_id => region.id)
    locality = Locality.create(:name => "Waterloo", :population => 97475, :region_id => region.id)
    locality = Locality.create(:name => "Welland", :population => 50331, :region_id => region.id)
    locality = Locality.create(:name => "Windsor", :population => 216473, :region_id => region.id)
    locality = Locality.create(:name => "Woodstock", :population => 35480, :region_id => region.id)

  region = Region.create(:name => "Québec", :country_id => country.id)

    locality = Locality.create(:name => "Acton Vale", :population => 7797, :region_id => region.id)
    locality = Locality.create(:name => "Alma", :population => 29998, :region_id => region.id)
    locality = Locality.create(:name => "Amos", :population => 12584, :region_id => region.id)
    locality = Locality.create(:name => "Amqui", :population => 6261, :region_id => region.id)
    locality = Locality.create(:name => "Asbestos", :population => 6819, :region_id => region.id)
    locality = Locality.create(:name => "Baie-Comeau", :population => 22554, :region_id => region.id)
    locality = Locality.create(:name => "Baie-d'Urfé", :population => 3902, :region_id => region.id)
    locality = Locality.create(:name => "Baie-Saint-Paul", :population => 7288, :region_id => region.id)
    locality = Locality.create(:name => "Barkmere", :population => 87, :region_id => region.id)
    locality = Locality.create(:name => "Beaconsfield", :population => 19194, :region_id => region.id)
    locality = Locality.create(:name => "Beauceville", :population => 6226, :region_id => region.id)
    locality = Locality.create(:name => "Beauharnois", :population => 11918, :region_id => region.id)
    locality = Locality.create(:name => "Beaupré", :population => 3006, :region_id => region.id)
    locality = Locality.create(:name => "Bécancour", :population => 11134, :region_id => region.id)
    locality = Locality.create(:name => "Bedford", :population => 2612, :region_id => region.id)
    locality = Locality.create(:name => "Belleterre", :population => 350, :region_id => region.id)
    locality = Locality.create(:name => "Beloeil", :population => 18927, :region_id => region.id)
    locality = Locality.create(:name => "Berthierville", :population => 4007, :region_id => region.id)
    locality = Locality.create(:name => "Blainville", :population => 46493, :region_id => region.id)
    locality = Locality.create(:name => "Bois-des-Filion", :population => 8383, :region_id => region.id)
    locality = Locality.create(:name => "Boisbriand", :population => 26483, :region_id => region.id)
    locality = Locality.create(:name => "Bonaventure", :population => 2673, :region_id => region.id)
    locality = Locality.create(:name => "Boucherville", :population => 39062, :region_id => region.id)
    locality = Locality.create(:name => "Lac-Brome", :population => 5629, :region_id => region.id)
    locality = Locality.create(:name => "Bromont", :population => 6049, :region_id => region.id)
    locality = Locality.create(:name => "Brossard", :population => 71154, :region_id => region.id)
    locality = Locality.create(:name => "Brownsburg-Chatham", :population => 6664, :region_id => region.id)
    locality = Locality.create(:name => "Candiac", :population => 15947, :region_id => region.id)
    locality = Locality.create(:name => "Cap-Chat", :population => 2777, :region_id => region.id)
    locality = Locality.create(:name => "Cap-Santé", :population => 2666, :region_id => region.id)
    locality = Locality.create(:name => "Carignan", :population => 7426, :region_id => region.id)
    locality = Locality.create(:name => "Carleton-sur-Mer", :population => 4077, :region_id => region.id)
    locality = Locality.create(:name => "Causapscal", :population => 2556, :region_id => region.id)
    locality = Locality.create(:name => "Chambly", :population => 22608, :region_id => region.id)
    locality = Locality.create(:name => "Chandler", :population => 7914, :region_id => region.id)
    locality = Locality.create(:name => "Chapais", :population => 1630, :region_id => region.id)
    locality = Locality.create(:name => "Charlemagne", :population => 5594, :region_id => region.id)
    locality = Locality.create(:name => "Châteauguay", :population => 42786, :region_id => region.id)
    locality = Locality.create(:name => "Château-Richer", :population => 3563, :region_id => region.id)
    locality = Locality.create(:name => "Chibougamau", :population => 7563, :region_id => region.id)
    locality = Locality.create(:name => "Clermont", :population => 3041, :region_id => region.id)
    locality = Locality.create(:name => "Coaticook", :population => 9204, :region_id => region.id)
    locality = Locality.create(:name => "Contrecoeur", :population => 5678, :region_id => region.id)
    locality = Locality.create(:name => "Cookshire-Eaton", :population => 5004, :region_id => region.id)
    locality = Locality.create(:name => "Côte-Saint-Luc", :population => 31395, :region_id => region.id)
    locality = Locality.create(:name => "Coteau-du-Lac", :population => , :region_id => region.id)
    locality = Locality.create(:name => "Cowansville", :population => 12182, :region_id => region.id)
    locality = Locality.create(:name => "Danville", :population => 4041, :region_id => region.id)
    locality = Locality.create(:name => "Daveluyville", :population => 1005, :region_id => region.id)
    locality = Locality.create(:name => "Dégelis", :population => 3209, :region_id => region.id)
    locality = Locality.create(:name => "Delson", :population => 7322, :region_id => region.id)
    locality = Locality.create(:name => "Desbiens", :population => 1074, :region_id => region.id)
    locality = Locality.create(:name => "Deux-Montagnes", :population => 17402, :region_id => region.id)
    locality = Locality.create(:name => "Disraeli", :population => 2570, :region_id => region.id)
    locality = Locality.create(:name => "Dolbeau-Mistassini", :population => 14546, :region_id => region.id)
    locality = Locality.create(:name => "Dollard-des-Ormeaux", :population => 48930, :region_id => region.id)
    locality = Locality.create(:name => "Donnacona", :population => 5564, :region_id => region.id)
    locality = Locality.create(:name => "Dorval", :population => 18088, :region_id => region.id)
    locality = Locality.create(:name => "Drummondville", :population => 67392, :region_id => region.id)
    locality = Locality.create(:name => "Dunham", :population => 3396, :region_id => region.id)
    locality = Locality.create(:name => "Duparquet", :population => 650, :region_id => region.id)
    locality = Locality.create(:name => "East Angus", :population => 3357, :region_id => region.id)
    locality = Locality.create(:name => "Estérel", :population => 256, :region_id => region.id)
    locality = Locality.create(:name => "Farnham", :population => 7809, :region_id => region.id)
    locality = Locality.create(:name => "Fermont", :population => 2633, :region_id => region.id)
    locality = Locality.create(:name => "Forestville", :population => 3543, :region_id => region.id)
    locality = Locality.create(:name => "Fossambault-sur-le-Lac", :population => 1532, :region_id => region.id)
    locality = Locality.create(:name => "Gaspé", :population => 14819, :region_id => region.id)
    locality = Locality.create(:name => "Gatineau", :population => 242124, :region_id => region.id)
    locality = Locality.create(:name => "Gracefield", :population => 2439, :region_id => region.id)
    locality = Locality.create(:name => "Granby", :population => 47637, :region_id => region.id)
    locality = Locality.create(:name => "Grande-Rivière", :population => 3409, :region_id => region.id)
    locality = Locality.create(:name => "Hampstead", :population => 6996, :region_id => region.id)
    locality = Locality.create(:name => "Hudson", :population => 5088, :region_id => region.id)
    locality = Locality.create(:name => "Huntingdon", :population => 2587, :region_id => region.id)
    locality = Locality.create(:name => "Joliette", :population => 19045, :region_id => region.id)
    locality = Locality.create(:name => "Kingsey Falls", :population => 2086, :region_id => region.id)
    locality = Locality.create(:name => "Kirkland", :population => 20491, :region_id => region.id)
    locality = Locality.create(:name => "L'Ancienne-Lorette", :population => 16516, :region_id => region.id)
    locality = Locality.create(:name => "L'Assomption", :population => 16738, :region_id => region.id)
    locality = Locality.create(:name => "L'Épiphanie", :population => 4606, :region_id => region.id)
    locality = Locality.create(:name => "L'Île-Cadieux", :population => 128, :region_id => region.id)
    locality = Locality.create(:name => "L'Île-Dorval", :population => 59, :region_id => region.id)
    locality = Locality.create(:name => "L'Île-Perrot", :population => 9927, :region_id => region.id)
    locality = Locality.create(:name => "La Malbaie", :population => 8959, :region_id => region.id)
    locality = Locality.create(:name => "La Pocatière", :population => 4575, :region_id => region.id)
    locality = Locality.create(:name => "La Prairie", :population => 21763, :region_id => region.id)
    locality = Locality.create(:name => "La Sarre", :population => 7336, :region_id => region.id)
    locality = Locality.create(:name => "La Tuque", :population => 11821, :region_id => region.id)
    locality = Locality.create(:name => "Lac-Delage", :population => 530, :region_id => region.id)
    locality = Locality.create(:name => "Lac-Mégantic", :population => 5967, :region_id => region.id)
    locality = Locality.create(:name => "Lac-Saint-Joseph", :population => 266, :region_id => region.id)
    locality = Locality.create(:name => "Lac-Sergent", :population => 423, :region_id => region.id)
    locality = Locality.create(:name => "Lachute", :population => 11832, :region_id => region.id)
    locality = Locality.create(:name => "Laval", :population => 376845, :region_id => region.id)
    locality = Locality.create(:name => "Lavaltrie", :population => 12112, :region_id => region.id)
    locality = Locality.create(:name => "Lebel-sur-Quévillon", :population => 2729, :region_id => region.id)
    locality = Locality.create(:name => "Léry", :population => 2385, :region_id => region.id)
    locality = Locality.create(:name => "Lévis", :population => 130006, :region_id => region.id)
    locality = Locality.create(:name => "Longueuil", :population => 229330, :region_id => region.id)
    locality = Locality.create(:name => "Lorraine", :population => 9613, :region_id => region.id)
    locality = Locality.create(:name => "Louiseville", :population => 7433, :region_id => region.id)
    locality = Locality.create(:name => "Macamic", :population => 2726, :region_id => region.id)
    locality = Locality.create(:name => "Magog", :population => 23880, :region_id => region.id)
    locality = Locality.create(:name => "Malartic", :population => 3640, :region_id => region.id)
    locality = Locality.create(:name => "Maniwaki", :population => 4102, :region_id => region.id)
    locality = Locality.create(:name => "Marieville", :population => 7904, :region_id => region.id)
    locality = Locality.create(:name => "Mascouche", :population => 34626, :region_id => region.id)
    locality = Locality.create(:name => "Matagami", :population => 1555, :region_id => region.id)
    locality = Locality.create(:name => "Matane", :population => 14742, :region_id => region.id)
    locality = Locality.create(:name => "Mercier", :population => 10121, :region_id => region.id)
    locality = Locality.create(:name => "Métabetchouan–Lac-à-la-Croix", :population => 4084, :region_id => region.id)
    locality = Locality.create(:name => "Métis-sur-Mer", :population => 604, :region_id => region.id)
    locality = Locality.create(:name => "Mirabel", :population => 34626, :region_id => region.id)
    locality = Locality.create(:name => "Mont-Joli", :population => 6568, :region_id => region.id)
    locality = Locality.create(:name => "Mont-Laurier", :population => 13405, :region_id => region.id)
    locality = Locality.create(:name => "Mont-Saint-Hilaire", :population => 15720, :region_id => region.id)
    locality = Locality.create(:name => "Mont-Tremblant", :population => 8892, :region_id => region.id)
    locality = Locality.create(:name => "Montmagny", :population => 11724, :region_id => region.id)
    locality = Locality.create(:name => "Montreal", :population => 1620693, :region_id => region.id)
    locality = Locality.create(:name => "Montréal-Est", :population => 3822, :region_id => region.id)
    locality = Locality.create(:name => "Montréal-Ouest", :population => 5184, :region_id => region.id)
    locality = Locality.create(:name => "Mont-Royal", :population => 18933, :region_id => region.id)
    locality = Locality.create(:name => "Murdochville", :population => 812, :region_id => region.id)
    locality = Locality.create(:name => "Neuville", :population => 3638, :region_id => region.id)
    locality = Locality.create(:name => "New Richmond", :population => 3748, :region_id => region.id)
    locality = Locality.create(:name => "Nicolet", :population => 7827, :region_id => region.id)
    locality = Locality.create(:name => "Normandin", :population => 3220, :region_id => region.id)
    locality = Locality.create(:name => "Notre-Dame-de-l'Île-Perrot", :population => 9885, :region_id => region.id)
    locality = Locality.create(:name => "Notre-Dame-des-Prairies", :population => 8230, :region_id => region.id)
    locality = Locality.create(:name => "Otterburn Park", :population => 8464, :region_id => region.id)
    locality = Locality.create(:name => "Paspébiac", :population => 3159, :region_id => region.id)
    locality = Locality.create(:name => "Percé", :population => 3419, :region_id => region.id)
    locality = Locality.create(:name => "Pincourt", :population => 11197, :region_id => region.id)
    locality = Locality.create(:name => "Plessisville", :population => 6677, :region_id => region.id)
    locality = Locality.create(:name => "Pohénégamook", :population => 2940, :region_id => region.id)
    locality = Locality.create(:name => "Pointe-Claire", :population => 30161, :region_id => region.id)
    locality = Locality.create(:name => "Pont-Rouge", :population => 7518, :region_id => region.id)
    locality = Locality.create(:name => "Port-Cartier", :population => 6758, :region_id => region.id)
    locality = Locality.create(:name => "Portneuf", :population => 3086, :region_id => region.id)
    locality = Locality.create(:name => "Princeville", :population => 5571, :region_id => region.id)
    locality = Locality.create(:name => "Prévost", :population => 10132, :region_id => region.id)
    locality = Locality.create(:name => "Quebec City", :population => 659545, :region_id => region.id)
    locality = Locality.create(:name => "Repentigny", :population => 76237, :region_id => region.id)
    locality = Locality.create(:name => "Richelieu", :population => 5208, :region_id => region.id)
    locality = Locality.create(:name => "Richmond", :population => 3336, :region_id => region.id)
    locality = Locality.create(:name => "Rimouski", :population => 42240, :region_id => region.id)
    locality = Locality.create(:name => "Rivière-du-Loup", :population => 18586, :region_id => region.id)
    locality = Locality.create(:name => "Rivière-Rouge", :population => 4152, :region_id => region.id)
    locality = Locality.create(:name => "Roberval", :population => 10544, :region_id => region.id)
    locality = Locality.create(:name => "Rosemère", :population => 14173, :region_id => region.id)
    locality = Locality.create(:name => "Rouyn-Noranda", :population => 39924, :region_id => region.id)
    locality = Locality.create(:name => "Saguenay", :population => 143692, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Adèle", :population => 10634, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Agathe-des-Monts", :population => 9679, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Anne-de-Beaupré", :population => 2803, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Anne-de-Bellevue", :population => 5197, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Anne-des-Monts", :population => 6772, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Anne-des-Plaines", :population => 13001, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Augustin-de-Desmaures", :population => 17281, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Basile", :population => 2560, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Basile-le-Grand", :population => 15605, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Bruno-de-Montarville", :population => 24388, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Catherine", :population => 16211, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :population => 5021, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Césaire", :population => 5151, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Colomban", :population => 13080, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Constant", :population => 23957, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Eustache", :population => 42062, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Félicien", :population => 10477, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Gabriel", :population => 2828, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Georges", :population => 30113, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Hyacinthe", :population => 55823, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Jean-sur-Richelieu", :population => 87492, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Jérôme", :population => 63729, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Joseph-de-Beauce", :population => 4454, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Joseph-de-Sorel", :population => 1686, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Julie", :population => 29019, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Lambert", :population => 21599, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Lazare", :population => 17016, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Lin–Laurentides", :population => 14159, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Marc-des-Carrières", :population => 2774, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Marguerite-du-Lac-Masson", :population => 2498, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Marie", :population => 11584, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Marthe-sur-le-Lac", :population => 11311, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Ours", :population => 1700, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Pamphile", :population => 2704, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Pascal", :population => 3504, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Pie", :population => 5109, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Raymond", :population => 9273, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Rémi", :population => 6136, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Sauveur", :population => 9191, :region_id => region.id)
    locality = Locality.create(:name => "Sainte-Thérèse", :population => 25224, :region_id => region.id)
    locality = Locality.create(:name => "Saint-Tite", :population => 3826, :region_id => region.id)
    locality = Locality.create(:name => "Salaberry-de-Valleyfield", :population => 39672, :region_id => region.id)
    locality = Locality.create(:name => "Schefferville", :population => 202, :region_id => region.id)
    locality = Locality.create(:name => "Scotstown", :population => 588, :region_id => region.id)
    locality = Locality.create(:name => "Senneterre", :population => 2993, :region_id => region.id)
    locality = Locality.create(:name => "Sept-Îles", :population => 27827, :region_id => region.id)
    locality = Locality.create(:name => "Shawinigan", :population => 51904, :region_id => region.id)
    locality = Locality.create(:name => "Sherbrooke", :population => 186952, :region_id => region.id)
    locality = Locality.create(:name => "Sorel-Tracy", :population => 34076, :region_id => region.id)
    locality = Locality.create(:name => "Stanstead", :population => 2957, :region_id => region.id)
    locality = Locality.create(:name => "Sutton", :population => 3805, :region_id => region.id)
    locality = Locality.create(:name => "Témiscaming", :population => 2697, :region_id => region.id)
    locality = Locality.create(:name => "Témiscouata-sur-le-Lac", :population => , :region_id => region.id)
    locality = Locality.create(:name => "Terrebonne", :population => 94703, :region_id => region.id)
    locality = Locality.create(:name => "Thetford Mines", :population => 25704, :region_id => region.id)
    locality = Locality.create(:name => "Thurso", :population => 2299, :region_id => region.id)
    locality = Locality.create(:name => "Trois-Pistoles", :population => 3500, :region_id => region.id)
    locality = Locality.create(:name => "Trois-Rivières", :population => 129100, :region_id => region.id)
    locality = Locality.create(:name => "Val-d'Or", :population => 31123, :region_id => region.id)
    locality = Locality.create(:name => "Valcourt", :population => 2349, :region_id => region.id)
    locality = Locality.create(:name => "Varennes", :population => 20950, :region_id => region.id)
    locality = Locality.create(:name => "Vaudreuil-Dorion", :population => 25789, :region_id => region.id)
    locality = Locality.create(:name => "Victoriaville", :population => 40486, :region_id => region.id)
    locality = Locality.create(:name => "Ville-Marie", :population => 2696, :region_id => region.id)
    locality = Locality.create(:name => "Warwick", :population => 4804, :region_id => region.id)
    locality = Locality.create(:name => "Waterloo", :population => 4054, :region_id => region.id)
    locality = Locality.create(:name => "Waterville", :population => 1926, :region_id => region.id)
    locality = Locality.create(:name => "Westmount", :population => 20494, :region_id => region.id)
    locality = Locality.create(:name => "Windsor", :population => 5239, :region_id => region.id)