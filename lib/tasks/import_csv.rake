require 'csv'

namespace :import_csv do
    desc  "CSVデータをインポートするタスク"

    task users: :environment do
        path = File.join Rails.root, "db/csv_data/csv_data.csv"

        list = []
            
        CSV.foreach(path, headers: true) do |row|
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }
        end

        puts "インポーート処理を開始"

        begin
            User.create!(list)
            puts "インポート完了!!"
        rescue ActiveModel::UnknownAttributeError => invalid
            puts "インポートに失敗"
        end
            
    end

end
