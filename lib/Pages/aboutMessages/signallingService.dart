import 'dart:developer';
import 'package:socket_io_client/socket_io_client.dart'/*  as client */;

class SignallingService{
  Socket? socket;

  SignallingService._();
  static final instance = SignallingService._();

  init({required String websocketUrl, required String selfCallerID}){
    socket = io(websocketUrl, {
      "transports": ['websocket'],
      "query": {"callerId": selfCallerID}
    });

    socket!.onConnect((data) {
      log("Socket connected !!");
    });

    socket!.onConnectError((data){
      log("Connect Error $data");
    });

    socket!.connect();


  }

}