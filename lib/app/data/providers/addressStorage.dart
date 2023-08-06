import 'package:aquayar/app/data/models/address.dart';
import 'package:aquayar/app/data/models/boxes.dart';
import 'package:hive/hive.dart';

class AddressStorage {
  static Future<void> addAddress({required address}) async {
    await Hive.openBox<Address>("address");
    final Address theAddress = Address(address: address);
    final box = Boxes.getAddresses();
    if (box.length < 2) {
      box.add(theAddress);
    }
  }

  static Future<void> deleteAddress({required address}) async {
    await Hive.openBox<Address>("address");
    final Address theAddress = Address(address: address);
    final box = Boxes.getAddresses();
    if (box.length < 2) {
      box.add(theAddress);
    }
  }

  static Future<void> editName({index, required String name}) async {
    await Hive.openBox<Address>("address");
    final box = Boxes.getAddresses();
    final address = box.get(index)?.address ?? "";
    box.put(index, Address(address: address, name: name));
  }

  static Future<void> editAddress({index, required String address}) async {
    await Hive.openBox<Address>("address");
    final box = Boxes.getAddresses();
    final name = box.get(index)?.name ?? "";
    box.put(index, Address(address: address, name: name));
  }
}
