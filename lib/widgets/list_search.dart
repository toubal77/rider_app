import 'package:flutter/material.dart';
import 'package:rider_app/widgets/place_prediction_tile.dart';
class ListSearch extends StatelessWidget {
  const ListSearch({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListView.separated(
      padding: EdgeInsets.all(0),
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      separatorBuilder: (BuildContext context, int index) => Divider(
        height: 1,
        color: Colors.grey,
        thickness: 1.0,
      ),
      // itemCount: placePredictionsList!.length,
      itemCount: 3,
      itemBuilder: (context, index) {
      //       return PredictionTile(placePredictionsList![index]!);
      return PredictionTile();
      },
  ),
    );
  }
}