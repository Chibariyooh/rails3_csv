namespace :greet do

    desc ""

    task say_hello: :environment do
        puts "hello"
    end
end
