// import 'package:flutter/material.dart';
// import 'package:rive/rive.dart';
// import '../../assets/rive_asset.dart';

// class SideMenuTitle extends StatelessWidget {
//   const SideMenuTitle({
//     Key? key,
//     required this.menu,
//     required this.press,
//     required this.riveonInit,
//     required this.isActive,
//   }) : super(key: key);

//   final RiveAsset menu;
//   final VoidCallback press;
//   final ValueChanged<Artboard> riveonInit;
//   final bool isActive;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.only(left: 24),
//           child: Divider(
//             color: Colors.white24,
//             height: 1,
//           ),
//         ),
//         ListTile(
//           onTap: press,
//           leading: SizedBox(
//             height: 50, // Set a fixed height for the Rive animation
//             width: 50,  // Set a fixed width for the Rive animation
//             child: RiveAnimation.asset(
//               menu.src,
//               artboard: menu.artboard,
//               onInit: riveonInit,
//             ),
//           ),
//           title: Text(
//             menu.title,
//             style: const TextStyle(color: Colors.white),
//           ),
//         ),
//       ],
//     );
//   }
// }
