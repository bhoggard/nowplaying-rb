require 'rake/testtask'
require 'rubocop/rake_task'

Rake::TestTask.new do |t|
  t.libs << 'lib' << 'test'
  t.test_files = FileList['test/**/*_test.rb']
end

task :rubocop do
  require 'rubocop'
  cli = RuboCop::CLI.new
  cli.run(%w(--auto-correct -D))
end

task default: [:rubocop, :test]
