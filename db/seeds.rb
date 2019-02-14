1.times do |s|
  name = "管理ユーザー"
  email = "1@gmail.com"
  password = "111111"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    role: 1,
  )
end

1.times do |s|
  name = "一般ユーザー"
  email = "2@gmail.com"
  password = "222222"
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
  )
end

3.times do |s|
  name = Faker::Name.name
  email = Faker::Internet.unique.email
  password = Faker::Internet.password(6)
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
  )
end

20.times do |s|
  title = "旅行のサンプル#{s}"
  departed_at = Faker::Time.between(Date.today + 1, Date.today + 8)
  returned_at = Faker::Time.between(Date.today + 9, Date.today + 30)
  user_id = 2
  Travel.create!(
    title: title,
    travel_image: File.open("./app/assets/images/sample_travel_image.png"),
    departed_at: departed_at,
    returned_at: returned_at,
    user_id: user_id,
  )
end

10.times do |s|
  country = Faker::Nation.nationality
  place = Faker::Nation.capital_city
  arrived_at = Faker::Time.between(Date.today + 1, Date.today + 8)
  left_at = Faker::Time.between(Date.today + 9, Date.today + 30)
  travel_id = 1
  Area.create!(
    country: country,
    place: place,
    arrived_at: arrived_at,
    left_at: left_at,
    travel_id: travel_id,
  )
end

20.times do |s|
  content = Faker::Lorem.paragraph(sentence_count = 10)
  travel_id = 1
  Note.create!(
    content: content,
    image: File.open("./app/assets/images/sample_note_image.png"),
    travel_id: travel_id,
  )
end

20.times do |s|
  title = "カードのサンプル#{s}"
  sentence = Faker::Lorem.paragraph(sentence_count = 10)
  frame_style = [0, 1, 2].sample
  font_style = [0, 1, 2, 3, 4, 5].sample
  travel_id = 1
  Card.create!(
    title: title,
    sentence: sentence,
    frame_style: frame_style,
    font_style: font_style,
    travel_id: travel_id,
  )
  card_id = Card.last.id
  Image.create!(
    data: File.open("./app/assets/images/sample_card_image.png"),
    card_id: card_id,
  )
end

20.times do |s|
  title = "リストのサンプル#{s}"
  travel_id = 1
  List.create!(
    title: title,
    travel_id: travel_id,
  )
end

100.times do |s|
  name = Faker::Lorem.word
  remark = Faker::Lorem.sentence
  list_id = 1
  Item.create!(
    name: name,
    remark: remark,
    list_id: list_id,
  )
end
