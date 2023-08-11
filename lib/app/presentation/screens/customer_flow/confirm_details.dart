import 'package:aquayar/app/bloc/order/order_bloc.dart';
import 'package:aquayar/app/presentation/screens/customer_flow/map.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/blue_icon_map_scrreen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/buttom_outline_container_map_screen_two.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/buttom_outline_container_one_map_screen.dart';
import 'package:aquayar/app/presentation/screens/onboarding_flow/payment_container_map_screen.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/direction_map_less.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/direction_map_more.dart';
import 'package:aquayar/app/presentation/widgets/customer_flow/outlined_container.dart';
import 'package:aquayar/app/presentation/widgets/onboarding_flow/title_text.dart';
import 'package:aquayar/utilities/constants.dart/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmDetails extends StatefulWidget {
  const ConfirmDetails({super.key, required this.data});
  final Map<String, dynamic> data;
  @override
  State<ConfirmDetails> createState() => _ConfirmDetailsState();
}

class _ConfirmDetailsState extends State<ConfirmDetails> {
  String step = "one";
  @override
  void initState() {
    final orderBloc = context.read<OrderBloc>();
    orderBloc.add(OrderEventGetPrice(widget.data["address"],
        "${widget.data["driver"].coordinates[1]},${widget.data["driver"].coordinates[0]}",
        token: widget.data["token"], waterSize: widget.data["waterSize"]));
    super.initState();
  }

  bool showMore = false;

  @override
  Widget build(BuildContext context) {
    final orderBloc = context.read<OrderBloc>();

    return Scaffold(
      appBar: AppBar(
          title: Padding(
            padding: EdgeInsets.only(right: step == "four" ? 10 : 100.0),
            child: TextWidget(
              text: step == "one"
                  ? "Confirm Details"
                  : step == "two"
                      ? "Request Recieved"
                      : step == "three"
                          ? "Request Recieved"
                          : "Your delivery is underway...",
              color: const Color(0xFF20254F),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Image.asset(
              "assets/images/arrow_left.png",
              width: 24,
            ),
          )),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 26),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.inputBorder,
                ),
                borderRadius: BorderRadius.circular(24),
              ),
              child: MapSample(
                  startPosition: widget.data["address"],
                  endPosition:
                      "${widget.data["driver"].coordinates[1]},${widget.data["driver"].coordinates[0]}"),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: OutlinedContainer(
                        color: Colors.white,
                        padding: const EdgeInsets.only(
                            top: 10, bottom: 10, left: 24, right: 25),
                        borderRadius: 100,
                        child: Row(
                          children: [
                            const TextWidget(
                              text: "Delivering to:",
                              color: Color(0xFFADAFC2),
                            ),
                            const SizedBox(
                              width: 7,
                            ),
                            SizedBox(
                              width: 170,
                              child: TextWidget(
                                overflow: TextOverflow.ellipsis,
                                text: widget.data["address"],
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: step == "one" ? 20 : 10),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        step == "one"
                            ? const PaymentContainerMapScreen()
                            : const Text(""),
                        const BlueArrowMouseIcon(),
                      ],
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    BlocBuilder<OrderBloc, OrderState>(
                      builder: (context, state) {
                        if (state is OrderStateIsLoading) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: ButtomMapScreenTwo(
                                waterSize: widget.data["waterSize"]),
                          );
                        } else if (state is OrderStatePriceRetrieved) {
                          final data = {"price": state.price, ...widget.data};
                          return Column(
                            children: [
                              ButtomMapScreenOne(data: data),
                              const SizedBox(
                                height: 15,
                              ),
                              Transform.scale(
                                scaleX: 1.07,
                                child: GestureDetector(
                                  onTap: () {
                                    orderBloc.add(OrderEventGetOrderDetails(
                                        token: widget.data["token"],
                                        waterSize: widget.data["waterSize"],
                                        startLocation: widget.data["address"],
                                        endLocation: "6.8429,7.3733",
                                        price: state.price.toDouble(),
                                        driver: widget.data["driver"].id));
                                    // Navigator.pushNamed(
                                    //     context, Routes.directionMap);
                                  },
                                  child: Image.asset(
                                    "assets/images/confirm_blue.png",
                                  ),
                                ),
                              )
                            ],
                          );
                        } else if (state is OrderStateOrderCreated) {
                          return Column(
                            children: [
                              showMore
                                  ? DirectionMapScreenMore(showLessOnMap: () {
                                      setState(() {
                                        showMore = false;
                                      });
                                    })
                                  : DirectionMapScreenLess(showMoreOnTap: () {
                                      setState(() {
                                        showMore = true;
                                      });
                                    }),
                              const SizedBox(
                                height: 25,
                              ),
                            ],
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
