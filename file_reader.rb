# class documentation
class FileReader
  def self.read_file(full_path, arr_mode = false)
    abort "File '#{full_path}' doesn't exists" unless File.exist?(full_path)

    file = File.new(full_path, 'r:UTF-8')
    res = arr_mode ? file.readlines.map(&:chomp) : file.read
    file.close
    res
  end
end