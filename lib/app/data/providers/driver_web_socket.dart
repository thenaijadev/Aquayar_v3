import 'dart:convert';

import 'package:web_socket_channel/web_socket_channel.dart';

class DriverWebSocket {
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://ws-feed.pro.coinbase.com'),
  );

  /// Listen for all incoming data
  listenToStream() {
    channel.stream.listen(
      (data) {
        print(data);
      },
      onError: (error) => print(error),
    );
  }

  sendEvents() {
    channel.sink.add(
      jsonEncode(
        {
          "type": "subscribe",
          "channels": [
            {
              "name": "ticker",
              "product_ids": [
                "BTC-EUR",
              ]
            }
          ]
        },
      ),
    );
  }

  closeChannel() {
    channel.sink.close();
  }
}
