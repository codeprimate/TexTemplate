require 'rake/clean' # Automatically adds a "rake clean" task

LATEX_BIN = "xelatex"
CLEAN = FileList['*.log', '*.aux', '*.dvi', '*.pdf', '*.toc']
TEXINPUTS="./tex/:#{ENV['TEXINPUTS']}"
SOURCES = FileList['*.tex'].to_a.map{|f| [f, File.basename(f, ".*").to_sym ]}

namespace :tex do
  desc "Make PDF's of all TeX sources"
  task :pdf => SOURCES.map{|s| s[1]} do; end

  SOURCES.each do |source|
    desc "Process #{source.first}"
    task source[1] do
      system(
        "TEXINPUTS=${TEXINPUTS} #{LATEX_BIN} --shell-escape '#{source[0]}' &&
        #{LATEX_BIN} --shell-escape '#{source[0]}'")
    end
  end
end


desc "Process tex source"
task :default => [:clean, :pdf] do; end

desc "Bundle Repository"
task :bundle do
  bundle_path = "../#{`pwd|xargs basename`}".chomp + '.bundle'
  puts "* Creating bundle: #{bundle_path}"
  system("git bundle create '#{bundle_path}' master --all")
end
