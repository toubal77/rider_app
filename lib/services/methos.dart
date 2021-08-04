import 'package:geolocator/geolocator.dart';
import 'package:rider_app/services/apis.dart';

class Methods {
  static Future<String> searchCoordinationAddress(Position position) async {
    String placeAdress = '';
    String url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=${position.latitude},${position.longitude}&key=AIzaSyBxh495I4tEc6Q37vGyuqt2i3Mjpoheqis';
    var response = await ApiMethode.getRequest(url);
    if (response != 'Fieled') {
      placeAdress = response['results'][0]['formatted_address'];
    }
    return placeAdress;
  }
}
