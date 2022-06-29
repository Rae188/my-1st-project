class Prac
  def seen(par)
    if seen_file.include?(par)
      p 'seen'
    else 
      seen_file.add(par)
      p par
    end
  end

  def seen_file
  @seen_file ||= SeenFile.new(greetings:'par')
  end
end