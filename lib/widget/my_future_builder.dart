import 'package:flutter/material.dart';
import 'package:sansao_mobile/api/api_response.dart';

class MyFutureBuilder {
  static Widget getWidget(
      AsyncSnapshot<ApiResponse> snapshot, Widget successWidget) {
    if (ConnectionState.waiting == snapshot.connectionState) {
      return const Center(child: LinearProgressIndicator());
    } else if (!snapshot.hasData) {
      return const Center(child: Text("Não há dados."));
    } else if (snapshot.hasError || snapshot.data!.hasError) {
      String? message = snapshot.data!.error;
      return Center(
          child: Text(
        message!,
        style: TextStyle(color: Colors.white),
      ));
    } else if (ConnectionState.done == snapshot.connectionState) {
      return successWidget;
    } else {
      return const Center(child: Text('Erro indefinido.'));
    }
  }
}
