require 'webrick'  #インストールされたwebrickを呼び出し

#webrickのインスタンスを生成、serverという名前のローカル変数に入れる
server = WEBrick::HTTPServer.new({
    :DocumentRoot => '.',
    :CGIInterpreter => WEBrick::HTTPServlet::CGIHandler::Ruby,
    :Port => '3000',
})

['INT','TERM'].each {|signal|
  Signal.trap(signal){ server.shutdown }
}


server.mount('/',WEBrick::HTTPServlet::ERBHandler, 'exam.html.erb')
server.mount('/goya.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya.rb')
server.mount('/goya1.cgi', WEBrick::HTTPServlet::CGIHandler, 'goya1.rb')
server.start
