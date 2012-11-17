# encoding: UTF-8

Locale.destroy_all
Category.destroy_all
Topic.destroy_all
Profession.destroy_all
Rating.destroy_all

locale_id = Locale.create(:name => "English", :code => "en").id

  category_id = Category.create(:name => "Legal", :locale_id => locale_id).id

    topic_id = Topic.create(:name => "Bankruptcy", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Business", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Car Accidents", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Child Custody", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Child Support", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Criminal Defense", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Divorce", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "DUI", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Employment", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Family", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Foreclosure", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Immigration", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Mariage", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Personal Injury", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Real Estate", :category_id => category_id, :locale_id => locale_id)

    profession_id = Profession.create(:name => "Attorney", :category_id => category_id, :locale_id => locale_id)
    profession_id = Profession.create(:name => "Lawyer", :category_id => category_id, :locale_id => locale_id)

  category_id = Category.create(:name => "Health", :locale_id => locale_id).id

    topic_id = Topic.create(:name => "Acne", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Angina", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Asthma", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Botox", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Breast Augmentations", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Cataract", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Cervical Cancer", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Face Lift", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "HPV", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Invisalign", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "LASIK", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Liposuction", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Melanoma", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Pregnancy", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Rhinoplasty", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Root Canal", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Teeth Whitening", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Tummy Tuck", :category_id => category_id, :locale_id => locale_id)

  category_id = Category.create(:name => "Finance", :locale_id => locale_id).id

    topic_id = Topic.create(:name => "Accounting", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Bankruptcy", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Bookkeeping", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Credit", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Estates", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Franchise", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Investment", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Mortgage", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Mutual Funds", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Payroll", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Personal Finance", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Stocks", :category_id => category_id, :locale_id => locale_id)
    topic_id = Topic.create(:name => "Taxes", :category_id => category_id, :locale_id => locale_id)

    profession_id = Profession.create(:name => "Accountant", :category_id => category_id, :locale_id => locale_id)
    profession_id = Profession.create(:name => "Bankruptcy Trustee", :category_id => category_id, :locale_id => locale_id)
    profession_id = Profession.create(:name => "Investment Broker", :category_id => category_id, :locale_id => locale_id)
    profession_id = Profession.create(:name => "Real Estate Broker", :category_id => category_id, :locale_id => locale_id)

  rating_id = Rating.create(:label => "Disappointing", :locale_id => locale_id)
  rating_id = Rating.create(:label => "Poor", :locale_id => locale_id)
  rating_id = Rating.create(:label => "Average", :locale_id => locale_id)
  rating_id = Rating.create(:label => "Good", :locale_id => locale_id)
  rating_id = Rating.create(:label => "Excellent", :locale_id => locale_id)

locale_id = Locale.create(:name => "French", :code => "fr").id
