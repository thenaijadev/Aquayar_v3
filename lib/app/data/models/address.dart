import 'package:hive/hive.dart';
part 'address.g.dart';

@HiveType(typeId: 0)
class Address extends HiveObject {
  Address({
    required this.name,
    required this.address,
  });
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String address;
}
