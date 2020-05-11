json.extract! company, :id, :fantasy_name, :created_at, :updated_at
json.logo url_for(company.logo) if company.logo.attached?
json.set! :categories do
    json.array! company.categories do |category|
        json.extract! category, :id, :name
    end
end
