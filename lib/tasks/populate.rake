namespace :populate do
  task :pictures => :environment do
    gallery = Gallery.last
    20.times do |i|
      picture = gallery.pictures.build(:file => File.open("features/rails.png"),
                                       :caption => "rails#{i}")
      picture.save
    end
  end
end
