unless ENV['SECRET_KEY']
  puts 'No secret key env var.'
  ENV['SECRET_KEY'] = SecureRandom.hex
end
