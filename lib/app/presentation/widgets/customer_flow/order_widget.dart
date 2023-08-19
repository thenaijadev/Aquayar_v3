import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/data/providers/location_provider.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/circle_avatar_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/home_tab_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/order.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/show_promotion_bottom_sheet.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class OrderWidget extends StatefulWidget {
  const OrderWidget({super.key, required this.user, required this.orders});
  final AquayarAuthUser user;
  final List orders;

  @override
  State<OrderWidget> createState() => _OrderWidgetState();
}

class _OrderWidgetState extends State<OrderWidget> {
  bool isLoading = true;
  @override
  void initState() {
    super.initState();

    getAddress(widget.orders);
  }

  List<String> addresses = [];
  getAddress(orders) async {
    for (var order in orders) {
      final address = await LocationProvider().getAddressFromCorrdinates(
          '${order["customer"]["coordinates"][1]},${order["customer"]["coordinates"][0]}');
      addresses.add(address!);
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Routes.menu,
                    arguments: widget.user);
              },
              child: const CircleAvatarWidget(
                image: "assets/images/head.png",
              ),
            ),
            const CircleAvatarWidget(
              image: "assets/images/bell.png",
            )
          ],
        ),
        const TextWidget(
          text: "Good Morning,",
          fontSize: 32,
        ),
        TextWidget(
          text: widget.user.displayName!,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () {
            showPromotionBottomSheet(context);
          },
          child: Container(
            width: 340,
            height: 120,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TabWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.waterTank);
                },
                label: "Your Water Tank"),
            TabWidget(
                onTap: () {
                  Navigator.pushNamed(context, Routes.locations);
                },
                label: "Your Locations")
          ],
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: () {}, child: Image.asset("assets/images/search.png")),
              const TextWidget(
                text: "Orders",
                fontSize: 16,
              ),
              InkWell(
                  onTap: () {},
                  child: Image.asset("assets/images/calender.png")),
            ],
          ),
        ),
        const SizedBox(height: 12),
        isLoading
            ? const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: SpinKitSpinningLines(
                  color: Color.fromARGB(255, 4, 136, 231),
                  size: 40.0,
                ),
              )
            : SizedBox(
                height: 300,
                child: ListView.builder(
                  itemCount: widget.orders.length,
                  itemBuilder: (context, index) {
                    return Order(
                      order: widget.orders[index],
                      address: addresses[index],
                      image: "assets/images/order_icon.png",
                    );
                  },
                  // children: const [
                  //   Order(
                  //     image: "assets/images/order_icon.png",
                  //   ),
                  //   Order(
                  //     image: "assets/images/completed_order_icon.png",
                  //   ),
                  //   Order(
                  //     image: "assets/images/cancelled_order.png",
                  //   )
                  // ],
                ),
              )
      ],
    );
  }
}
