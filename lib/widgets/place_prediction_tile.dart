import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/configMaps.dart';
import 'package:rider_app/models/address.dart';
import 'package:rider_app/provider/app_data.dart';
import 'package:rider_app/services/apis.dart';

class PredictionTile extends StatelessWidget {
  // final PlacePruedictions placePredictions;
  // PredictionTile(this.placePredictions);

  void getPlaceAddressDetails(String placeId, context) async {
    showDialog(
      context: context,
      builder: (BuildContext context) => CircularProgressIndicator(),
    );
    String placeDetailsUrl =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$mapKey';
    var response = await ApiMethode.getRequest(placeDetailsUrl);
    Navigator.pop(context);
    if (response == 'Fieled') {
      return;
    }
    if (response["status"] == "OK") {
      Address address = Address();
      address.placeName = response["result"]["name"];
      address.placeId = placeId;
      address.latitude = response["result"]["geometry"]["location"]["lat"];
      address.longitude = response["result"]["geometry"]["location"]["lng"];
      Provider.of<AppData>(context, listen: false)
          .updateDropOffLocationAddress(address);
      print('This is Drop off Location:');
      print(address.placeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //    getPlaceAddressDetails(placePredictions.placeId, context);
      },
      child: Container(
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
      ),
    );
  }
}
