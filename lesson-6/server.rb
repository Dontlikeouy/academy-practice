# frozen_string_literal: true

require 'socket'
require './requst'
require './cash_machine'

class Server
  def initialize
    @server = TCPServer.new 2001
  end

  def run
    cash_machine = CashMachine.new
    cash_machine_methods = cash_machine.methods - Object.methods
    cash_machine_methods_text = ["http://example.com/page?method=name&value=123\n\nMethods:\n"]
    cash_machine_methods.each do |method|
      params = ''
      cash_machine.method(method).parameters.each do |value|
        params += " #{value[1]}"
      end
      cash_machine_methods_text.push("Required value:#{params}")

      cash_machine_methods_text.push("Name method: #{method}\n")
    end
    cash_machine_methods_text = cash_machine_methods_text.join("\n")

    while (conn = @server.accept)

      request = Request.new(conn.gets)
      response = ''
      code = '200'
      if request.params.include?(:method) && !request.params[:method].nil? && cash_machine_methods.include?(request.params[:method].to_sym)

        begin
          response = if request.params.include?(:value)
                       cash_machine.method(request.params[:method].to_sym).call(request.params[:value])
                     else
                       cash_machine.method(request.params[:method].to_sym).call
                     end
        rescue StandardError => e
          response = "Error: #{e}"
          code = '404'
        end
        conn.puts send_response(response, code)
      else
        conn.puts send_response(cash_machine_methods_text, code)
      end
      conn.close
    end
  end

  private

  def send_response(response, code)
    "HTTP/1.1 #{code}\r\nContent-Type: text/html\r\n\r\n<pre>#{response}</pre>"
  end
end
