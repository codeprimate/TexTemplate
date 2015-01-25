require 'rake/clean' # Automatically adds a "rake clean" task

CLEAN.include FileList["*.log", "*.aux", "*.dvi", "*.toc"]
CLOBBER.include FileList["*.pdf", "*.png"]

# TEX Processing
###
LATEX_SOURCES = FileList["*.tex","*/*.tex"].to_a.map{|f| [f, File.basename(f, ".*").to_sym ]}
LATEX_BIN = ENV["LATEX_BIN"] || "xelatex"
TEXINPUTS="./tex/:#{ENV['TEXINPUTS']}"
namespace :tex do
  LATEX_SOURCES.each do |source|
    desc "Render #{source.first} to PDF"
    task source[1] do
      puts " * #{source.first} => #{source.last}.pdf"
      #system_cmd = "TEXINPUTS=${TEXINPUTS} #{LATEX_BIN} --shell-escape '#{source[0]}'  > /dev/null 2>&1 && #{LATEX_BIN} --shell-escape '#{source[0]}' > /dev/null 2>&1"
      system_cmd = "TEXINPUTS=${TEXINPUTS} #{LATEX_BIN} --shell-escape '#{source[0]}'"
      puts "***"
      puts system_cmd
      puts "---"
      system(system_cmd)
      system(system_cmd)
      puts "***"
    end
  end
  desc "Make PDF's of all TeX sources"
  task :pdf => LATEX_SOURCES.map{|s| s[1]} do; end
end

desc "Process all tex sources"
task :default => [:dot, "tex:pdf"] do; end

# DOT Processing
###
DOT_SOURCES = FileList['*.dot','*/*.dot'].to_a.map{|f| [f, File.basename(f, ".*").to_sym ]}
DOT_BIN = ENV['DOT_BIN'] || "dot"
namespace :dot do
  DOT_SOURCES.each do |source|
    desc "Render #{source.first} to png"
    task source[1] do
      puts " * #{source.first} => #{source.last}.png"
      system("dot -Tpng '#{ source.first }' -o '#{source.last}.png'")
    end
  end
  desc "Process Graphviz Dotfiles - Make PNG's of all DOT sources"
  task :dot => DOT_SOURCES.map{|s| s[1]} do; end
end


desc "Bundle Repository"
task :bundle do
  bundle_path = "../#{`pwd|xargs basename`}".chomp + '.bundle'
  puts "* Creating bundle: #{bundle_path}"
  system("git bundle create '#{bundle_path}' master --all")
end
