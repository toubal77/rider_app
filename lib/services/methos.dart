import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:rider_app/models/address.dart';
import 'package:rider_app/provider/app_data.dart';
import 'package:rider_app/services/apis.dart';

class Methods {
  static Future<String> searchCoordinationAddress(
      Position position, context) async {
    String placeAdress = '';
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBxh495I4tEc6Q37vGyuqt2i3Mjpoheqis';
    var response = await ApiMethode.getRequest(url);
    if (response != 'Fieled') {
      //placeAdress = response['results'][0]['formatted_address'];
      placeAdress = response['results'][0]['address_components'][0]
              ['long_name'] +
          ', ' +
          response['results'][0]['address_components'][1]['long_name'] +
          ', ' +
          response['results'][0]['address_components'][5]['long_name'] +
          ', ' +
          response['results'][0]['address_components'][6]['long_name'];
      Address userPickUpAddress = new Address();
      userPickUpAddress.longitude = position.longitude;
      userPickUpAddress.latitude = position.latitude;
      userPickUpAddress.placeName = placeAdress;
      Provider.of<AppData>(context, listen: false)
          .updatePickUpLocationAddress(userPickUpAddress);
    }
    return placeAdress;
  }
}
