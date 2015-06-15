task :default do
  sh 'rake -T'
end

namespace :deps do
  desc 'crystal deps'
  task :deps do
    sh 'crystal deps'
  end

  desc 'crystal deps update'
  task :update do
    sh 'crystal deps update'
  end
end

file :main => Dir["src/**/*.cr"] do |t|
  puts "#{t.name} #{t.prerequisites.join(' ')}"
  sh 'crystal build --release src/main.cr'
end

desc 'build'
task :build => %w[main]

desc 'run'
task :run => %w[build] do
  sh 'PORT=8080 ./main'
end

desc 'clean'
task :clean do
  sh 'rm main'
end
