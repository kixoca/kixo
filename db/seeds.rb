# encoding: UTF-8

# locales
Locale.destroy_all

en = Locale.create(:name => "English", :code => "en")
fr = Locale.create(:name => "Français", :code => "fr")

# ratings
Rating.destroy_all
  RatingName.destroy_all

rating = Rating.create()
  rating_name = RatingName.create(:name => "Excellent", :locale_id => en.id, :rating_id => rating.id)
  rating_name = RatingName.create(:name => "Excellent", :locale_id => fr.id, :rating_id => rating.id)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Good", :locale_id => en.id, :rating_id => rating.id)
  rating_name = RatingName.create(:name => "Bien", :locale_id => fr.id, :rating_id => rating.id)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Average", :locale_id => en.id, :rating_id => rating.id)
  rating_name = RatingName.create(:name => "Moyen", :locale_id => fr.id, :rating_id => rating.id)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Poor", :locale_id => en.id, :rating_id => rating.id)
  rating_name = RatingName.create(:name => "Médiocre", :locale_id => fr.id, :rating_id => rating.id)

rating = Rating.create()
  rating_name = RatingName.create(:name => "Disappointing", :locale_id => en.id, :rating_id => rating.id)
  rating_name = RatingName.create(:name => "Décevant", :locale_id => fr.id, :rating_id => rating.id)

# question statuses
QuestionStatus.destroy_all
  QuestionStatusName.destroy_all

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Open", :locale_id => en.id, :question_status_id => question_status.id)
  question_status_name = QuestionStatusName.create(:name => "Ouverte", :locale_id => fr.id, :question_status_id => question_status.id)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Answered", :locale_id => en.id, :question_status_id => question_status.id)
  question_status_name = QuestionStatusName.create(:name => "Répondue", :locale_id => fr.id, :question_status_id => question_status.id)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Closed", :locale_id => en.id, :question_status_id => question_status.id)
  question_status_name = QuestionStatusName.create(:name => "Fermée", :locale_id => fr.id, :question_status_id => question_status.id)

question_status = QuestionStatus.create()
  question_status_name = QuestionStatusName.create(:name => "Denied", :locale_id => en.id, :question_status_id => question_status.id)
  question_status_name = QuestionStatusName.create(:name => "Refusée", :locale_id => fr.id, :question_status_id => question_status.id)

# question visibilities
QuestionVisibility.destroy_all
  QuestionVisibilityName.destroy_all

question_visibility = QuestionVisibility.create()
  question_visibility_name = QuestionVisibilityName.create(:name => "Public", :locale_id => en.id, :question_visibility_id => question_visibility.id)
  question_visibility_name = QuestionVisibilityName.create(:name => "Publique", :locale_id => fr.id, :question_visibility_id => question_visibility.id)

question_visibility = QuestionVisibility.create()
  question_visibility_name = QuestionVisibilityName.create(:name => "Private", :locale_id => en.id, :question_visibility_id => question_visibility.id)
  question_visibility_name = QuestionVisibilityName.create(:name => "Privée", :locale_id => fr.id, :question_visibility_id => question_visibility.id)

# guide statuses
GuideStatus.destroy_all
  GuideStatusName.destroy_all

guide_status = GuideStatus.create()
  guide_status_name = GuideStatusName.create(:name => "Published", :locale_id => en.id, :guide_status_id => guide_status.id)
  guide_status_name = GuideStatusName.create(:name => "Publié", :locale_id => fr.id, :guide_status_id => guide_status.id)

guide_status = GuideStatus.create()
  guide_status_name = GuideStatusName.create(:name => "Draft", :locale_id => en.id, :guide_status_id => guide_status.id)
  guide_status_name = GuideStatusName.create(:name => "Brouillon", :locale_id => fr.id, :guide_status_id => guide_status.id)

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
  category_name = CategoryName.create(:name => "Legal", :locale_id => en.id, :category_id => category.id)
  category_name = CategoryName.create(:name => "Juridique", :locale_id => fr.id, :category_id => category.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Business", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Corporatif", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Car Accidents", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Accidents automobiles", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Child Custody", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Garde des enfants", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Child Support", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Pension alimentaire", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Criminal Defense", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Défense pénale", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Divorce", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Séparation", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "DUI", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Alcool au volant", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Employment", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Emploi", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Family", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Famille", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Foreclosure", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Éviction", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Immigration", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Immigration", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Mariage", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Mariage", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Personal Injury", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Blessures", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Real Estate", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Immobilier", :locale_id => fr.id, :topic_id => topic.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Attorney", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Mandataire", :locale_id => fr.id, :profession_id => profession.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Lawyer", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Avocat(e)", :locale_id => fr.id, :profession_id => profession.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Paralegal", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Technicien(ne) juridique", :locale_id => fr.id, :profession_id => profession.id)

category = Category.create()
  category_name = CategoryName.create(:name => "Health", :locale_id => en.id, :category_id => category.id)
  category_name = CategoryName.create(:name => "Santé", :locale_id => fr.id, :category_id => category.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Acne", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Acné", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Angina", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Angine", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Asthma", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Asthme", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Botox", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Botox", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Breast Augmentations", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Augmentations mammaires", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Cataract", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Cataracte", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Cervical Cancer", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Cancer du col utérin", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Face Lift", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Lifting facial", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "HPV", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "VPH", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Invisalign", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Invisalign", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "LASIK", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "LASIK", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Liposuction", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Liposuccion", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Melanoma", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Mélanome", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Pregnancy", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Grossesse", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Rhinoplasty", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Rhinoplastie", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Root Canal", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Traitement de canal", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Teeth Whitening", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Blanchiment des dents", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Tummy Tuck", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Abdominoplastie", :locale_id => fr.id, :topic_id => topic.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Doctor", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Médecin", :locale_id => fr.id, :profession_id => profession.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Nurse", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Infirmière", :locale_id => fr.id, :profession_id => profession.id)

category = Category.create()
  category_name = CategoryName.create(:name => "Finance", :locale_id => en.id, :category_id => category.id)
  category_name = CategoryName.create(:name => "Finances", :locale_id => fr.id, :category_id => category.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Accounting", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Comptabilité", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Bankruptcy and Insolvency", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Faillite et insolvabilité", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Bookkeeping", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Tenue de livres", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Credit", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Crédit", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Estates", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Propriétés", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Franchise", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Franchise", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Investment", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Investissement", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Mortgage", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Hypothèque", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Mutual Funds", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Fonds mutuels", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Payroll", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Paie", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Personal Finance", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Finances personnelles", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Stocks", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Actions", :locale_id => fr.id, :topic_id => topic.id)

  topic = Topic.create(:category_id => category.id)
    topic_name = TopicName.create(:name => "Taxes", :locale_id => en.id, :topic_id => topic.id)
    topic_name = TopicName.create(:name => "Impôts", :locale_id => fr.id, :topic_id => topic.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Accountant", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Comptable", :locale_id => fr.id, :profession_id => profession.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Bankruptcy Trustee", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Syndic de faillite", :locale_id => fr.id, :profession_id => profession.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Investment Broker", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Courtier d'investissement", :locale_id => fr.id, :profession_id => profession.id)

  profession = Profession.create(:category_id => category.id)
    profession_name = ProfessionName.create(:name => "Real Estate Broker", :locale_id => en.id, :profession_id => profession.id)
    profession_name = ProfessionName.create(:name => "Courtier immobilier", :locale_id => fr.id, :profession_id => profession.id)

# countries, regions, and localities
Country.destroy_all
  CountryName.destroy_all

  Region.destroy_all
    RegionName.destroy_all

    Locality.destroy_all
      LocalityName.destroy_all

country = Country.create()
  country_name = CountryName.create(:name => "Canada", :locale_id => en.id, :country_id => country.id)
  country_name = CountryName.create(:name => "Canada", :locale_id => fr.id, :country_id => country.id)

  region = Region.create(:country_id => country.id)
    region_name = RegionName.create(:name => "Ontario", :locale_id => en.id, :region_id => region.id)
    region_name = RegionName.create(:name => "Ontario", :locale_id => fr.id, :region_id => region.id)

    locality = Locality.create(:population => 128430, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Barrie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Barrie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 48821, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Belleville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Belleville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 433806, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Brampton", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Brampton", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 34415, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Brant", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Brant", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 90192, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Brantford", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Brantford", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 21957, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Brockville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Brockville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 164415, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Burlington", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Burlington", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 120371, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Cambridge", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Cambridge", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 108177, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Chatham-Kent", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Chatham-Kent", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 20790, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Clarence-Rockland", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Clarence-Rockland", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 45965, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Cornwall", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Cornwall", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 8195, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Dryden", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Dryden", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11549, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Elliot Lake", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Elliot Lake", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 157857, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Greater Sudbury", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Greater Sudbury", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 114943, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Guelph", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Guelph", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 45212, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Haldimand County", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Haldimand County", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 504559, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Hamilton", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Hamilton", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 74561, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Kawartha Lakes", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Kawartha Lakes", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 15177, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Kenora", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Kenora", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 117207, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Kingston", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Kingston", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 204668, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Kitchener", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Kitchener", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 352395, :region_id => region.id)
      locality_name = LocalityName.create(:name => "London", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "London", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 261573, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Markham", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Markham", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 668549, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mississauga", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mississauga", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 82184, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Niagara Falls", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Niagara Falls", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 60847, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Norfolk County", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Norfolk County", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 53966, :region_id => region.id)
      locality_name = LocalityName.create(:name => "North Bay", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "North Bay", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 30259, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Orillia", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Orillia", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 141590, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Oshawa", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Oshawa", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 812129, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Ottawa", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Ottawa", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 21753, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Owen Sound", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Owen Sound", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 13930, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Pembroke", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Pembroke", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 74898, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Peterborough", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Peterborough", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 87838, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Pickering", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Pickering", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 25496, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Prince Edward County", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Prince Edward County", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 18599, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Port Colborne", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Port Colborne", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 42697, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Quinte West", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Quinte West", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 71419, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sarnia", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sarnia", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 74948, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sault Ste. Marie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sault Ste. Marie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 131989, :region_id => region.id)
      locality_name = LocalityName.create(:name => "St. Catharines", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "St. Catharines", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 36110, :region_id => region.id)
      locality_name = LocalityName.create(:name => "St. Thomas", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "St. Thomas", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 30461, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Stratford", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Stratford", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 10442, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Temiskaming Shores", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Temiskaming Shores", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 18224, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Thorold", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Thorold", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 109140, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Thunder Bay", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Thunder Bay", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 42997, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Timmins", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Timmins", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2503281, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Toronto", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Toronto", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 238866, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Vaughan", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Vaughan", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 97475, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Waterloo", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Waterloo", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 50331, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Welland", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Welland", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 216473, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Windsor", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Windsor", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 35480, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Woodstock", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Woodstock", :locale_id => fr.id, :locality_id => locality.id)

  region = Region.create(:country_id => country.id)
    region_name = RegionName.create(:name => "Quebec", :locale_id => en.id, :region_id => region.id)
    region_name = RegionName.create(:name => "Québec", :locale_id => fr.id, :region_id => region.id)

    locality = Locality.create(:population => 7797, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Acton Vale", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Acton Vale", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 29998, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Alma", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Alma", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 12584, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Amos", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Amos", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6261, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Amqui", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Amqui", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6819, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Asbestos", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Asbestos", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 22554, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Baie-Comeau", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Baie-Comeau", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3902, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Baie-d'Urfé", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Baie-d'Urfé", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7288, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Baie-Saint-Paul", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Baie-Saint-Paul", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 87, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Barkmere", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Barkmere", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 19194, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Beaconsfield", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Beaconsfield", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6226, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Beauceville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Beauceville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11918, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Beauharnois", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Beauharnois", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3006, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Beaupré", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Beaupré", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11134, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Bécancour", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Bécancour", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2612, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Bedford", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Bedford", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 350, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Belleterre", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Belleterre", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 18927, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Beloeil", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Beloeil", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4007, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Berthierville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Berthierville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 46493, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Blainville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Blainville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 8383, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Bois-des-Filion", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Bois-des-Filion", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 26483, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Boisbriand", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Boisbriand", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2673, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Bonaventure", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Bonaventure", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 39062, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Boucherville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Boucherville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5629, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lac-Brome", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lac-Brome", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6049, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Bromont", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Bromont", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 71154, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Brossard", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Brossard", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6664, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Brownsburg-Chatham", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Brownsburg-Chatham", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 15947, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Candiac", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Candiac", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2777, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Cap-Chat", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Cap-Chat", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2666, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Cap-Santé", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Cap-Santé", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7426, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Carignan", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Carignan", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4077, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Carleton-sur-Mer", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Carleton-sur-Mer", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2556, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Causapscal", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Causapscal", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 22608, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Chambly", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Chambly", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7914, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Chandler", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Chandler", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1630, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Chapais", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Chapais", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5594, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Charlemagne", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Charlemagne", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 42786, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Châteauguay", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Châteauguay", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3563, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Château-Richer", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Château-Richer", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7563, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Chibougamau", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Chibougamau", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3041, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Clermont", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Clermont", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9204, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Coaticook", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Coaticook", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5678, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Contrecoeur", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Contrecoeur", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5004, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Cookshire-Eaton", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Cookshire-Eaton", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 31395, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Côte Saint-Luc", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Côte-Saint-Luc", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6842, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Coteau-du-Lac", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Coteau-du-Lac", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 12182, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Cowansville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Cowansville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4041, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Danville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Danville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1005, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Daveluyville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Daveluyville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3209, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Dégelis", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Dégelis", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7322, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Delson", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Delson", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1074, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Desbiens", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Desbiens", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 17402, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Deux-Montagnes", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Deux-Montagnes", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2570, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Disraeli", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Disraeli", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 14546, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Dolbeau-Mistassini", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Dolbeau-Mistassini", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 48930, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Dollard-des-Ormeaux", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Dollard-des-Ormeaux", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5564, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Donnacona", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Donnacona", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 18088, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Dorval", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Dorval", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 67392, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Drummondville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Drummondville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3396, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Dunham", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Dunham", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 650, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Duparquet", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Duparquet", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3357, :region_id => region.id)
      locality_name = LocalityName.create(:name => "East Angus", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "East Angus", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 256, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Estérel", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Estérel", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7809, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Farnham", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Farnham", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2633, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Fermont", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Fermont", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3543, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Forestville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Forestville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1532, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Fossambault-sur-le-Lac", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Fossambault-sur-le-Lac", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 14819, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Gaspé", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Gaspé", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 242124, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Gatineau", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Gatineau", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2439, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Gracefield", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Gracefield", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 47637, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Granby", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Granby", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3409, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Grande-Rivière", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Grande-Rivière", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6996, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Hampstead", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Hampstead", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5088, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Hudson", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Hudson", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2587, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Huntingdon", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Huntingdon", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 19045, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Joliette", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Joliette", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2086, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Kingsey Falls", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Kingsey Falls", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 20491, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Kirkland", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Kirkland", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 16516, :region_id => region.id)
      locality_name = LocalityName.create(:name => "L'Ancienne-Lorette", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "L'Ancienne-Lorette", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 16738, :region_id => region.id)
      locality_name = LocalityName.create(:name => "L'Assomption", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "L'Assomption", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4606, :region_id => region.id)
      locality_name = LocalityName.create(:name => "L'Épiphanie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "L'Épiphanie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 128, :region_id => region.id)
      locality_name = LocalityName.create(:name => "L'Île-Cadieux", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "L'Île-Cadieux", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 59, :region_id => region.id)
      locality_name = LocalityName.create(:name => "L'Île-Dorval", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "L'Île-Dorval", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9927, :region_id => region.id)
      locality_name = LocalityName.create(:name => "L'Île-Perrot", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "L'Île-Perrot", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 8959, :region_id => region.id)
      locality_name = LocalityName.create(:name => "La Malbaie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "La Malbaie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4575, :region_id => region.id)
      locality_name = LocalityName.create(:name => "La Pocatière", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "La Pocatière", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 21763, :region_id => region.id)
      locality_name = LocalityName.create(:name => "La Prairie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "La Prairie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7336, :region_id => region.id)
      locality_name = LocalityName.create(:name => "La Sarre", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "La Sarre", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11821, :region_id => region.id)
      locality_name = LocalityName.create(:name => "La Tuque", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "La Tuque", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 530, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lac-Delage", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lac-Delage", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5967, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lac-Mégantic", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lac-Mégantic", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 266, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lac-Saint-Joseph", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lac-Saint-Joseph", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 423, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lac-Sergent", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lac-Sergent", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11832, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lachute", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lachute", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 376845, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Laval", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Laval", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 12112, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lavaltrie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lavaltrie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2729, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lebel-sur-Quévillon", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lebel-sur-Quévillon", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2385, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Léry", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Léry", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 130006, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lévis", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lévis", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 229330, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Longueuil", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Longueuil", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9613, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Lorraine", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Lorraine", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7433, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Louiseville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Louiseville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2726, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Macamic", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Macamic", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 23880, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Magog", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Magog", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3640, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Malartic", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Malartic", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4102, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Maniwaki", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Maniwaki", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7904, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Marieville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Marieville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 34626, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mascouche", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mascouche", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1555, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Matagami", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Matagami", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 14742, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Matane", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Matane", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 10121, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mercier", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mercier", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4084, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Métabetchouan–Lac-à-la-Croix", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Métabetchouan–Lac-à-la-Croix", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 604, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Métis-sur-Mer", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Métis-sur-Mer", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 34626, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mirabel", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mirabel", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6568, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mont-Joli", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mont-Joli", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 13405, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mont-Laurier", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mont-Laurier", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 15720, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mont-Saint-Hilaire", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mont-Saint-Hilaire", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 8892, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mont-Tremblant", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mont-Tremblant", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11724, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Montmagny", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Montmagny", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1620693, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Montreal", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Montréal", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3822, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Montreal East", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Montréal-Est", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5184, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Montreal West", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Montréal-Ouest", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 18933, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Mount Royal", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Mont-Royal", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 812, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Murdochville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Murdochville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3638, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Neuville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Neuville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3748, :region_id => region.id)
      locality_name = LocalityName.create(:name => "New Richmond", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "New Richmond", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7827, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Nicolet", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Nicolet", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3220, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Normandin", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Normandin", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9885, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Notre-Dame-de-l'Île-Perrot", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Notre-Dame-de-l'Île-Perrot", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 8230, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Notre-Dame-des-Prairies", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Notre-Dame-des-Prairies", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 8464, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Otterburn Park", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Otterburn Park", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3159, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Paspébiac", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Paspébiac", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3419, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Percé", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Percé", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11197, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Pincourt", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Pincourt", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6677, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Plessisville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Plessisville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2940, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Pohénégamook", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Pohénégamook", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 30161, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Pointe-Claire", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Pointe-Claire", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 7518, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Pont-Rouge", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Pont-Rouge", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6758, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Port-Cartier", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Port-Cartier", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3086, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Portneuf", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Portneuf", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5571, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Princeville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Princeville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 10132, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Prévost", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Prévost", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 659545, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Quebec City", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Québec", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 76237, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Repentigny", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Repentigny", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5208, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Richelieu", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Richelieu", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3336, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Richmond", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Richmond", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 42240, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Rimouski", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Rimouski", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 18586, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Rivière-du-Loup", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Rivière-du-Loup", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4152, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Rivière-Rouge", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Rivière-Rouge", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 10544, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Roberval", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Roberval", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 14173, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Rosemère", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Rosemère", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 39924, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Rouyn-Noranda", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Rouyn-Noranda", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 143692, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saguenay", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saguenay", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 10634, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Adèle", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Adèle", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9679, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Agathe-des-Monts", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Agathe-des-Monts", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2803, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Beaupré", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Beaupré", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5197, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Bellevue", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-de-Bellevue", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6772, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Monts", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Monts", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 13001, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Plaines", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Anne-des-Plaines", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 17281, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Augustin-de-Desmaures", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Augustin-de-Desmaures", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2560, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Basile", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Basile", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 15605, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Basile-le-Grand", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Basile-le-Grand", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 24388, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Bruno-de-Montarville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Bruno-de-Montarville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 16211, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Catherine", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Catherine", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5021, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Catherine-de-la-Jacques-Cartier", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5151, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Césaire", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Césaire", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 13080, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Colomban", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Colomban", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 23957, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Constant", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Constant", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 42062, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Eustache", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Eustache", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 10477, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Félicien", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Félicien", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2828, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Gabriel", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Gabriel", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 30113, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Georges", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Georges", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 55823, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Hyacinthe", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Hyacinthe", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 87492, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Jean-sur-Richelieu", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Jean-sur-Richelieu", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 63729, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Jérôme", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Jérôme", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4454, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Beauce", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Beauce", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1686, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Sorel", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Joseph-de-Sorel", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 29019, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Julie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Julie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 21599, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Lambert", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Lambert", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 17016, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Lazare", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Lazare", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 14159, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Lin–Laurentides", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Lin–Laurentides", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2774, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Marc-des-Carrières", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Marc-des-Carrières", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2498, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Marguerite-du-Lac-Masson", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Marguerite-du-Lac-Masson", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11584, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Marie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Marie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 11311, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Marthe-sur-le-Lac", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Marthe-sur-le-Lac", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1700, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Ours", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Ours", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2704, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Pamphile", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Pamphile", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3504, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Pascal", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Pascal", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5109, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Pie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Pie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9273, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Raymond", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Raymond", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 6136, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Rémi", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Rémi", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 9191, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Sauveur", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Sauveur", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 25224, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sainte-Thérèse", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sainte-Thérèse", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3826, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Saint-Tite", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Saint-Tite", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 39672, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Salaberry-de-Valleyfield", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Salaberry-de-Valleyfield", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 202, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Schefferville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Schefferville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 588, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Scotstown", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Scotstown", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2993, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Senneterre", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Senneterre", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 27827, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sept-Îles", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sept-Îles", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 51904, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Shawinigan", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Shawinigan", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 186952, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sherbrooke", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sherbrooke", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 34076, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sorel-Tracy", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sorel-Tracy", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2957, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Stanstead", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Stanstead", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3805, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Sutton", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Sutton", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2697, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Témiscaming", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Témiscaming", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5096, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Témiscouata-sur-le-Lac", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Témiscouata-sur-le-Lac", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 94703, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Terrebonne", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Terrebonne", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 25704, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Thetford Mines", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Thetford Mines", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2299, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Thurso", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Thurso", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 3500, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Trois-Pistoles", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Trois-Pistoles", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 129100, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Trois-Rivières", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Trois-Rivières", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 31123, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Val-d'Or", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Val-d'Or", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2349, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Valcourt", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Valcourt", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 20950, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Varennes", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Varennes", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 25789, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Vaudreuil-Dorion", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Vaudreuil-Dorion", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 40486, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Victoriaville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Victoriaville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 2696, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Ville-Marie", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Ville-Marie", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4804, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Warwick", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Warwick", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 4054, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Waterloo", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Waterloo", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 1926, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Waterville", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Waterville", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 20494, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Westmount", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Westmount", :locale_id => fr.id, :locality_id => locality.id)

    locality = Locality.create(:population => 5239, :region_id => region.id)
      locality_name = LocalityName.create(:name => "Windsor", :locale_id => en.id, :locality_id => locality.id)
      locality_name = LocalityName.create(:name => "Windsor", :locale_id => fr.id, :locality_id => locality.id)