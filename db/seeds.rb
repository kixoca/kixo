# encoding: UTF-8

# locales
Locale.destroy_all

locale_en = Locale.create(:name => "English", :code => "en")
locale_fr = Locale.create(:name => "Français", :code => "fr")

# ratings
Rating.destroy_all
  RatingName.destroy_all

rating = Rating.create()
  rating_name = RatingName.create(:name => "Excellent", :locale => locale_en, :rating => rating)
  rating_name = RatingName.create(:name => "Excellent", :locale => locale_fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Good", :locale => locale_en, :rating => rating)
  rating_name = RatingName.create(:name => "Bien", :locale => locale_fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Average", :locale => locale_en, :rating => rating)
  rating_name = RatingName.create(:name => "Moyen", :locale => locale_fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Poor", :locale => locale_en, :rating => rating)
  rating_name = RatingName.create(:name => "Médiocre", :locale => locale_fr, :rating => rating)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Disappointing", :locale => locale_en, :rating => rating)
  rating_name = RatingName.create(:name => "Décevant", :locale => locale_fr, :rating => rating)

# question statuses
QuestionStatus.destroy_all
  QuestionStatusName.destroy_all

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Open", :locale => locale_en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Ouverte", :locale => locale_fr, :question_status => question_status)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Answered", :locale => locale_en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Répondue", :locale => locale_fr, :question_status => question_status)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Closed", :locale => locale_en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Fermée", :locale => locale_fr, :question_status => question_status)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Denied", :locale => locale_en, :question_status => question_status)
  question_status_name = QuestionStatusName.create(:name => "Refusée", :locale => locale_fr, :question_status => question_status)

# question visibilities
QuestionVisibility.destroy_all
  QuestionVisibilityName.destroy_all

question_visibility = QuestionVisibility.create()
  question_visibility_name = QuestionVisibilityName.create(:name => "Public", :locale => locale_en, :question_visibility => question_visibility)
  question_visibility_name = QuestionVisibilityName.create(:name => "Publique", :locale => locale_fr, :question_visibility => question_visibility)

question_visibility = QuestionVisibility.create()
  question_visibility_name = QuestionVisibilityName.create(:name => "Private", :locale => locale_en, :question_visibility => question_visibility)
  question_visibility_name = QuestionVisibilityName.create(:name => "Privée", :locale => locale_fr, :question_visibility => question_visibility)

# guide statuses
GuideStatus.destroy_all
  GuideStatusName.destroy_all

guide_status = GuideStatus.create()
  guide_status_name = GuideStatusName.create(:name => "Published", :locale => locale_en, :guide_status => guide_status)
  guide_status_name = GuideStatusName.create(:name => "Publié", :locale => locale_fr, :guide_status => guide_status)

guide_status = GuideStatus.create()
  guide_status_name = GuideStatusName.create(:name => "Draft", :locale => locale_en, :guide_status => guide_status)
  guide_status_name = GuideStatusName.create(:name => "Brouillon", :locale => locale_fr, :guide_status => guide_status)

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
  category_name = CategoryName.create(:name => "Legal", :locale => locale_en, :category => category)
  category_name = CategoryName.create(:name => "Juridique", :locale => locale_fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Business", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Corporatif", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Car Accidents", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Accidents automobiles", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Child Custody", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Garde des enfants", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Child Support", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Pension alimentaire", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Criminal Defense", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Défense pénale", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Divorce", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Séparation", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "DUI", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Alcool au volant", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Employment", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Emploi", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Family", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Famille", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Foreclosure", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Éviction", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Immigration", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Immigration", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mariage", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Mariage", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Personal Injury", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Blessures", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Real Estate", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Immobilier", :locale => locale_fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Attorney", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Mandataire", :locale => locale_fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Lawyer", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Avocat(e)", :locale => locale_fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Paralegal", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Technicien(ne) juridique", :locale => locale_fr, :profession => profession)

category = Category.create()
  category_name = CategoryName.create(:name => "Health", :locale => locale_en, :category => category)
  category_name = CategoryName.create(:name => "Santé", :locale => locale_fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Acne", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Acné", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Angina", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Angine", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Asthma", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Asthme", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Botox", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Botox", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Breast Augmentations", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Augmentations mammaires", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Cataract", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Cataracte", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Cervical Cancer", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Cancer du col utérin", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Face Lift", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Lifting facial", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "HPV", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "VPH", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Invisalign", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Invisalign", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "LASIK", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "LASIK", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Liposuction", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Liposuccion", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Melanoma", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Mélanome", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Pregnancy", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Grossesse", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Rhinoplasty", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Rhinoplastie", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Root Canal", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Traitement de canal", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Teeth Whitening", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Blanchiment des dents", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Tummy Tuck", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Abdominoplastie", :locale => locale_fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Doctor", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Médecin", :locale => locale_fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Nurse", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Infirmière", :locale => locale_fr, :profession => profession)

category = Category.create()
  category_name = CategoryName.create(:name => "Finance", :locale => locale_en, :category => category)
  category_name = CategoryName.create(:name => "Finances", :locale => locale_fr, :category => category)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Accounting", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Comptabilité", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Bankruptcy and Insolvency", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Faillite et insolvabilité", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Bookkeeping", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Tenue de livres", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Credit", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Crédit", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Estates", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Propriétés", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Franchise", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Franchise", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Investment", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Investissement", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mortgage", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Hypothèque", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Mutual Funds", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Fonds mutuels", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Payroll", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Paie", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Personal Finance", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Finances personnelles", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Stocks", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Actions", :locale => locale_fr, :topic => topic)

  topic = Topic.create(:category => category)
    topic_name = TopicName.create(:name => "Taxes", :locale => locale_en, :topic => topic)
    topic_name = TopicName.create(:name => "Impôts", :locale => locale_fr, :topic => topic)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Accountant", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Comptable", :locale => locale_fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Bankruptcy Trustee", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Syndic de faillite", :locale => locale_fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Investment Broker", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Courtier d'investissement", :locale => locale_fr, :profession => profession)

  profession = Profession.create(:category => category)
    profession_name = ProfessionName.create(:name => "Real Estate Broker", :locale => locale_en, :profession => profession)
    profession_name = ProfessionName.create(:name => "Courtier immobilier", :locale => locale_fr, :profession => profession)

# countries, regions, and localities
Country.destroy_all
  Region.destroy_all
    Locality.destroy_all

country = Country.create()
  country_name = CountryName.create(:name => "Canada", :locale => locale_en, :country => country)
  country_name = CountryName.create(:name => "Canada", :locale => locale_fr, :country => country)

  region = Region.create(:country => country)
    region_name = RegionName.create(:name => "Ontario", :locale => locale_en, :region => region)
    region_name = RegionName.create(:name => "Ontario", :locale => locale_fr, :region => region)

    locality = Locality.create(:population => 128430, :region => region)
      locality_name = LocalityName.create(:name => "Barrie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Barrie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:name => "", :population => 48821, :region => region)
      locality_name = LocalityName.create(:name => "Belleville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Belleville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 433806, :region => region)
      locality_name = LocalityName.create(:name => "Brampton", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brampton", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 34415, :region => region)
      locality_name = LocalityName.create(:name => "Brant", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brant", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 90192, :region => region)
      locality_name = LocalityName.create(:name => "Brantford", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brantford", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 21957, :region => region)
      locality_name = LocalityName.create(:name => "Brockville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brockville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 164415, :region => region)
      locality_name = LocalityName.create(:name => "Burlington", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Burlington", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 120371, :region => region)
      locality_name = LocalityName.create(:name => "Cambridge", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cambridge", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 108177, :region => region)
      locality_name = LocalityName.create(:name => "Chatham-Kent", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chatham-Kent", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 20790, :region => region)
      locality_name = LocalityName.create(:name => "Clarence-Rockland", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Clarence-Rockland", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 45965, :region => region)
      locality_name = LocalityName.create(:name => "Cornwall", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cornwall", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 8195, :region => region)
      locality_name = LocalityName.create(:name => "Dryden", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dryden", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11549, :region => region)
      locality_name = LocalityName.create(:name => "Elliot Lake", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Elliot Lake", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 157857, :region => region)
      locality_name = LocalityName.create(:name => "Greater Sudbury", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Greater Sudbury", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 114943, :region => region)
      locality_name = LocalityName.create(:name => "Guelph", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Guelph", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 45212, :region => region)
      locality_name = LocalityName.create(:name => "Haldimand County", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Haldimand County", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 504559, :region => region)
      locality_name = LocalityName.create(:name => "Hamilton", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Hamilton", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 74561, :region => region)
      locality_name = LocalityName.create(:name => "Kawartha Lakes", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kawartha Lakes", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 15177, :region => region)
      locality_name = LocalityName.create(:name => "Kenora", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kenora", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 117207, :region => region)
      locality_name = LocalityName.create(:name => "Kingston", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kingston", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 204668, :region => region)
      locality_name = LocalityName.create(:name => "Kitchener", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kitchener", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 352395, :region => region)
      locality_name = LocalityName.create(:name => "London", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "London", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 261573, :region => region)
      locality_name = LocalityName.create(:name => "Markham", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Markham", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 668549, :region => region)
      locality_name = LocalityName.create(:name => "Mississauga", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mississauga", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 82184, :region => region)
      locality_name = LocalityName.create(:name => "Niagara Falls", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Niagara Falls", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 60847, :region => region)
      locality_name = LocalityName.create(:name => "Norfolk County", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Norfolk County", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 53966, :region => region)
      locality_name = LocalityName.create(:name => "North Bay", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "North Bay", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 30259, :region => region)
      locality_name = LocalityName.create(:name => "Orillia", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Orillia", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 141590, :region => region)
      locality_name = LocalityName.create(:name => "Oshawa", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Oshawa", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 812129, :region => region)
      locality_name = LocalityName.create(:name => "Ottawa", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Ottawa", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 21753, :region => region)
      locality_name = LocalityName.create(:name => "Owen Sound", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Owen Sound", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 13930, :region => region)
      locality_name = LocalityName.create(:name => "Pembroke", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pembroke", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 74898, :region => region)
      locality_name = LocalityName.create(:name => "Peterborough", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Peterborough", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 87838, :region => region)
      locality_name = LocalityName.create(:name => "Pickering", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pickering", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 25496, :region => region)
      locality_name = LocalityName.create(:name => "Prince Edward County", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Prince Edward County", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 18599, :region => region)
      locality_name = LocalityName.create(:name => "Port Colborne", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Port Colborne", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 42697, :region => region)
      locality_name = LocalityName.create(:name => "Quinte West", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Quinte West", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 71419, :region => region)
      locality_name = LocalityName.create(:name => "Sarnia", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sarnia", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 74948, :region => region)
      locality_name = LocalityName.create(:name => "Sault Ste. Marie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sault Ste. Marie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 131989, :region => region)
      locality_name = LocalityName.create(:name => "St. Catharines", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "St. Catharines", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 36110, :region => region)
      locality_name = LocalityName.create(:name => "St. Thomas", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "St. Thomas", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 30461, :region => region)
      locality_name = LocalityName.create(:name => "Stratford", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Stratford", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 10442, :region => region)
      locality_name = LocalityName.create(:name => "Temiskaming Shores", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Temiskaming Shores", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 18224, :region => region)
      locality_name = LocalityName.create(:name => "Thorold", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thorold", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 109140, :region => region)
      locality_name = LocalityName.create(:name => "Thunder Bay", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thunder Bay", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 42997, :region => region)
      locality_name = LocalityName.create(:name => "Timmins", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Timmins", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2503281, :region => region)
      locality_name = LocalityName.create(:name => "Toronto", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Toronto", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 238866, :region => region)
      locality_name = LocalityName.create(:name => "Vaughan", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Vaughan", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 97475, :region => region)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 50331, :region => region)
      locality_name = LocalityName.create(:name => "Welland", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Welland", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 216473, :region => region)
      locality_name = LocalityName.create(:name => "Windsor", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Windsor", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 35480, :region => region)
      locality_name = LocalityName.create(:name => "Woodstock", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Woodstock", :locale => locale_fr, :locality => locality)

  region = Region.create(:country => country)
    region_name = RegionName.create(:name => "Quebec", :locale => locale_en, :region => region)
    region_name = RegionName.create(:name => "Québec", :locale => locale_fr, :region => region)

    locality = Locality.create(:population => 7797, :region => region)
      locality_name = LocalityName.create(:name => "Acton Vale", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Acton Vale", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 29998, :region => region)
      locality_name = LocalityName.create(:name => "Alma", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Alma", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 12584, :region => region)
      locality_name = LocalityName.create(:name => "Amos", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Amos", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6261, :region => region)
      locality_name = LocalityName.create(:name => "Amqui", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Amqui", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6819, :region => region)
      locality_name = LocalityName.create(:name => "Asbestos", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Asbestos", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 22554, :region => region)
      locality_name = LocalityName.create(:name => "Baie-Comeau", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Baie-Comeau", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3902, :region => region)
      locality_name = LocalityName.create(:name => "Baie-d'Urfé", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Baie-d'Urfé", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7288, :region => region)
      locality_name = LocalityName.create(:name => "Baie-Saint-Paul", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Baie-Saint-Paul", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 87, :region => region)
      locality_name = LocalityName.create(:name => "Barkmere", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Barkmere", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 19194, :region => region)
      locality_name = LocalityName.create(:name => "Beaconsfield", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beaconsfield", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6226, :region => region)
      locality_name = LocalityName.create(:name => "Beauceville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beauceville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11918, :region => region)
      locality_name = LocalityName.create(:name => "Beauharnois", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beauharnois", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3006, :region => region)
      locality_name = LocalityName.create(:name => "Beaupré", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beaupré", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11134, :region => region)
      locality_name = LocalityName.create(:name => "Bécancour", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bécancour", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2612, :region => region)
      locality_name = LocalityName.create(:name => "Bedford", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bedford", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 350, :region => region)
      locality_name = LocalityName.create(:name => "Belleterre", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Belleterre", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 18927, :region => region)
      locality_name = LocalityName.create(:name => "Beloeil", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Beloeil", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4007, :region => region)
      locality_name = LocalityName.create(:name => "Berthierville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Berthierville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 46493, :region => region)
      locality_name = LocalityName.create(:name => "Blainville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Blainville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 8383, :region => region)
      locality_name = LocalityName.create(:name => "Bois-des-Filion", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bois-des-Filion", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 26483, :region => region)
      locality_name = LocalityName.create(:name => "Boisbriand", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Boisbriand", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2673, :region => region)
      locality_name = LocalityName.create(:name => "Bonaventure", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bonaventure", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 39062, :region => region)
      locality_name = LocalityName.create(:name => "Boucherville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Boucherville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5629, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Brome", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Brome", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6049, :region => region)
      locality_name = LocalityName.create(:name => "Bromont", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Bromont", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 71154, :region => region)
      locality_name = LocalityName.create(:name => "Brossard", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brossard", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6664, :region => region)
      locality_name = LocalityName.create(:name => "Brownsburg-Chatham", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Brownsburg-Chatham", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 15947, :region => region)
      locality_name = LocalityName.create(:name => "Candiac", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Candiac", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2777, :region => region)
      locality_name = LocalityName.create(:name => "Cap-Chat", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cap-Chat", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2666, :region => region)
      locality_name = LocalityName.create(:name => "Cap-Santé", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cap-Santé", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7426, :region => region)
      locality_name = LocalityName.create(:name => "Carignan", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Carignan", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4077, :region => region)
      locality_name = LocalityName.create(:name => "Carleton-sur-Mer", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Carleton-sur-Mer", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2556, :region => region)
      locality_name = LocalityName.create(:name => "Causapscal", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Causapscal", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 22608, :region => region)
      locality_name = LocalityName.create(:name => "Chambly", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chambly", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7914, :region => region)
      locality_name = LocalityName.create(:name => "Chandler", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chandler", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1630, :region => region)
      locality_name = LocalityName.create(:name => "Chapais", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chapais", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5594, :region => region)
      locality_name = LocalityName.create(:name => "Charlemagne", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Charlemagne", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 42786, :region => region)
      locality_name = LocalityName.create(:name => "Châteauguay", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Châteauguay", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3563, :region => region)
      locality_name = LocalityName.create(:name => "Château-Richer", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Château-Richer", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7563, :region => region)
      locality_name = LocalityName.create(:name => "Chibougamau", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Chibougamau", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3041, :region => region)
      locality_name = LocalityName.create(:name => "Clermont", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Clermont", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9204, :region => region)
      locality_name = LocalityName.create(:name => "Coaticook", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Coaticook", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5678, :region => region)
      locality_name = LocalityName.create(:name => "Contrecoeur", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Contrecoeur", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5004, :region => region)
      locality_name = LocalityName.create(:name => "Cookshire-Eaton", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cookshire-Eaton", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 31395, :region => region)
      locality_name = LocalityName.create(:name => "Côte Saint-Luc", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Côte-Saint-Luc", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6842, :region => region)
      locality_name = LocalityName.create(:name => "Coteau-du-Lac", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Coteau-du-Lac", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 12182, :region => region)
      locality_name = LocalityName.create(:name => "Cowansville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Cowansville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4041, :region => region)
      locality_name = LocalityName.create(:name => "Danville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Danville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1005, :region => region)
      locality_name = LocalityName.create(:name => "Daveluyville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Daveluyville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3209, :region => region)
      locality_name = LocalityName.create(:name => "Dégelis", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dégelis", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7322, :region => region)
      locality_name = LocalityName.create(:name => "Delson", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Delson", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1074, :region => region)
      locality_name = LocalityName.create(:name => "Desbiens", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Desbiens", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 17402, :region => region)
      locality_name = LocalityName.create(:name => "Deux-Montagnes", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Deux-Montagnes", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2570, :region => region)
      locality_name = LocalityName.create(:name => "Disraeli", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Disraeli", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 14546, :region => region)
      locality_name = LocalityName.create(:name => "Dolbeau-Mistassini", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dolbeau-Mistassini", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 48930, :region => region)
      locality_name = LocalityName.create(:name => "Dollard-des-Ormeaux", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dollard-des-Ormeaux", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5564, :region => region)
      locality_name = LocalityName.create(:name => "Donnacona", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Donnacona", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 18088, :region => region)
      locality_name = LocalityName.create(:name => "Dorval", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dorval", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 67392, :region => region)
      locality_name = LocalityName.create(:name => "Drummondville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Drummondville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3396, :region => region)
      locality_name = LocalityName.create(:name => "Dunham", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Dunham", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 650, :region => region)
      locality_name = LocalityName.create(:name => "Duparquet", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Duparquet", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3357, :region => region)
      locality_name = LocalityName.create(:name => "East Angus", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "East Angus", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 256, :region => region)
      locality_name = LocalityName.create(:name => "Estérel", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Estérel", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7809, :region => region)
      locality_name = LocalityName.create(:name => "Farnham", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Farnham", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2633, :region => region)
      locality_name = LocalityName.create(:name => "Fermont", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Fermont", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3543, :region => region)
      locality_name = LocalityName.create(:name => "Forestville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Forestville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1532, :region => region)
      locality_name = LocalityName.create(:name => "Fossambault-sur-le-Lac", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Fossambault-sur-le-Lac", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 14819, :region => region)
      locality_name = LocalityName.create(:name => "Gaspé", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Gaspé", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 242124, :region => region)
      locality_name = LocalityName.create(:name => "Gatineau", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Gatineau", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2439, :region => region)
      locality_name = LocalityName.create(:name => "Gracefield", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Gracefield", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 47637, :region => region)
      locality_name = LocalityName.create(:name => "Granby", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Granby", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3409, :region => region)
      locality_name = LocalityName.create(:name => "Grande-Rivière", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Grande-Rivière", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6996, :region => region)
      locality_name = LocalityName.create(:name => "Hampstead", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Hampstead", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5088, :region => region)
      locality_name = LocalityName.create(:name => "Hudson", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Hudson", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2587, :region => region)
      locality_name = LocalityName.create(:name => "Huntingdon", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Huntingdon", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 19045, :region => region)
      locality_name = LocalityName.create(:name => "Joliette", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Joliette", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2086, :region => region)
      locality_name = LocalityName.create(:name => "Kingsey Falls", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kingsey Falls", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 20491, :region => region)
      locality_name = LocalityName.create(:name => "Kirkland", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Kirkland", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 16516, :region => region)
      locality_name = LocalityName.create(:name => "L'Ancienne-Lorette", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Ancienne-Lorette", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 16738, :region => region)
      locality_name = LocalityName.create(:name => "L'Assomption", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Assomption", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4606, :region => region)
      locality_name = LocalityName.create(:name => "L'Épiphanie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Épiphanie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 128, :region => region)
      locality_name = LocalityName.create(:name => "L'Île-Cadieux", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Île-Cadieux", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 59, :region => region)
      locality_name = LocalityName.create(:name => "L'Île-Dorval", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Île-Dorval", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9927, :region => region)
      locality_name = LocalityName.create(:name => "L'Île-Perrot", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "L'Île-Perrot", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 8959, :region => region)
      locality_name = LocalityName.create(:name => "La Malbaie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Malbaie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4575, :region => region)
      locality_name = LocalityName.create(:name => "La Pocatière", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Pocatière", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 21763, :region => region)
      locality_name = LocalityName.create(:name => "La Prairie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Prairie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7336, :region => region)
      locality_name = LocalityName.create(:name => "La Sarre", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Sarre", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11821, :region => region)
      locality_name = LocalityName.create(:name => "La Tuque", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "La Tuque", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 530, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Delage", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Delage", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5967, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Mégantic", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Mégantic", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 266, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Saint-Joseph", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Saint-Joseph", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 423, :region => region)
      locality_name = LocalityName.create(:name => "Lac-Sergent", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lac-Sergent", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11832, :region => region)
      locality_name = LocalityName.create(:name => "Lachute", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lachute", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 376845, :region => region)
      locality_name = LocalityName.create(:name => "Laval", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Laval", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 12112, :region => region)
      locality_name = LocalityName.create(:name => "Lavaltrie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lavaltrie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2729, :region => region)
      locality_name = LocalityName.create(:name => "Lebel-sur-Quévillon", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lebel-sur-Quévillon", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2385, :region => region)
      locality_name = LocalityName.create(:name => "Léry", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Léry", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 130006, :region => region)
      locality_name = LocalityName.create(:name => "Lévis", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lévis", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 229330, :region => region)
      locality_name = LocalityName.create(:name => "Longueuil", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Longueuil", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9613, :region => region)
      locality_name = LocalityName.create(:name => "Lorraine", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Lorraine", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7433, :region => region)
      locality_name = LocalityName.create(:name => "Louiseville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Louiseville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2726, :region => region)
      locality_name = LocalityName.create(:name => "Macamic", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Macamic", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 23880, :region => region)
      locality_name = LocalityName.create(:name => "Magog", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Magog", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3640, :region => region)
      locality_name = LocalityName.create(:name => "Malartic", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Malartic", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4102, :region => region)
      locality_name = LocalityName.create(:name => "Maniwaki", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Maniwaki", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7904, :region => region)
      locality_name = LocalityName.create(:name => "Marieville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Marieville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 34626, :region => region)
      locality_name = LocalityName.create(:name => "Mascouche", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mascouche", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1555, :region => region)
      locality_name = LocalityName.create(:name => "Matagami", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Matagami", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 14742, :region => region)
      locality_name = LocalityName.create(:name => "Matane", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Matane", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 10121, :region => region)
      locality_name = LocalityName.create(:name => "Mercier", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mercier", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4084, :region => region)
      locality_name = LocalityName.create(:name => "Métabetchouan–Lac-à-la-Croix", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Métabetchouan–Lac-à-la-Croix", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 604, :region => region)
      locality_name = LocalityName.create(:name => "Métis-sur-Mer", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Métis-sur-Mer", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 34626, :region => region)
      locality_name = LocalityName.create(:name => "Mirabel", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mirabel", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6568, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Joli", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Joli", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 13405, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Laurier", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Laurier", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 15720, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Saint-Hilaire", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Saint-Hilaire", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 8892, :region => region)
      locality_name = LocalityName.create(:name => "Mont-Tremblant", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Tremblant", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11724, :region => region)
      locality_name = LocalityName.create(:name => "Montmagny", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montmagny", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1620693, :region => region)
      locality_name = LocalityName.create(:name => "Montreal", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montréal", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3822, :region => region)
      locality_name = LocalityName.create(:name => "Montreal East", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montréal-Est", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5184, :region => region)
      locality_name = LocalityName.create(:name => "Montreal West", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Montréal-Ouest", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 18933, :region => region)
      locality_name = LocalityName.create(:name => "Mount Royal", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Mont-Royal", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 812, :region => region)
      locality_name = LocalityName.create(:name => "Murdochville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Murdochville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3638, :region => region)
      locality_name = LocalityName.create(:name => "Neuville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Neuville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3748, :region => region)
      locality_name = LocalityName.create(:name => "New Richmond", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "New Richmond", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7827, :region => region)
      locality_name = LocalityName.create(:name => "Nicolet", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Nicolet", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3220, :region => region)
      locality_name = LocalityName.create(:name => "Normandin", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Normandin", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9885, :region => region)
      locality_name = LocalityName.create(:name => "Notre-Dame-de-l'Île-Perrot", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Notre-Dame-de-l'Île-Perrot", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 8230, :region => region)
      locality_name = LocalityName.create(:name => "Notre-Dame-des-Prairies", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Notre-Dame-des-Prairies", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 8464, :region => region)
      locality_name = LocalityName.create(:name => "Otterburn Park", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Otterburn Park", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3159, :region => region)
      locality_name = LocalityName.create(:name => "Paspébiac", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Paspébiac", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3419, :region => region)
      locality_name = LocalityName.create(:name => "Percé", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Percé", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11197, :region => region)
      locality_name = LocalityName.create(:name => "Pincourt", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pincourt", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6677, :region => region)
      locality_name = LocalityName.create(:name => "Plessisville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Plessisville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2940, :region => region)
      locality_name = LocalityName.create(:name => "Pohénégamook", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pohénégamook", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 30161, :region => region)
      locality_name = LocalityName.create(:name => "Pointe-Claire", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pointe-Claire", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 7518, :region => region)
      locality_name = LocalityName.create(:name => "Pont-Rouge", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Pont-Rouge", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6758, :region => region)
      locality_name = LocalityName.create(:name => "Port-Cartier", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Port-Cartier", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3086, :region => region)
      locality_name = LocalityName.create(:name => "Portneuf", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Portneuf", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5571, :region => region)
      locality_name = LocalityName.create(:name => "Princeville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Princeville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 10132, :region => region)
      locality_name = LocalityName.create(:name => "Prévost", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Prévost", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 659545, :region => region)
      locality_name = LocalityName.create(:name => "Quebec City", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Québec", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 76237, :region => region)
      locality_name = LocalityName.create(:name => "Repentigny", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Repentigny", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5208, :region => region)
      locality_name = LocalityName.create(:name => "Richelieu", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Richelieu", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3336, :region => region)
      locality_name = LocalityName.create(:name => "Richmond", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Richmond", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 42240, :region => region)
      locality_name = LocalityName.create(:name => "Rimouski", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rimouski", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 18586, :region => region)
      locality_name = LocalityName.create(:name => "Rivière-du-Loup", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rivière-du-Loup", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4152, :region => region)
      locality_name = LocalityName.create(:name => "Rivière-Rouge", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rivière-Rouge", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 10544, :region => region)
      locality_name = LocalityName.create(:name => "Roberval", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Roberval", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 14173, :region => region)
      locality_name = LocalityName.create(:name => "Rosemère", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rosemère", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 39924, :region => region)
      locality_name = LocalityName.create(:name => "Rouyn-Noranda", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Rouyn-Noranda", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 143692, :region => region)
      locality_name = LocalityName.create(:name => "Saguenay", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saguenay", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 10634, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Adèle", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Adèle", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9679, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Agathe-des-Monts", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Agathe-des-Monts", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2803, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Beaupré", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Beaupré", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5197, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Bellevue", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Bellevue", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6772, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Monts", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Monts", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 13001, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Plaines", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Plaines", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 17281, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Augustin-de-Desmaures", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Augustin-de-Desmaures", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2560, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Basile", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Basile", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 15605, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Basile-le-Grand", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Basile-le-Grand", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 24388, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Bruno-de-Montarville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Bruno-de-Montarville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 16211, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Catherine", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Catherine", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5021, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5151, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Césaire", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Césaire", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 13080, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Colomban", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Colomban", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 23957, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Constant", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Constant", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 42062, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Eustache", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Eustache", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 10477, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Félicien", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Félicien", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2828, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Gabriel", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Gabriel", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 30113, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Georges", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Georges", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 55823, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Hyacinthe", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Hyacinthe", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 87492, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Jean-sur-Richelieu", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Jean-sur-Richelieu", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 63729, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Jérôme", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Jérôme", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4454, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Beauce", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Beauce", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1686, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Sorel", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Sorel", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 29019, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Julie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Julie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 21599, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Lambert", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Lambert", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 17016, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Lazare", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Lazare", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 14159, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Lin–Laurentides", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Lin–Laurentides", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2774, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Marc-des-Carrières", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Marc-des-Carrières", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2498, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Marguerite-du-Lac-Masson", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Marguerite-du-Lac-Masson", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11584, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Marie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Marie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 11311, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Marthe-sur-le-Lac", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Marthe-sur-le-Lac", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1700, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Ours", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Ours", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2704, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Pamphile", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Pamphile", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3504, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Pascal", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Pascal", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5109, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Pie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Pie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9273, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Raymond", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Raymond", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 6136, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Rémi", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Rémi", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 9191, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Sauveur", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Sauveur", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 25224, :region => region)
      locality_name = LocalityName.create(:name => "Sainte-Thérèse", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sainte-Thérèse", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3826, :region => region)
      locality_name = LocalityName.create(:name => "Saint-Tite", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Saint-Tite", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 39672, :region => region)
      locality_name = LocalityName.create(:name => "Salaberry-de-Valleyfield", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Salaberry-de-Valleyfield", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 202, :region => region)
      locality_name = LocalityName.create(:name => "Schefferville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Schefferville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 588, :region => region)
      locality_name = LocalityName.create(:name => "Scotstown", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Scotstown", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2993, :region => region)
      locality_name = LocalityName.create(:name => "Senneterre", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Senneterre", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 27827, :region => region)
      locality_name = LocalityName.create(:name => "Sept-Îles", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sept-Îles", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 51904, :region => region)
      locality_name = LocalityName.create(:name => "Shawinigan", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Shawinigan", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 186952, :region => region)
      locality_name = LocalityName.create(:name => "Sherbrooke", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sherbrooke", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 34076, :region => region)
      locality_name = LocalityName.create(:name => "Sorel-Tracy", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sorel-Tracy", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2957, :region => region)
      locality_name = LocalityName.create(:name => "Stanstead", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Stanstead", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3805, :region => region)
      locality_name = LocalityName.create(:name => "Sutton", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Sutton", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2697, :region => region)
      locality_name = LocalityName.create(:name => "Témiscaming", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Témiscaming", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => , :region => region)
      locality_name = LocalityName.create(:name => "Témiscouata-sur-le-Lac", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Témiscouata-sur-le-Lac", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 94703, :region => region)
      locality_name = LocalityName.create(:name => "Terrebonne", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Terrebonne", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 25704, :region => region)
      locality_name = LocalityName.create(:name => "Thetford Mines", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thetford Mines", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2299, :region => region)
      locality_name = LocalityName.create(:name => "Thurso", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Thurso", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 3500, :region => region)
      locality_name = LocalityName.create(:name => "Trois-Pistoles", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Trois-Pistoles", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 129100, :region => region)
      locality_name = LocalityName.create(:name => "Trois-Rivières", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Trois-Rivières", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 31123, :region => region)
      locality_name = LocalityName.create(:name => "Val-d'Or", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Val-d'Or", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2349, :region => region)
      locality_name = LocalityName.create(:name => "Valcourt", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Valcourt", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 20950, :region => region)
      locality_name = LocalityName.create(:name => "Varennes", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Varennes", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 25789, :region => region)
      locality_name = LocalityName.create(:name => "Vaudreuil-Dorion", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Vaudreuil-Dorion", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 40486, :region => region)
      locality_name = LocalityName.create(:name => "Victoriaville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Victoriaville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 2696, :region => region)
      locality_name = LocalityName.create(:name => "Ville-Marie", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Ville-Marie", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4804, :region => region)
      locality_name = LocalityName.create(:name => "Warwick", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Warwick", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 4054, :region => region)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Waterloo", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 1926, :region => region)
      locality_name = LocalityName.create(:name => "Waterville", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Waterville", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 20494, :region => region)
      locality_name = LocalityName.create(:name => "Westmount", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Westmount", :locale => locale_fr, :locality => locality)

    locality = Locality.create(:population => 5239, :region => region)
      locality_name = LocalityName.create(:name => "Windsor", :locale => locale_en, :locality => locality)
      locality_name = LocalityName.create(:name => "Windsor", :locale => locale_fr, :locality => locality)