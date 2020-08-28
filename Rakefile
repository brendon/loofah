require "rubygems"

require "hoe/markdown"
Hoe::Markdown::Standalone.new("loofah").define_markdown_tasks

require "concourse"
Concourse.new("loofah", fly_target: "ci") do |c|
  c.add_pipeline "loofah", "loofah.yml"
  c.add_pipeline "loofah-pr", "loofah-pr.yml"
end

desc "generate safelists from W3C specifications"
task :generate_safelists do
  load "tasks/generate-safelists"
end

task :rubocop => [:rubocop_security, :rubocop_frozen_string_literals]
task :rubocop_security do
  sh "rubocop lib --only Security"
end
task :rubocop_frozen_string_literals do
  sh "rubocop lib --auto-correct --only Style/FrozenStringLiteralComment"
end
Rake::Task[:test].prerequisites << :rubocop

task :debug_manifest do
  spec = eval(File.read("loofah.gemspec"))
  puts spec.files
end

task :default => :test
