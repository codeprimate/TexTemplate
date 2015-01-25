# More info at https://github.com/guard/guard#readme

require 'rake'

# Define helper logic
class << self
  attr_accessor :formats
  #
  def define_sources(fmt, extensions)
    @formats ||= []
    file_list = extensions.
      reduce(Rake::FileList[]) do |list,ext|
      list.include("*.#{ext}").
      include("*/*.#{ext}")
    end
    @formats << [fmt, file_list]
  end
end

# Add your file formats here
define_sources :tex, ["tex","latex"]
define_sources :dot, ["dot"]


## Iterate through the defined formats to define the guard watches
@formats.each do |format|
  puts " * Watching for changes in #{format[0]} documents #{( format[1] || "-empty-" ).inspect}"
  format[1].each do |filename|
    rake_taskname = File.basename(filename, ".*").to_sym
    guard :rake, task: "#{format[0]}:#{rake_taskname}" do
      watch(filename)
    end
  end
end

