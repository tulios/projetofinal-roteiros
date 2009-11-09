document = ARGV[0]

tables = []
File.open(document, "r").each do |line|
  if line =~ /^\s*Ilustração/
   tables << line
  end
end
  
puts tables         











