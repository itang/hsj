# gem install guard
# gem install guard-process

guard 'process', :name => 'Spec', :command => 'crystal spec'  do
  watch(/spec\/(.*).cr$/)
  watch(/src\/(.*).cr$/)
end

guard 'process', :name => 'Build', :command => 'crystal build src/main.cr -o main_debug' do
  watch(/src\/(.*).cr$/)
  watch(/src\/(.*).ecr$/)
end

guard 'process', :name => 'Run', :command => './main_debug' do
  watch('main_debug')
end
