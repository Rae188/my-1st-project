require 'digest'

class SeenFile

  def initialize (greetings:)
  @path = File.join(File.dirname(__FILE__),"../practice_rake/storage/#{greetings}")
  initialize_path!(@path)
  @seen = Set.new(file_to_array(@path))
  end

  def add (par)
  word = hash(par)
  return if @seen.include? word
  @seen << word
    File.write(@path,"#{word}\n", mode: 'a')
  end

  def include?(word)
    @seen.include? hash(word)
  end

  def hash(url)
    Digest::MD5.hexdigest url
  end

  def file_to_array(path)
    File.readlines path, chomp: true
  end

  def initialize_path!(path)
    return if File.exist?(path)
    FileUtils.mkdir_p(File.dirname(path))
    FileUtils.touch(path)
  end
end