import 'package:aquayar/app/data/models/auth_user.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/no_order_widget.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/order_widget.dart';
import 'package:aquayar/router/routes.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:clay_containers/constants.dart';
import 'package:clay_containers/widgets/clay_container.dart';
import 'package:flutter/material.dart';

class HomeScreenNoOrder extends StatefulWidget {
  const HomeScreenNoOrder({super.key, required this.user});
  final AuthUser user;
  @override
  State<HomeScreenNoOrder> createState() => _HomeScreenNoOrderState();
}

class _HomeScreenNoOrderState extends State<HomeScreenNoOrder> {
  bool noOrder = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: !noOrder
          ? SizedBox(
              height: 70,
              width: 70,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, Routes.orderWater);
                },
                child: ClayContainer(
                  color: const Color.fromARGB(255, 4, 136, 231),
                  parentColor: Colors.white,
                  height: 150,
                  width: 250,
                  depth: 40,
                  borderRadius: 75,
                  curveType: CurveType.convex,
                  child: Image.asset("assets/images/drop_icon.png"),
                ),
              ),
            )
          : null,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
          child: SingleChildScrollView(
              child: noOrder
                  ? NoOrderWidget(user: widget.user)
                  : OrderWidget(user: widget.user)),
        ),
      ),
    );
  }
}
