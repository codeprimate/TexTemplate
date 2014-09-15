require 'rake/clean' # Automatically adds a "rake clean" task

CLEAN.include FileList['*.log', '*.aux', '*.dvi', '*.toc']
CLOBBER.include FileList['*.pdf']
SOURCES = FileList['*.tex','*/*.tex'].to_a.map{|f| [f, File.basename(f, ".*").to_sym ]}

LATEX_BIN = ENV['LATEX_BIN'] || "xelatex"
TEXINPUTS="./tex/:#{ENV['TEXINPUTS']}"

namespace :tex do
  SOURCES.each do |source|
    desc "Render #{source.first} to PDF"
    task source[1] do
      puts " * #{source.first} => #{source.last}.pdf"
      system(
        "TEXINPUTS=${TEXINPUTS} #{LATEX_BIN} --shell-escape '#{source[0]}'  > /dev/null 2>&1 &&
        #{LATEX_BIN} --shell-escape '#{source[0]}' > /dev/null 2>&1")
    end
  end

  desc "Make PDF's of all TeX sources"
  task :pdf => SOURCES.map{|s| s[1]} do; end
end


desc "Process all tex sources"
task :default => [:dot, "tex:pdf"] do; end

desc "Bundle Repository"
task :bundle do
  bundle_path = "../#{`pwd|xargs basename`}".chomp + '.bundle'
  puts "* Creating bundle: #{bundle_path}"
  system("git bundle create '#{bundle_path}' master --all")
end

desc "Process Graphviz Dotfiles"
task :dot do
  src = [ 'NormalNewHireSchema.dot' ]
  target = 'NormalNewHireSchema.pdf'
  unless uptodate?(target, src)
     puts " * #{src.join(',')} => #{target}"
    `dot -Tpdf NormalNewHireSchema.dot -o NormalNewHireSchema.pdf`
  end
end
