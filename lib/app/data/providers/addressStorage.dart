import 'package:aquayar/app/data/models/address.dart';
import 'package:aquayar/app/data/models/boxes.dart';

class AddressStorage {
  Future<void> addAddress({required name, required address}) async {
    final Address theAddress = Address(name: name, address: address);
    final box = Boxes.getAddresses();
    box.add(theAddress);
  }
}
