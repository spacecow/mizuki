Factory.define :event do |f|
  f.name "Default factory name"
end

Factory.define :gallery do |f|
  f.title "Default factory title"
end

Factory.define :maintenance do |f|
end

Factory.define :picture do |f|
  f.file File.open("features/rails.png")
end

Factory.define :user do |f|
  f.sequence(:username){|n| "username#{n}"}
  f.sequence(:email){|n| "default#{n}@email.com"}
  f.password "abc123"
end

