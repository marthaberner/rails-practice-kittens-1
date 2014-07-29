def create_user(overrides = {})
  User.create!({
                 name: 'Some User',
                 email: 'user@example.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end

def create_kitten(overrides = {})
  Kitten.create!({
                   image: "http : //i.imgur.com/mE13UCtb.jpg"
                 }.merge(overrides))
end