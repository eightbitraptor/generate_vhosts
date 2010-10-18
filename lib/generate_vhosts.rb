require 'ERB'
require 'socket'

class GenerateVhosts

  attr_accessor :vhosts

  def initialize(code_dir="~/code")
    @vhosts = ""
    @hostname = Socket.gethostname.split('.').first
    @code_dir = code_dir
    Dir.chdir(File.expand_path(code_dir)) do
      Dir.glob("*").each do |subdir|
        @app_dir = subdir
        @vhosts << generate_vhost if is_web_app
      end
    end
    @vhosts
  end

  def is_web_app
    rack? || rails_legacy?
  end

  def rack?
    File.exists?("./#{@app_dir}/config.ru") and File.directory?("./#{@app_dir}/public")
  end

  def rails_legacy?
    File.exists?("./#{@app_dir}/config/boot.rb") and File.directory?("./#{@app_dir}/public")
  end

  def generate_vhost
    template = ERB.new(File.read(File.join(File.dirname(__FILE__), "/template.vhost.erb")))
    template.result(binding)
  end
end

