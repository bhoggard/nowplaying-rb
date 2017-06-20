unless ENV['RACK_ENV'] == 'production'
  require 'rake/testtask'
  require 'rubocop/rake_task'

  Rake::TestTask.new do |t|
    t.libs << 'lib' << 'test'
    t.test_files = FileList['test/**/*_test.rb']
  end

  desc 'Run RuboCop'
  RuboCop::RakeTask.new(:rubocop) do |task|
    task.fail_on_error = true
    task.options = %w[-D --auto-correct]
  end

  task default: %i[rubocop test]
end
