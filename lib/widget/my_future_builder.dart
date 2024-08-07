import 'package:flutter/material.dart';

class MyFutureBuilder {
  static Widget getWidget(AsyncSnapshot snapshot, Widget successWidget) {
    if (ConnectionState.waiting == snapshot.connectionState) {
      return const Center(child: LinearProgressIndicator());
    } else if (!snapshot.hasData) {
      return const Center(child: Text("Não há dados."));
    } else if (snapshot.hasError || snapshot.data!.hasError) {
      String message =
          snapshot.hasError ? snapshot.error.toString() : snapshot.data!.error;
      return Center(child: Text(message));
    } else if (ConnectionState.done == snapshot.connectionState) {
      return successWidget;
    } else {
      return const Center(child: Text('Erro indefinido.'));
    }
  }
}
