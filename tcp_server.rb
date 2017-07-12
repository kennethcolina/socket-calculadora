require 'socket'

port = 3000
server = TCPServer.new port
puts "Server listening #{port}"

loop do
  Thread.start(server.accept) do |client|
    puts "cliente conectou!"
    loop do
      str = client.gets	
      break if str == "exit\n"
      stream = str.split(' ')
      operador = stream[0]
      n1 = Integer(stream[1])
      n2 = Integer(stream[2])
      case operador
        when "+"
          resultado = n1 + n2
        when "-"
          resultado = n1 - n2
        when "*"
          resultado = n1 * n2
        else
          client.puts("Entrada incorreta.")
      end
      client.puts(resultado)
    end
    client.close
    puts "cliente desconectou!"
  end
end
