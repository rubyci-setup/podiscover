# frozen_string_literal: true

desc "Fetch episodes from all subscribed podcasts"
task fetch_podcasts: :environment do
  puts "Start fetching podcasts"
  podcasts = Podcast.all

  podcasts.each do |podcast|
    GenerateEpisodeJob.perform_async(podcast.id)
  end

  puts "Finished fetching podcasts"
end

desc "Find podcast of the day"
task find_daily_podcast: :environment do
  puts "Start finding podcast of the day"
  FindPodcastOfTheDay.perform_async
  puts "Finished finding podcast of the day"
end

desc "Reset users openai credits"
task reset_user_openai_credits: :environment do
  puts "Start reset"
  User.update_all(daily_openai_credit: 5)
  puts "Finished reset"
end