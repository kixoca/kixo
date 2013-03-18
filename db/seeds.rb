# encoding: UTF-8

# locales
Locale.destroy_all

en = Locale.create(:name => "English", :code => "en")
fr = Locale.create(:name => "Français", :code => "fr")

# ratings
Rating.destroy_all
  RatingName.destroy_all

rating = Rating.create()
  rating_name = RatingName.create(:name => "Excellent", :locale => en, :rating => rating)
  rating_name = RatingName.create(:name => "Excellent", :locale => fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Good", :locale => en, :rating => rating)
  rating_name = RatingName.create(:name => "Bien", :locale => fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Average", :locale => en, :rating => rating)
  rating_name = RatingName.create(:name => "Moyen", :locale => fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Poor", :locale => en, :rating => rating)
  rating_name = RatingName.create(:name => "Médiocre", :locale => fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Disappointing", :locale => en, :rating => rating)
  rating_name = RatingName.create(:name => "Décevant", :locale => fr, :rating => rating)

# question statuses
QuestionStatus.destroy_all
  QuestionStatusName.destroy_all

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Open", :locale => en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Ouverte", :locale => fr, :question_status => question_status)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Answered", :locale => en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Répondue", :locale => fr, :question_status => question_status)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Closed", :locale => en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Fermée", :locale => fr, :question_status => question_status)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Denied", :locale => en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Refusée", :locale => fr, :question_status => question_status)

# guide statuses
GuideStatus.destroy_all
  GuideStatusName.destroy_all

guide_status = GuideStatus.create()
  guide_status_name = GuideStatusName.create(:name => "Published", :locale => en, :guide_status => guide_status)
  guide_status_name = GuideStatusName.create(:name => "Publié", :locale => fr, :guide_status => guide_status)

guide_status = GuideStatus.create()
  guide_status_name = GuideStatusName.create(:name => "Draft", :locale => en, :guide_status => guide_status)
  guide_status_name = GuideStatusName.create(:name => "Brouillon", :locale => fr, :guide_status => guide_status)

# categories, topics, and professions
Category.destroy_all
  CategoryName.destroy_all
  CategoryDescription.destroy_all

  Topic.destroy_all
    TopicName.destroy_all
    TopicDescription.destroy_all

  Profession.destroy_all
    ProfessionName.destroy_all
    ProfessionDescription.destroy_all

category = Category.create()
  category_name = CategoryName.create(:name => "Legal", :locale => en, :category => category)
  category_name = CategoryName.create(:name => "Juridique", :locale => fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Business Law", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Droit corporatif", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Car Accidents", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Accidents automobiles", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Contracts", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Contrats", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Child Custody", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Garde des enfants", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Child Support", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Pension alimentaire", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Criminal Defense", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Défense pénale", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Debt Collection", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Recouvrement de créances", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Divorce", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Séparation", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Domestic Violence", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Violence domestique", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "DUI", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Alcool au volant", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Employment", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Emploi", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Family Law", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Droit de la famille", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Foreclosure", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Éviction", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Immigration", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Immigration", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Landlord / Tenant", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Propriétaire / locataire", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Lawsuits", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Poursuites", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mariage", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Mariage", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Medical Malpractice", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Faute médicale", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Personal Injury", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Blessures", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Traffic Ticket", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Contraventions", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Real Estate Law", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Droit immobilier", :locale => fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Attorney", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Mandataire", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Lawyer", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Avocat(e)", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Paralegal", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Technicien(ne) juridique", :locale => fr, :profession => profession)

category = Category.create()
  category_name = CategoryName.create(:name => "Health", :locale => en, :category => category)
  category_name = CategoryName.create(:name => "Santé", :locale => fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Acne", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Acné", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Angina", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Angine", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Asthma", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Asthme", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Botox", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Botox", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Breast Augmentations", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Augmentations mammaires", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Cataract", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Cataracte", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Cervical Cancer", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Cancer du col utérin", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Depression", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Dépression", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Emotional Dependence", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Dépendance affective", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Face Lift", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Lifting facial", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Eating Disorder", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Trouble des conduites alimentaires", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "HPV", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "VPH", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Invisalign", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Invisalign", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "LASIK", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "LASIK", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Liposuction", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Liposuccion", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Melanoma", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Mélanome", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Neurosis", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Névrose", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Pregnancy", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Grossesse", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Psychosis", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Psychose", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Rhinoplasty", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Rhinoplastie", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Root Canal", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Traitement de canal", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Teeth Whitening", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Blanchiment des dents", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Tummy Tuck", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Abdominoplastie", :locale => fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Doctor", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Médecin", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Nurse", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Infirmière", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Psychologist", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Psychologue", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Psychiatrist", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Psychiatre", :locale => fr, :profession => profession)

category = Category.create()
  category_name = CategoryName.create(:name => "Finance", :locale => en, :category => category)
  category_name = CategoryName.create(:name => "Finances", :locale => fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Accounting", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Comptabilité", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Bankruptcy and Insolvency", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Faillite et insolvabilité", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Bookkeeping", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Tenue de livres", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Credit", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Crédit", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Estates", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Propriétés", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Franchise", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Franchise", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Investment", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Investissement", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mortgage", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Hypothèque", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mutual Funds", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Fonds mutuels", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Payroll", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Paie", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Personal Finance", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Finances personnelles", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Stocks", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Actions", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Taxes", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Impôts", :locale => fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Accountant", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Comptable", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Bankruptcy Trustee", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Syndic de faillite", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Investment Broker", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Courtier d'investissement", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Real Estate Broker", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Courtier immobilier", :locale => fr, :profession => profession)

category = Category.create()
  category_name = CategoryName.create(:name => "Marketing and Advertising", :locale => en, :category => category)
  category_name = CategoryName.create(:name => "Marketing et publicité", :locale => fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Advertising", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Publicité", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Branding", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Image de marque", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Direct Marketing", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Marketing direct", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Event Marketing", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Marketing événementiel", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Internet Marketing", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Marketing Internet", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Market Research", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Étude de marché", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Promotional Items", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Articles promotionnels", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Public Relations", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Relations publiques", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Relationship Marketing", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Marketing relationnel", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Strategic Marketing", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Marketing stratégique", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Telemarketing", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Télémarketing", :locale => fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Consultant", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Consultant", :locale => fr, :profession => profession)

category = Category.create()
  category_name = CategoryName.create(:name => "Real Estate", :locale => en, :category => category)
  category_name = CategoryName.create(:name => "Immobilier", :locale => fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Agricultural Real Estate", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Immobilier agricole", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Commercial Real Estate", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Immobilier commercial", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Residential Real Estate", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Immobilier résidentiel", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Real Estate Appraisal", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Évaluation immobilière", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Property Management", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Gestion de propriété", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Real Estate Investment", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Investissement immobilier", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mortages", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Hypothèques", :locale => fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Inspection", :locale => en, :topic => topic)
    topic_name = TopicName.create(:name => "Inspection", :locale => fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Real Estate Broker", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Courtier Immobilier", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Inspector", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Inspecteur", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Real Estate Appraiser", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Évaluateur immobilier", :locale => fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Mortage Broker", :locale => en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Courtier hypothécaire", :locale => fr, :profession => profession)

# countries, regions, and localities
Country.destroy_all
  CountryName.destroy_all

  Region.destroy_all
    RegionName.destroy_all

    Locality.destroy_all
      LocalityName.destroy_all

country = Country.create()
  country_name = CountryName.create(:name => "Canada", :locale => en, :country => country)
  country_name = CountryName.create(:name => "Canada", :locale => fr, :country => country)

  region = Region.create(:country => country)
    region_name = RegionName.create(:name => "Ontario", :locale => en, :region => region)
    region_name = RegionName.create(:name => "Ontario", :locale => fr, :region => region)

    locality = Locality.create(:rank => 128430, :region => region)
      locality_name = LocalityName.create(:name => "Barrie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Barrie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 48821, :region => region)
      locality_name = LocalityName.create(:name => "Belleville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Belleville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 433806, :region => region)
      locality_name = LocalityName.create(:name => "Brampton", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brampton", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 34415, :region => region)
      locality_name = LocalityName.create(:name => "Brant", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brant", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 90192, :region => region)
      locality_name = LocalityName.create(:name => "Brantford", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brantford", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 21957, :region => region)
      locality_name = LocalityName.create(:name => "Brockville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brockville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 164415, :region => region)
      locality_name = LocalityName.create(:name => "Burlington", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Burlington", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 120371, :region => region)
      locality_name = LocalityName.create(:name => "Cambridge", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cambridge", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 108177, :region => region)
      locality_name = LocalityName.create(:name => "Chatham-Kent", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chatham-Kent", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 20790, :region => region)
      locality_name = LocalityName.create(:name => "Clarence-Rockland", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Clarence-Rockland", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 45965, :region => region)
      locality_name = LocalityName.create(:name => "Cornwall", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cornwall", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 8195, :region => region)
      locality_name = LocalityName.create(:name => "Dryden", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dryden", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11549, :region => region)
      locality_name = LocalityName.create(:name => "Elliot Lake", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Elliot Lake", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 157857, :region => region)
      locality_name = LocalityName.create(:name => "Greater Sudbury", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Greater Sudbury", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 114943, :region => region)
      locality_name = LocalityName.create(:name => "Guelph", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Guelph", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 45212, :region => region)
      locality_name = LocalityName.create(:name => "Haldimand County", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Haldimand County", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 504559, :region => region)
      locality_name = LocalityName.create(:name => "Hamilton", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Hamilton", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 74561, :region => region)
      locality_name = LocalityName.create(:name => "Kawartha Lakes", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kawartha Lakes", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 15177, :region => region)
      locality_name = LocalityName.create(:name => "Kenora", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kenora", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 117207, :region => region)
      locality_name = LocalityName.create(:name => "Kingston", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kingston", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 204668, :region => region)
      locality_name = LocalityName.create(:name => "Kitchener", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kitchener", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 352395, :region => region)
      locality_name = LocalityName.create(:name => "London", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "London", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 261573, :region => region)
      locality_name = LocalityName.create(:name => "Markham", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Markham", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 668549, :region => region)
      locality_name = LocalityName.create(:name => "Mississauga", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mississauga", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 82184, :region => region)
      locality_name = LocalityName.create(:name => "Niagara Falls", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Niagara Falls", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 60847, :region => region)
      locality_name = LocalityName.create(:name => "Norfolk County", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Norfolk County", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 53966, :region => region)
      locality_name = LocalityName.create(:name => "North Bay", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "North Bay", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 30259, :region => region)
      locality_name = LocalityName.create(:name => "Orillia", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Orillia", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 141590, :region => region)
      locality_name = LocalityName.create(:name => "Oshawa", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Oshawa", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 812129, :region => region)
      locality_name = LocalityName.create(:name => "Ottawa", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Ottawa", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 21753, :region => region)
      locality_name = LocalityName.create(:name => "Owen Sound", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Owen Sound", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 13930, :region => region)
      locality_name = LocalityName.create(:name => "Pembroke", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pembroke", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 74898, :region => region)
      locality_name = LocalityName.create(:name => "Peterborough", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Peterborough", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 87838, :region => region)
      locality_name = LocalityName.create(:name => "Pickering", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pickering", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 25496, :region => region)
      locality_name = LocalityName.create(:name => "Prince Edward County", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Prince Edward County", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 18599, :region => region)
      locality_name = LocalityName.create(:name => "Port Colborne", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Port Colborne", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 42697, :region => region)
      locality_name = LocalityName.create(:name => "Quinte West", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Quinte West", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 71419, :region => region)
      locality_name = LocalityName.create(:name => "Sarnia", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sarnia", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 74948, :region => region)
      locality_name = LocalityName.create(:name => "Sault Ste. Marie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sault Ste. Marie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 131989, :region => region)
      locality_name = LocalityName.create(:name => "St. Catharines", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "St. Catharines", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 36110, :region => region)
      locality_name = LocalityName.create(:name => "St. Thomas", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "St. Thomas", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 30461, :region => region)
      locality_name = LocalityName.create(:name => "Stratford", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Stratford", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 10442, :region => region)
      locality_name = LocalityName.create(:name => "Temiskaming Shores", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Temiskaming Shores", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 18224, :region => region)
      locality_name = LocalityName.create(:name => "Thorold", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thorold", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 109140, :region => region)
      locality_name = LocalityName.create(:name => "Thunder Bay", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thunder Bay", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 42997, :region => region)
      locality_name = LocalityName.create(:name => "Timmins", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Timmins", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2503281, :region => region)
      locality_name = LocalityName.create(:name => "Toronto", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Toronto", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 238866, :region => region)
      locality_name = LocalityName.create(:name => "Vaughan", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Vaughan", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 97475, :region => region)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 50331, :region => region)
      locality_name = LocalityName.create(:name => "Welland", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Welland", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 216473, :region => region)
      locality_name = LocalityName.create(:name => "Windsor", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Windsor", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 35480, :region => region)
      locality_name = LocalityName.create(:name => "Woodstock", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Woodstock", :locale => fr, :locality => locality)

  region = Region.create(:country => country)
    region_name = RegionName.create(:name => "Quebec", :locale => en, :region => region)
    region_name = RegionName.create(:name => "Québec", :locale => fr, :region => region)

    locality = Locality.create(:rank => 7797, :region => region)
      locality_name = LocalityName.create(:name => "Acton Vale", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Acton Vale", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 29998, :region => region)
      locality_name = LocalityName.create(:name => "Alma", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Alma", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 12584, :region => region)
      locality_name = LocalityName.create(:name => "Amos", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Amos", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6261, :region => region)
      locality_name = LocalityName.create(:name => "Amqui", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Amqui", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6819, :region => region)
      locality_name = LocalityName.create(:name => "Asbestos", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Asbestos", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 22554, :region => region)
      locality_name = LocalityName.create(:name => "Baie-Comeau", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Baie-Comeau", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3902, :region => region)
      locality_name = LocalityName.create(:name => "Baie-d'Urfé", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Baie-d'Urfé", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7288, :region => region)
      locality_name = LocalityName.create(:name => "Baie-Saint-Paul", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Baie-Saint-Paul", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 87, :region => region)
      locality_name = LocalityName.create(:name => "Barkmere", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Barkmere", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 19194, :region => region)
      locality_name = LocalityName.create(:name => "Beaconsfield", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beaconsfield", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6226, :region => region)
      locality_name = LocalityName.create(:name => "Beauceville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beauceville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11918, :region => region)
      locality_name = LocalityName.create(:name => "Beauharnois", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beauharnois", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3006, :region => region)
      locality_name = LocalityName.create(:name => "Beaupré", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beaupré", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11134, :region => region)
      locality_name = LocalityName.create(:name => "Bécancour", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bécancour", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2612, :region => region)
      locality_name = LocalityName.create(:name => "Bedford", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bedford", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 350, :region => region)
      locality_name = LocalityName.create(:name => "Belleterre", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Belleterre", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 18927, :region => region)
      locality_name = LocalityName.create(:name => "Beloeil", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beloeil", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4007, :region => region)
      locality_name = LocalityName.create(:name => "Berthierville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Berthierville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 46493, :region => region)
      locality_name = LocalityName.create(:name => "Blainville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Blainville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 8383, :region => region)
      locality_name = LocalityName.create(:name => "Bois-des-Filion", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bois-des-Filion", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 26483, :region => region)
      locality_name = LocalityName.create(:name => "Boisbriand", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Boisbriand", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2673, :region => region)
      locality_name = LocalityName.create(:name => "Bonaventure", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bonaventure", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 39062, :region => region)
      locality_name = LocalityName.create(:name => "Boucherville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Boucherville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5629, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Brome", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Brome", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6049, :region => region)
      locality_name = LocalityName.create(:name => "Bromont", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bromont", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 71154, :region => region)
      locality_name = LocalityName.create(:name => "Brossard", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brossard", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6664, :region => region)
      locality_name = LocalityName.create(:name => "Brownsburg-Chatham", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brownsburg-Chatham", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 15947, :region => region)
      locality_name = LocalityName.create(:name => "Candiac", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Candiac", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2777, :region => region)
      locality_name = LocalityName.create(:name => "Cap-Chat", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cap-Chat", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2666, :region => region)
      locality_name = LocalityName.create(:name => "Cap-Santé", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cap-Santé", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7426, :region => region)
      locality_name = LocalityName.create(:name => "Carignan", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Carignan", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4077, :region => region)
      locality_name = LocalityName.create(:name => "Carleton-sur-Mer", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Carleton-sur-Mer", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2556, :region => region)
      locality_name = LocalityName.create(:name => "Causapscal", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Causapscal", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 22608, :region => region)
      locality_name = LocalityName.create(:name => "Chambly", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chambly", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7914, :region => region)
      locality_name = LocalityName.create(:name => "Chandler", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chandler", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1630, :region => region)
      locality_name = LocalityName.create(:name => "Chapais", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chapais", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5594, :region => region)
      locality_name = LocalityName.create(:name => "Charlemagne", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Charlemagne", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 42786, :region => region)
      locality_name = LocalityName.create(:name => "Châteauguay", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Châteauguay", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3563, :region => region)
      locality_name = LocalityName.create(:name => "Château-Richer", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Château-Richer", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7563, :region => region)
      locality_name = LocalityName.create(:name => "Chibougamau", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chibougamau", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3041, :region => region)
      locality_name = LocalityName.create(:name => "Clermont", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Clermont", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9204, :region => region)
      locality_name = LocalityName.create(:name => "Coaticook", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Coaticook", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5678, :region => region)
      locality_name = LocalityName.create(:name => "Contrecoeur", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Contrecoeur", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5004, :region => region)
      locality_name = LocalityName.create(:name => "Cookshire-Eaton", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cookshire-Eaton", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 31395, :region => region)
      locality_name = LocalityName.create(:name => "Côte Saint-Luc", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Côte-Saint-Luc", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6842, :region => region)
      locality_name = LocalityName.create(:name => "Coteau-du-Lac", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Coteau-du-Lac", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 12182, :region => region)
      locality_name = LocalityName.create(:name => "Cowansville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cowansville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4041, :region => region)
      locality_name = LocalityName.create(:name => "Danville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Danville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1005, :region => region)
      locality_name = LocalityName.create(:name => "Daveluyville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Daveluyville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3209, :region => region)
      locality_name = LocalityName.create(:name => "Dégelis", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dégelis", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7322, :region => region)
      locality_name = LocalityName.create(:name => "Delson", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Delson", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1074, :region => region)
      locality_name = LocalityName.create(:name => "Desbiens", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Desbiens", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 17402, :region => region)
      locality_name = LocalityName.create(:name => "Deux-Montagnes", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Deux-Montagnes", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2570, :region => region)
      locality_name = LocalityName.create(:name => "Disraeli", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Disraeli", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 14546, :region => region)
      locality_name = LocalityName.create(:name => "Dolbeau-Mistassini", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dolbeau-Mistassini", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 48930, :region => region)
      locality_name = LocalityName.create(:name => "Dollard-des-Ormeaux", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dollard-des-Ormeaux", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5564, :region => region)
      locality_name = LocalityName.create(:name => "Donnacona", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Donnacona", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 18088, :region => region)
      locality_name = LocalityName.create(:name => "Dorval", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dorval", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 67392, :region => region)
      locality_name = LocalityName.create(:name => "Drummondville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Drummondville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3396, :region => region)
      locality_name = LocalityName.create(:name => "Dunham", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dunham", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 650, :region => region)
      locality_name = LocalityName.create(:name => "Duparquet", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Duparquet", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3357, :region => region)
      locality_name = LocalityName.create(:name => "East Angus", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "East Angus", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 256, :region => region)
      locality_name = LocalityName.create(:name => "Estérel", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Estérel", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7809, :region => region)
      locality_name = LocalityName.create(:name => "Farnham", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Farnham", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2633, :region => region)
      locality_name = LocalityName.create(:name => "Fermont", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Fermont", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3543, :region => region)
      locality_name = LocalityName.create(:name => "Forestville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Forestville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1532, :region => region)
      locality_name = LocalityName.create(:name => "Fossambault-sur-le-Lac", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Fossambault-sur-le-Lac", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 14819, :region => region)
      locality_name = LocalityName.create(:name => "Gaspé", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Gaspé", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 242124, :region => region)
      locality_name = LocalityName.create(:name => "Gatineau", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Gatineau", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2439, :region => region)
      locality_name = LocalityName.create(:name => "Gracefield", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Gracefield", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 47637, :region => region)
      locality_name = LocalityName.create(:name => "Granby", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Granby", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3409, :region => region)
      locality_name = LocalityName.create(:name => "Grande-Rivière", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Grande-Rivière", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6996, :region => region)
      locality_name = LocalityName.create(:name => "Hampstead", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Hampstead", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5088, :region => region)
      locality_name = LocalityName.create(:name => "Hudson", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Hudson", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2587, :region => region)
      locality_name = LocalityName.create(:name => "Huntingdon", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Huntingdon", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 19045, :region => region)
      locality_name = LocalityName.create(:name => "Joliette", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Joliette", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2086, :region => region)
      locality_name = LocalityName.create(:name => "Kingsey Falls", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kingsey Falls", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 20491, :region => region)
      locality_name = LocalityName.create(:name => "Kirkland", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kirkland", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 16516, :region => region)
      locality_name = LocalityName.create(:name => "L'Ancienne-Lorette", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Ancienne-Lorette", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 16738, :region => region)
      locality_name = LocalityName.create(:name => "L'Assomption", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Assomption", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4606, :region => region)
      locality_name = LocalityName.create(:name => "L'Épiphanie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Épiphanie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 128, :region => region)
      locality_name = LocalityName.create(:name => "L'Île-Cadieux", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Île-Cadieux", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 59, :region => region)
      locality_name = LocalityName.create(:name => "L'Île-Dorval", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Île-Dorval", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9927, :region => region)
      locality_name = LocalityName.create(:name => "L'Île-Perrot", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Île-Perrot", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 8959, :region => region)
      locality_name = LocalityName.create(:name => "La Malbaie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Malbaie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4575, :region => region)
      locality_name = LocalityName.create(:name => "La Pocatière", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Pocatière", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 21763, :region => region)
      locality_name = LocalityName.create(:name => "La Prairie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Prairie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7336, :region => region)
      locality_name = LocalityName.create(:name => "La Sarre", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Sarre", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11821, :region => region)
      locality_name = LocalityName.create(:name => "La Tuque", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Tuque", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 530, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Delage", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Delage", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5967, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Mégantic", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Mégantic", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 266, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Saint-Joseph", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Saint-Joseph", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 423, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Sergent", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Sergent", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11832, :region => region)
      locality_name = LocalityName.create(:name => "Lachute", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lachute", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 376845, :region => region)
      locality_name = LocalityName.create(:name => "Laval", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Laval", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 12112, :region => region)
      locality_name = LocalityName.create(:name => "Lavaltrie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lavaltrie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2729, :region => region)
      locality_name = LocalityName.create(:name => "Lebel-sur-Quévillon", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lebel-sur-Quévillon", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2385, :region => region)
      locality_name = LocalityName.create(:name => "Léry", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Léry", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 130006, :region => region)
      locality_name = LocalityName.create(:name => "Lévis", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lévis", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 229330, :region => region)
      locality_name = LocalityName.create(:name => "Longueuil", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Longueuil", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9613, :region => region)
      locality_name = LocalityName.create(:name => "Lorraine", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lorraine", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7433, :region => region)
      locality_name = LocalityName.create(:name => "Louiseville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Louiseville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2726, :region => region)
      locality_name = LocalityName.create(:name => "Macamic", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Macamic", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 23880, :region => region)
      locality_name = LocalityName.create(:name => "Magog", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Magog", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3640, :region => region)
      locality_name = LocalityName.create(:name => "Malartic", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Malartic", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4102, :region => region)
      locality_name = LocalityName.create(:name => "Maniwaki", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Maniwaki", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7904, :region => region)
      locality_name = LocalityName.create(:name => "Marieville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Marieville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 34626, :region => region)
      locality_name = LocalityName.create(:name => "Mascouche", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mascouche", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1555, :region => region)
      locality_name = LocalityName.create(:name => "Matagami", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Matagami", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 14742, :region => region)
      locality_name = LocalityName.create(:name => "Matane", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Matane", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 10121, :region => region)
      locality_name = LocalityName.create(:name => "Mercier", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mercier", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4084, :region => region)
      locality_name = LocalityName.create(:name => "Métabetchouan–Lac-à-la-Croix", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Métabetchouan–Lac-à-la-Croix", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 604, :region => region)
      locality_name = LocalityName.create(:name => "Métis-sur-Mer", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Métis-sur-Mer", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 34626, :region => region)
      locality_name = LocalityName.create(:name => "Mirabel", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mirabel", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6568, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Joli", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Joli", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 13405, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Laurier", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Laurier", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 15720, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Saint-Hilaire", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Saint-Hilaire", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 8892, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Tremblant", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Tremblant", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11724, :region => region)
      locality_name = LocalityName.create(:name => "Montmagny", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montmagny", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1620693, :region => region)
      locality_name = LocalityName.create(:name => "Montreal", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montréal", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3822, :region => region)
      locality_name = LocalityName.create(:name => "Montreal East", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montréal-Est", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5184, :region => region)
      locality_name = LocalityName.create(:name => "Montreal West", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montréal-Ouest", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 18933, :region => region)
      locality_name = LocalityName.create(:name => "Mount Royal", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Royal", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 812, :region => region)
      locality_name = LocalityName.create(:name => "Murdochville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Murdochville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3638, :region => region)
      locality_name = LocalityName.create(:name => "Neuville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Neuville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3748, :region => region)
      locality_name = LocalityName.create(:name => "New Richmond", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "New Richmond", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7827, :region => region)
      locality_name = LocalityName.create(:name => "Nicolet", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Nicolet", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3220, :region => region)
      locality_name = LocalityName.create(:name => "Normandin", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Normandin", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9885, :region => region)
      locality_name = LocalityName.create(:name => "Notre-Dame-de-l'Île-Perrot", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Notre-Dame-de-l'Île-Perrot", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 8230, :region => region)
      locality_name = LocalityName.create(:name => "Notre-Dame-des-Prairies", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Notre-Dame-des-Prairies", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 8464, :region => region)
      locality_name = LocalityName.create(:name => "Otterburn Park", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Otterburn Park", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3159, :region => region)
      locality_name = LocalityName.create(:name => "Paspébiac", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Paspébiac", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3419, :region => region)
      locality_name = LocalityName.create(:name => "Percé", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Percé", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11197, :region => region)
      locality_name = LocalityName.create(:name => "Pincourt", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pincourt", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6677, :region => region)
      locality_name = LocalityName.create(:name => "Plessisville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Plessisville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2940, :region => region)
      locality_name = LocalityName.create(:name => "Pohénégamook", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pohénégamook", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 30161, :region => region)
      locality_name = LocalityName.create(:name => "Pointe-Claire", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pointe-Claire", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 7518, :region => region)
      locality_name = LocalityName.create(:name => "Pont-Rouge", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pont-Rouge", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6758, :region => region)
      locality_name = LocalityName.create(:name => "Port-Cartier", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Port-Cartier", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3086, :region => region)
      locality_name = LocalityName.create(:name => "Portneuf", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Portneuf", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5571, :region => region)
      locality_name = LocalityName.create(:name => "Princeville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Princeville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 10132, :region => region)
      locality_name = LocalityName.create(:name => "Prévost", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Prévost", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 659545, :region => region)
      locality_name = LocalityName.create(:name => "Quebec City", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Québec", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 76237, :region => region)
      locality_name = LocalityName.create(:name => "Repentigny", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Repentigny", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5208, :region => region)
      locality_name = LocalityName.create(:name => "Richelieu", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Richelieu", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3336, :region => region)
      locality_name = LocalityName.create(:name => "Richmond", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Richmond", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 42240, :region => region)
      locality_name = LocalityName.create(:name => "Rimouski", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rimouski", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 18586, :region => region)
      locality_name = LocalityName.create(:name => "Rivière-du-Loup", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rivière-du-Loup", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4152, :region => region)
      locality_name = LocalityName.create(:name => "Rivière-Rouge", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rivière-Rouge", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 10544, :region => region)
      locality_name = LocalityName.create(:name => "Roberval", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Roberval", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 14173, :region => region)
      locality_name = LocalityName.create(:name => "Rosemère", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rosemère", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 39924, :region => region)
      locality_name = LocalityName.create(:name => "Rouyn-Noranda", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rouyn-Noranda", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 143692, :region => region)
      locality_name = LocalityName.create(:name => "Saguenay", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saguenay", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 10634, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Adèle", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Adèle", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9679, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Agathe-des-Monts", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Agathe-des-Monts", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2803, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Beaupré", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Beaupré", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5197, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Bellevue", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Bellevue", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6772, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Monts", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Monts", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 13001, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Plaines", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Plaines", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 17281, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Augustin-de-Desmaures", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Augustin-de-Desmaures", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2560, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Basile", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Basile", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 15605, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Basile-le-Grand", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Basile-le-Grand", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 24388, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Bruno-de-Montarville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Bruno-de-Montarville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 16211, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Catherine", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Catherine", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5021, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5151, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Césaire", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Césaire", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 13080, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Colomban", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Colomban", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 23957, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Constant", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Constant", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 42062, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Eustache", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Eustache", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 10477, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Félicien", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Félicien", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2828, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Gabriel", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Gabriel", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 30113, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Georges", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Georges", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 55823, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Hyacinthe", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Hyacinthe", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 87492, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Jean-sur-Richelieu", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Jean-sur-Richelieu", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 63729, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Jérôme", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Jérôme", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4454, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Beauce", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Beauce", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1686, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Sorel", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Sorel", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 29019, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Julie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Julie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 21599, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Lambert", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Lambert", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 17016, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Lazare", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Lazare", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 14159, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Lin–Laurentides", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Lin–Laurentides", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2774, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Marc-des-Carrières", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Marc-des-Carrières", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2498, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Marguerite-du-Lac-Masson", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Marguerite-du-Lac-Masson", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11584, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Marie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Marie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 11311, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Marthe-sur-le-Lac", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Marthe-sur-le-Lac", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1700, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Ours", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Ours", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2704, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Pamphile", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Pamphile", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3504, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Pascal", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Pascal", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5109, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Pie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Pie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9273, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Raymond", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Raymond", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 6136, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Rémi", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Rémi", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 9191, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Sauveur", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Sauveur", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 25224, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Thérèse", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Thérèse", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3826, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Tite", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Tite", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 39672, :region => region)
      locality_name = LocalityName.create(:name => "Salaberry-de-Valleyfield", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Salaberry-de-Valleyfield", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 202, :region => region)
      locality_name = LocalityName.create(:name => "Schefferville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Schefferville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 588, :region => region)
      locality_name = LocalityName.create(:name => "Scotstown", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Scotstown", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2993, :region => region)
      locality_name = LocalityName.create(:name => "Senneterre", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Senneterre", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 27827, :region => region)
      locality_name = LocalityName.create(:name => "Sept-Îles", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sept-Îles", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 51904, :region => region)
      locality_name = LocalityName.create(:name => "Shawinigan", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Shawinigan", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 186952, :region => region)
      locality_name = LocalityName.create(:name => "Sherbrooke", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sherbrooke", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 34076, :region => region)
      locality_name = LocalityName.create(:name => "Sorel-Tracy", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sorel-Tracy", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2957, :region => region)
      locality_name = LocalityName.create(:name => "Stanstead", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Stanstead", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3805, :region => region)
      locality_name = LocalityName.create(:name => "Sutton", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sutton", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2697, :region => region)
      locality_name = LocalityName.create(:name => "Témiscaming", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Témiscaming", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5096, :region => region)
      locality_name = LocalityName.create(:name => "Témiscouata-sur-le-Lac", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Témiscouata-sur-le-Lac", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 94703, :region => region)
      locality_name = LocalityName.create(:name => "Terrebonne", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Terrebonne", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 25704, :region => region)
      locality_name = LocalityName.create(:name => "Thetford Mines", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thetford Mines", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2299, :region => region)
      locality_name = LocalityName.create(:name => "Thurso", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thurso", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 3500, :region => region)
      locality_name = LocalityName.create(:name => "Trois-Pistoles", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Trois-Pistoles", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 129100, :region => region)
      locality_name = LocalityName.create(:name => "Trois-Rivières", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Trois-Rivières", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 31123, :region => region)
      locality_name = LocalityName.create(:name => "Val-d'Or", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Val-d'Or", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2349, :region => region)
      locality_name = LocalityName.create(:name => "Valcourt", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Valcourt", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 20950, :region => region)
      locality_name = LocalityName.create(:name => "Varennes", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Varennes", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 25789, :region => region)
      locality_name = LocalityName.create(:name => "Vaudreuil-Dorion", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Vaudreuil-Dorion", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 40486, :region => region)
      locality_name = LocalityName.create(:name => "Victoriaville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Victoriaville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 2696, :region => region)
      locality_name = LocalityName.create(:name => "Ville-Marie", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Ville-Marie", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4804, :region => region)
      locality_name = LocalityName.create(:name => "Warwick", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Warwick", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 4054, :region => region)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 1926, :region => region)
      locality_name = LocalityName.create(:name => "Waterville", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Waterville", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 20494, :region => region)
      locality_name = LocalityName.create(:name => "Westmount", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Westmount", :locale => fr, :locality => locality)

    locality = Locality.create(:rank => 5239, :region => region)
      locality_name = LocalityName.create(:name => "Windsor", :locale => en, :locality => locality)
      locality_name = LocalityName.create(:name => "Windsor", :locale => fr, :locality => locality)