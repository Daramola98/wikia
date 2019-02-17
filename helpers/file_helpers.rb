def page_content(title)
  File.read("pages/#{title}.txt")
rescue Errno::ENOENT
  nil
end

def save_content(title, content)
  File.open("pages/#{title}.txt", 'w') do |file|
    file.print(content)
  end
end
