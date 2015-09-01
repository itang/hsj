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

file :main => (Dir["src/**/*.cr"] + Dir["src/**/*.ecr"]) do |t|
  puts "#{t.name} #{t.prerequisites.join(' ')}"
  sh 'crystal build --release src/main.cr'
  File.write ".build", "#{Time.now}"
end

file :main_debug => (Dir["src/**/*.cr"] + Dir["src/**/*.ecr"]) do |t|
  puts "#{t.name} #{t.prerequisites.join(' ')}"
  sh 'crystal build src/main.cr -o main_debug'
  File.write ".build", "#{Time.now}"
end

desc 'build'
task :build => %w[main]

desc 'build debug'
task :build_debug => %w[main_debug]

desc 'run'
task :run, [:mode] => %w[build_debug] do |_t, args|
  mode = args[:mode] || ENV['mode']
  if (mode || "").start_with? "d"
    sh 'RUN_MODE=development ./main_debug'
  else
    sh './main_debug'
  end
end

desc 'start'
task :start => %w[build] do
  sh './main'
end

desc 'clean'
task :clean do
  sh 'rm main*'
end

desc 'mock'
task :mock do
  sh %q(crul post http://localhost:3000/api/dict -H 'AUTH:test;test2015' -d '{"from":"hello","to":"nihao"}')
end
