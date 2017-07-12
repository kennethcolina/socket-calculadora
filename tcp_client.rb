require "socket"

s = TCPSocket.new("localhost", 3000)
loop do 
	puts "Entre com a operação:"
	str = gets
	s.puts str
  break if str == "exit\n"
	string = s.gets
	puts string
end
s.close
