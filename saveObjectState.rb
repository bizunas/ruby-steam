require "base64"

class SaveObjectState
  def initialize
  end
  
  def save_object(file, object)
    file = File.new(file, 'w')
    data = Marshal.dump(object)
    enc = Base64.encode64(data)
    file.write(enc)
    file.close
  end

  def load_object(file)
    if File.exists? file
      file = File.open(file, 'r')
      data = file.read(File.size(file))
      plain = Base64.decode64(data)
      object = Marshal.load(plain)
      file.close
      return object
    else
      return false
    end
  end
end