import 'package:flutter/material.dart';
import 'package:sansao_mobile/api/api_response.dart';
import 'package:sansao_mobile/api/api_service.dart';
import 'package:sansao_mobile/training/model/training_detail_model.dart';
import 'package:sansao_mobile/widget/my_future_builder.dart';

class TrainingDetailScreen extends StatelessWidget {
  const TrainingDetailScreen({super.key, required this.id});
  final int id;

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Training'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder<ApiResponse<TrainingDetail>>(
            future: ApiService.getTrainingById(id),
            builder: (_, snapshot) {
              return MyFutureBuilder.getWidget(
                snapshot,
                snapshot.hasData && snapshot.data!.body != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snapshot.data!.body!.trainingTypeName,
                            style: textTheme.titleMedium,
                          ),
                          Row(
                            children: [
                              Text(
                                snapshot.data!.body!.training.startTime,
                                style: textTheme.bodySmall,
                              ),
                              Text('  |  ', style: textTheme.bodySmall),
                              Text(snapshot.data!.body!.training.endTime,
                                  style: textTheme.bodySmall),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            children: snapshot
                                .data!.body!.training.trainingItems
                                .map((item) => Column(
                                      children: item.loads
                                          .map((load) => Row(
                                                children: [
                                                  Text(
                                                    load.quantity.toString(),
                                                    style: textTheme.bodySmall,
                                                  ),
                                                  Text(' x ',
                                                      style:
                                                          textTheme.bodySmall),
                                                  Text(
                                                    load.weight.toString(),
                                                    style: textTheme.bodySmall,
                                                  ),
                                                  Text(
                                                    load.unity,
                                                    style: textTheme.bodySmall,
                                                  )
                                                ],
                                              ))
                                          .toList(),
                                    ))
                                .toList(),
                          )
                        ],
                      )
                    : Container(),
              );
            }),
      ),
    );
  }
}
