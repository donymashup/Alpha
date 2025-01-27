// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import 'package:alpha/common_widgets/info_card.dart';
// import 'package:alpha/common_widgets/rive_asset.dart';
// import 'package:alpha/common_widgets/side_menu_title.dart';

// class SideMenu extends StatefulWidget {
//   const SideMenu({super.key});

//   @override
//   _SideMenuState createState() => _SideMenuState();
// }

// class _SideMenuState extends State<SideMenu> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         width: 228,
//         height: double.infinity,
//         color: const Color(0xFF17203A),
//         child: SafeArea(
//           child: Column(
//             children: [
//               const InfoCard(
//                 name: "John Doe",
//                 profession: "Software Developer",
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Browse".toUpperCase(),
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleMedium!
//                       .copyWith(color: Colors.white70),
//                 ),
//               ),
//               ...sideMenus.map(
//                 (menu) => SideMenuTitle(
//                   menu: menu,
//                   press: () {
//                     // Define the action when menu item is clicked
//                   },
//                   riveonInit: (artboard) {
//                     // Initialize the artboard and state machine
//                     final controller = StateMachineController.fromArtboard(
//                         artboard, menu.stateMachineName);
//                     if (controller != null) {
//                       artboard.addController(controller);
//                       menu.setInput = controller.findInput<bool>("active")!;
//                     }
//                   },
//                   isActive: false, // Default state
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
