
Dir[File.join(Rails.root, 'db', 'seeds', '*.rb')].sort.each { |seed| load seed }
#Dir[File.join(Rails.root, 'db', 'seeds', 'baguio', '*.rb')].sort.each { |seed| load seed }
Dir[File.join(Rails.root, 'db', 'seeds', 'lamut', '*.rb')].sort.each { |seed| load seed }


puts "--> Loading seed files successful!"
