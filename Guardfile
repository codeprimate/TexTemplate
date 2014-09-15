# More info at https://github.com/guard/guard#readme

require 'rake'

SOURCES = Rake::FileList['*.tex','*/*.tex'].map{|f| [f, File.basename(f, ".*").to_sym ]}

SOURCES.each do |source|
  guard :rake, task: "tex:#{source[1]}" do
    watch(source[0])
  end
end
