// : step == "three"
                  //     ? Padding(
                  //         padding: const EdgeInsets.symmetric(
                  //             horizontal: 32.0, vertical: 55),
                  //         child: Column(
                  //           children: [
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.end,
                  //               children: [
                  //                 Container(
                  //                   width: 50,
                  //                   height: 50,
                  //                   decoration: const ShapeDecoration(
                  //                     gradient: LinearGradient(
                  //                       begin: Alignment(0.75, -0.67),
                  //                       end: Alignment(-0.75, 0.67),
                  //                       colors: [
                  //                         Color(0xFF60C6F9),
                  //                         Color(0xFF0479CD)
                  //                       ],
                  //                     ),
                  //                     shape: OvalBorder(),
                  //                     shadows: [
                  //                       BoxShadow(
                  //                         color: Color(0x1E000000),
                  //                         blurRadius: 14,
                  //                         offset: Offset(0, 4),
                  //                         spreadRadius: 0,
                  //                       )
                  //                     ],
                  //                   ),
                  //                   child:
                  //                       Image.asset("assets/images/mouse.png"),
                  //                 )
                  //               ],
                  //             ),
                  //             const SizedBox(
                  //               height: 12,
                  //             ),
                  //             OutlinedContainer(
                  //               borderRadius: 24,
                  //               child: Column(
                  //                 children: [
                  //                   Row(
                  //                     children: [
                  //                       Image.asset(
                  //                         "assets/images/timer.png",
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 10,
                  //                       ),
                  //                       const Column(
                  //                         crossAxisAlignment:
                  //                             CrossAxisAlignment.start,
                  //                         children: [
                  //                           TextWidget(
                  //                             text: "1H 25M - 1H 25M",
                  //                             fontSize: 20,
                  //                             fontWeight: FontWeight.bold,
                  //                           ),
                  //                           TextWidget(
                  //                             text:
                  //                                 'Estimated Time of Delivery',
                  //                             color: Color(0xFF868FAD),
                  //                             fontSize: 14,
                  //                           ),
                  //                         ],
                  //                       ),
                  //                       const SizedBox(
                  //                         width: 30,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Image.asset(
                  //                               "assets/images/drop.png"),
                  //                           const SizedBox(
                  //                             width: 8,
                  //                           ),
                  //                           const Column(
                  //                             children: [
                  //                               TextWidget(
                  //                                 text: "500",
                  //                                 fontSize: 20,
                  //                                 fontWeight: FontWeight.bold,
                  //                               ),
                  //                               TextWidget(
                  //                                 text: "Liters",
                  //                                 color: Color(0xFF868FAD),
                  //                                 fontSize: 14,
                  //                               )
                  //                             ],
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                   !isLoading
                  //                       ? const SizedBox(
                  //                           height: 16.5,
                  //                         )
                  //                       : const Text(""),
                  //                   const HorizontalLineWidget(),
                  //                   Padding(
                  //                     padding: const EdgeInsets.symmetric(
                  //                         vertical: 16.0),
                  //                     child: Image.asset(
                  //                         "assets/images/loading_frame.png"),
                  //                   ),
                  //                   Column(
                  //                     children: [
                  //                       Container(
                  //                           width: double.infinity,
                  //                           decoration: const BoxDecoration(),
                  //                           height: 2,
                  //                           child: const RoundedProgressBar(
                  //                             progress: .3,
                  //                             height: 14,
                  //                             progressColor: Color.fromARGB(
                  //                                 199, 4, 121, 205),
                  //                             backgroundColor: Colors.white,
                  //                           )),
                  //                       const SizedBox(
                  //                         height: 16,
                  //                       ),
                  //                       Row(
                  //                         children: [
                  //                           Stack(
                  //                             alignment:
                  //                                 AlignmentDirectional.center,
                  //                             children: [
                  //                               const SizedBox(
                  //                                   width: 52,
                  //                                   height: 52,
                  //                                   child:
                  //                                       WaterTank(number: 85)),
                  //                               Image.asset(
                  //                                   "assets/images/water_drop.png")
                  //                             ],
                  //                           ),
                  //                           const SizedBox(
                  //                             width: 16,
                  //                           ),
                  //                           const TextWidget(
                  //                             text: 'Connecting....',
                  //                             color: Color(0xFFADAFC2),
                  //                             fontSize: 14,
                  //                           ),
                  //                           Transform.scale(
                  //                             scale: .8,
                  //                             child: OutlinedContainer(
                  //                               borderRadius: 100,
                  //                               padding:
                  //                                   const EdgeInsets.symmetric(
                  //                                       vertical: 10,
                  //                                       horizontal: 20),
                  //                               child: Row(
                  //                                 children: [
                  //                                   Image.asset(
                  //                                       "assets/images/x.png"),
                  //                                   const SizedBox(
                  //                                     width: 10,
                  //                                   ),
                  //                                   const TextWidget(
                  //                                     text: "Cancel",
                  //                                     fontWeight:
                  //                                         FontWeight.bold,
                  //                                   )
                  //                                 ],
                  //                               ),
                  //                             ),
                  //                           )
                  //                         ],
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             const SizedBox(
                  //               height: 15,
                  //             ),
                  //           ],
                  //         ),
                  //       )