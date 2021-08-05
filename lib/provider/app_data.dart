import 'package:flutter/widgets.dart';
import 'package:rider_app/models/address.dart';

class AppData extends ChangeNotifier {
  Address? pickUpLocation, dropOffLocation;
  void updatePickUpLocationAddress(Address pickUpAddress) {
    pickUpLocation = pickUpAddress;
    notifyListeners();
  }

  void updateDropOffLocationAddress(Address dropOffAdress) {
    dropOffLocation = dropOffAdress;
    notifyListeners();
  }
}
