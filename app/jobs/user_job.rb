class UserJob < ApplicationJob
  pubsubeque_options retries: 4

  def perform(email, username)
    User.create!(email: email, username: username, password: "ohthree", full_name: "Ezenwa Ogbonna")
    (1..1000000).to_a
    user = User.all
  end
end