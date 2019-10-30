class SessionsView
  def ask_for(something)
    puts "#{something}?"
    gets.chomp
  end
end
