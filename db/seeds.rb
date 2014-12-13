Listing.create!([
  {user_id: 2, title: "Great housesitting gig in the Mission!", description: "We have a cute small dog that needs a few days of housesitting, and dog walking. Will provide free housing or small compensation.", image: "https://www.filepicker.io/api/file/lQlvP6rETheXQLzGcLcA", address: "14 18th Street, San Francisco, CA, United States", latitude: 37.7616132, longitude: -122.4230064, start_date: "2014-12-15", end_date: "2014-12-19", contact_email: "user@example.com"},
  {user_id: 2, title: "Great housesitting in pacific heights!", description: "We have two cute little kittens that need care during a week trip that we are taking out of the country. We are looking for a responsible person that can take care of our kittens during our trip.", image: "https://www.filepicker.io/api/file/DA4dkWX0RSqZWmPoTNLa", address: "2100 Pacific Avenue, San Francisco, CA, United States", latitude: 37.794227, longitude: -122.430095, start_date: "2015-01-07", end_date: "2015-01-21", contact_email: "nice_house@example.com"},
  {user_id: 2, title: "A great dog and cute cat looking for house sitter!", description: "We are looking for a responsible house sitter to take care of our two great animals. We will be out of town for a week in February and would love to meet the persons interested in person.", image: "https://www.filepicker.io/api/file/jqfZFVy9RzyPmudISOKP", address: "268 Buchanan Street, San Francisco, CA, United States", latitude: 37.7723218, longitude: -122.4271044, start_date: "2015-02-03", end_date: "2015-02-10", contact_email: "sf@example.com"},
  {user_id: 2, title: "New house sitter needed as soon as possible!", description: "We have to take an unplanned trip out of town and are looking for a house sitter for one week. Will compensate you for your help. We have a great cat, who is very sociable and loves meeting new people. ", image: "https://www.filepicker.io/api/file/b7Z5705S4iMkhbDhYGsh", address: "120 1st Street, San Francisco, CA, United States", latitude: 37.7894791, longitude: -122.3972182, start_date: "2014-12-19", end_date: "2014-12-25", contact_email: "soma@example.com"},
  {user_id: 2, title: "Our dogs are looking for a house sitter!", description: "We are heading out of town for a month and looking for a person to take care of our dogs, and water our plants while we are out of town. We would love to meet you as soon as possible to find out if you are a good fit.", image: "https://www.filepicker.io/api/file/9nsUb9BzR2dFPbeR1ZSp", address: "570 Irving Street, San Francisco, CA, United States", latitude: 37.7641514, longitude: -122.4640567, start_date: "2015-01-20", end_date: "2015-02-20", contact_email: "sunset@example.com"},
  {user_id: 2, title: "Excellent house sitting gig for the right person!", description: "Very nice house in the Marina with two super nice kitties looking for a house sitter. We are looking for a responsible professional. Our cats are very low maintenance and love people!", image: "https://www.filepicker.io/api/file/bguTGlqaSSCqgbAHz6m4", address: "1500 Francisco Street, San Francisco, CA, United States", latitude: 37.8027012, longitude: -122.4301497, start_date: "2015-02-17", end_date: "2015-03-03", contact_email: "marina@example.com"}
])
User.create!([
  {username: "Guest", email: "guest@example.com", password_digest: "$2a$10$9l1kEqxsC412s4sf7dowUuaVv7n6MpOHY8MRPhXb7nqTpCjk9RGoq", rating: nil, session_token: "Vna6-w_QMsqnJTZTFQJe6A"},
  {username: "User", email: "user@example.com", password_digest: "$2a$10$Ej6HJxmhHzaflTMFrwebfurV05Z9cokTpsDVgNl7Iw7KVRt3jW4bW", rating: nil, session_token: "1VPaGcDm218hHWA3_cRi-w"},
  {username: "Test", email: "sdf@example.com", password_digest: "$2a$10$rVogNGbqgUw.hPmKqQIBAOR0CwbCRPmiUmtCk/6MHQemWv6rPJWGG", rating: nil, session_token: "XuXF4nrd2g089bwmpkc32g"}
])
