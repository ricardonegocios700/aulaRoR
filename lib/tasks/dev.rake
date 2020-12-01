namespace :dev do
  desc "Popular base de dados em desenvolvimento"
  task populando: :environment do
    puts %x(rails db:drop)
    puts %x(rails db:create)
    puts %x(rails db:migrate)
    puts %x(rails db:seed)
  end

end
