import 'package:flutter/material.dart';
import 'package:socket_io_client/socket_io_client.dart';

class Testing extends ChangeNotifier{
  Socket socket;
  String id;
  String users,message,players,value,updated,scores;


  /*Testing(){
    connecttoSocket();
  }*/

  void connecttoSocket(int userId,String email,String name,String score){

    socket= io('http://3.16.23.162/',
        OptionBuilder()
            .setTransports(['websocket'])
            .setQuery({'userId': userId,'email':email,'name':name,'score':score } )// for Flutter or Dart VM
            .disableAutoConnect()  // disable auto-connection
            .setExtraHeaders({'foo': 'bar'}) // optional
            .build()
    );
    socket.connect();
    socket.on('joined', (data) =>
    {
      print(data),
      users = data.toString(),
      notifyListeners()
    }
    );

    socket.on('gamers', (data) =>
    {
      print(data),
      players = data.toString(),
      notifyListeners()
    }
    );

    socket.on('left', (data) =>
    {
      print(data),
      users = data.toString(),
      notifyListeners()
    }
    );
    socket.on('scores', (data) =>
    {
      print(data),
      scores = data.toString(),
      notifyListeners()
    }
    );
    socket.on('values', (data) =>
    {
      value = data.toString(),
      notifyListeners()
    }
    );
    socket.on('updated', (data) =>
    {
      updated = data.toString(),
      notifyListeners()
    }
    );
    socket.on('receiveinvitation', (data) =>
    {
      print(data),
      message = data.toString(),
      notifyListeners()
    });

  }
  sendInvite(String Name){
    socket.emit("sendInvite",
        {
          'name': Name,
        });
  }
  sendvalue(int count){
    socket.emit("sendValue",
        {
          'count': count,
        });
  }
  sendInvites(String from,String to, String name,){
    socket.emit("sendinvitation",
        {
          'from': from,
          'to': to,
          'name': name,
         /* 'selectedList' : selectedList,
          'matchmode': matchmode*/
        });
  }
  startGame(String Email){
    socket.emit("startGame",
        {
          'email': Email,
        });
  }

  sendResponse(String respond, String to){
    socket.emit("response",{
      "response": respond,
      'to': to,
    });
  }


  updatedData(String mail, int score){
    socket.emit("changes",{
      "at": mail,
      'score': score,
    });
  }

}