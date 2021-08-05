import 'package:flutter/material.dart';

class PredictionTile extends StatelessWidget {
  // final PlacePruedictions placePredictions;
  // PredictionTile(this.placePredictions);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 4,
          ),
          Row(
            children: [
              Icon(Icons.add_location),
              SizedBox(
                width: 14,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      //       placePredictions.mainText!,
                      'main Text',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Text(
                      //  placePredictions.secondaryText!,
                      'secondary text',
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
