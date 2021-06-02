require 'em-websocket'
puts "Server is running..."

EM.run {
  EM::WebSocket.run(:host => "192.168.1.65", :port => 8080) do |ws|
    ws.onopen { |handshake|
      puts "Connected with Client"
      puts "Waiting for commands..."

    }

    ws.onerror do |error|
      puts "[error] #{error}"
    end

    ws.onclose { puts "Connection closed" }

    ws.onmessage { |msg|
      puts "message from client: #{msg}"
      if msg == 'hello'
          ws.send "Вы поздоровались"
      elsif msg == 'bye'
          ws.send "Вы попрощались"
      else
          ws.send "Я не знаю такой команды"
      end
    }
  end
}
