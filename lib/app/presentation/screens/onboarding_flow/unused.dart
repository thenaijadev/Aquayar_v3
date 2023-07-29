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






// class NewWidget extends StatelessWidget {
//   const NewWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
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
//                   const Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceBetween,
//                     children: [
//                       Column(
//                         children: [
//                           TextWidget(
//                               text: "1H",
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                           TextWidget(
//                             text: "Est. Time",
//                             color: Color(0xFF868FAD),
//                             fontSize: 14,
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           TextWidget(
//                               text: "3.4KM",
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                           TextWidget(
//                             text: "Distance",
//                             color: Color(0xFF868FAD),
//                             fontSize: 14,
//                           )
//                         ],
//                       ),
//                       Column(
//                         children: [
//                           TextWidget(
//                               text: "500",
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                           TextWidget(
//                             text: "Liters",
//                             color: Color(0xFF868FAD),
//                             fontSize: 14,
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 16.5,
//                   ),
//                   const HorizontalLineWidget(),
//                   Padding(
//                     padding: const EdgeInsets.only(top: 16.0),
//                     child: Row(
//                       children: [
//                         Container(
//                           height: 42,
//                           width: 42,
//                           decoration: BoxDecoration(
//                               borderRadius:
//                                   BorderRadius.circular(100),
//                               border: Border.all(
//                                   width: 4,
//                                   color: Colors.white)),
//                           child: Image.asset(
//                               "assets/images/head.png"),
//                         ),
//                         const SizedBox(
//                           width: 5,
//                         ),
//                         Column(
//                           crossAxisAlignment:
//                               CrossAxisAlignment.start,
//                           children: [
//                             const TextWidget(
//                               text: "Henry Immanuel",
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                             ),
//                             Row(
//                               children: [
//                                 const TextWidget(
//                                   text: "Driver",
//                                   color: Color(0xFF868FAD),
//                                   fontSize: 12,
//                                 ),
//                                 const SizedBox(
//                                   width: 5,
//                                 ),
//                                 const TextWidget(
//                                   text: 'ABJ-567-EA',
//                                   color: Color(0xFF868FAD),
//                                   fontSize: 16,
//                                 ),
//                                 const SizedBox(
//                                   width: 15,
//                                 ),
//                                 Image.asset(
//                                     "assets/images/red_dot.png")
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(
//                           width: 25,
//                         ),
//                         Column(
//                           children: [
//                             Row(
//                               children: [
//                                 Image.asset(
//                                     "assets/images/star_small.png"),
//                                 const SizedBox(width: 5),
//                                 const TextWidget(
//                                   text: "4.3",
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ],
//                             ),
//                             const TextWidget(
//                               text: "(246) trips",
//                               fontSize: 14,
//                             ),
//                           ],
//                         )
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 24),
//                   Row(
//                     mainAxisAlignment:
//                         MainAxisAlignment.spaceBetween,
//                     children: [
//                       OutlinedContainer(
//                         borderRadius: 100,
//                         padding: const EdgeInsets.only(
//                             top: 10,
//                             bottom: 10,
//                             left: 20,
//                             right: 20),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                                 "assets/images/chat_icon.png"),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const TextWidget(
//                               text: "Chat",
//                               fontSize: 14,
//                             )
//                           ],
//                         ),
//                       ),
//                       OutlinedContainer(
//                         borderRadius: 100,
//                         padding: const EdgeInsets.only(
//                             top: 10,
//                             bottom: 10,
//                             left: 20,
//                             right: 20),
//                         child: Row(
//                           children: [
//                             Image.asset(
//                                 "assets/images/phone.png"),
//                             const SizedBox(
//                               width: 10,
//                             ),
//                             const TextWidget(
//                               text: "Call",
//                               fontSize: 14,
//                             )
//                           ],
//                         ),
//                       ),
//                       const OutlinedContainer(
//                         borderRadius: 200,
//                         padding: EdgeInsets.all(10),
//                         child: Row(
//                           children: [
//                             Icon(Icons.expand_more_outlined)
//                           ],
//                         ),
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//           ],
//         ),
//       );
//   }
// }
