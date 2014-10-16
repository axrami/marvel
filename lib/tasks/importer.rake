namespace :importer do
  desc "Imports characters from Marvel API"
  task characters: :environment do
    chars = MarvelApi.all_characters
    chars.each do |character|
      Character.create(marvel_id: character["id"],
                       name: character["name"],
                       description: character["description"],
                       thumbnail: Character.get_thumbnail(character)
                       )

    end
  end

  desc "Imports comics from Marvel API"
  task comics: :environment do
    comics = MarvelApi.all_comics
    comics.each do |comic|
      Comic.create(name: comic["title"],
                   comic_id: comic["id"],
                   description: comic["description"],
                   thumbnail: Comic.get_thumbnail(comic)
                   )

    end
  end

  desc "Imports series from Marvel API"
  task series: :environment do
    series = MarvelApi.all_series
    series.each do |series|
      Series.create(title: series["title"],
                    series_id: series["id"],
                    description: series["description"],
                    start_year: series["startYear"],
                    end_year: series["endYear"],
                    rating: series["rating"],
                    type: series["type"],
                    thumbnail: Series.get_thumbnail(series),
                    creators: series["creators"],
                    characters: serie["characters"]
                    )
end
