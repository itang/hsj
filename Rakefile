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

desc 'buildjs'
task 'buildjs' do
  sh 'cd scalajs;rake build'
end

desc 'run'
task :run, [:mode] => %w[build_debug] do |_t, args|
  mode = args[:mode] || ENV['mode']
  if (mode || "").start_with? "d"
    sh 'RUN_MODE=development MOCK_REDIS=true ./main_debug'
  else
    sh 'MOCK_REDIS=true ./main_debug'
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
  sh %q(crul post http://localhost:3000/api/dict -H 'AUTH:test;test2015_bad' -d '{"from":"hello","to":"nihao"}')
end

desc 'format code'
task :fmt do
  sh 'crystal tool format'
end

desc 'commit all'
task :commit_all do
  sh 'git add --all'
  sh 'git commit -m "more"'
  sh 'git push origin master'
end

desc 'stop remote'
task :stop_remote do
  sh "ssh itang@haoshuju.net 'source .profile;cd workspace/hsj;./hsj stop'"
end

desc 'upload binary'
task :upload_binary => :build do
  sh 'scp .build itang@haoshuju.net:workspace/hsj/'
  sh 'scp main itang@haoshuju.net:workspace/hsj/'
  sh "ssh itang@haoshuju.net 'cd workspace/hsj;git pull'"
end

desc 'start remote'
task :start_remote do
  sh "ssh itang@haoshuju.net 'source .profile;cd workspace/hsj;./hsj start'"
end

desc 'deploy remote'
task :deploy => %w[fmt commit_all stop_remote upload_binary start_remote] do
end

desc 'dev'
task :dev do
  sh 'guard'
end
