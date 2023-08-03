// import 'package:aquayar/app/presentation/widgets/customer_flow/address_form.dart';
// import 'package:aquayar/app/presentation/widgets/customer_flow/location_suggestion_widget.dart';
// import 'package:flutter/material.dart';

// void showAddressFormBottomSheet(BuildContext context) {
//   showModalBottomSheet(
//     backgroundColor: Colors.transparent,
//     context: context,
//     isScrollControlled: true,
//     builder: (BuildContext context) {
//       return Container(
//           decoration: const BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0),
//               topRight: Radius.circular(20.0),
//             ),
//           ),
//           height: MediaQuery.of(context).size.height * 0.8,
//           child: Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(15.0),
//                     child: GestureDetector(
//                         onTap: () {
//                           Navigator.pop(context);
//                         },
//                         child: Image.asset("assets/images/x.png")),
//                   )
//                 ],
//               ),
//               const AddressForm(
//                 labelFontSize: 24,
//                 labelFontWeight: FontWeight.bold,
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const LocationSuggestionWidget()
//             ],
//           ));
//     },
//   );
// }
