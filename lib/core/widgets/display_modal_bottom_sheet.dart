// import 'package:ai_barcode_scanner/ai_barcode_scanner.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import '../../core/boilerplate/create_model/cubits/create_model_cubit.dart';
// import '../../core/boilerplate/create_model/widgets/CreateModel.dart';
// import '../../core/constants/app_assets.dart';
// import '../../core/constants/app_colors.dart';
// import '../../core/constants/app_theme.dart';
// import '../../core/utils/shared_storage.dart';
//
// import '../constants/app_dimension.dart';
// import '../utils/navigation.dart';
// import 'buttons/main_elevated_button.dart';
//
// class DisplayModalBottomSheet extends StatefulWidget {
//   DisplayModalBottomSheet();
//
//   @override
//   _DisplayModalBottomSheetState createState() =>
//       _DisplayModalBottomSheetState();
// }
// //todo reports
//
// class _DisplayModalBottomSheetState extends State<DisplayModalBottomSheet> {
//   @override
//   void initState() {
//     // TODO: implement initState
//
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MainElevatedButton(
//       height: 40,
//       width: 150,
//       buttonColor: AppColors.primaryColor,
//       isSmall: true,
//       onPressed: () {
//         displayModalBottomSheetReports();
//       },
//       text: 'start_new_game'.tr(),
//     );
//   }
//
//   displayModalBottomSheetReports() {
//     return showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (BuildContext context) {
//           return ContentBottomSheet();
//         });
//   }
// }
//
// class ContentBottomSheet extends StatefulWidget {
//   ContentBottomSheet();
//
//   @override
//   _ContentBottomSheetState createState() => _ContentBottomSheetState();
// }
//
// class _ContentBottomSheetState extends State<ContentBottomSheet> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: AppDimension.screenHeight(context) * 4 / 10,
//       padding: const EdgeInsets.all(16.0),
//       decoration: const BoxDecoration(
//           color: AppColors.lightGrey,
//           borderRadius: BorderRadius.only(
//             topLeft: Radius.circular(25.0),
//             topRight: Radius.circular(25.0),
//           )),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           Expanded(
//             flex: 1,
//             child: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: Icon(
//                   Icons.keyboard_arrow_down,
//                   color: AppColors.grey,
//                   size: 35,
//                 )),
//           ),
//           Expanded(
//             flex: 2,
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 'select_options'.tr(),
//                 style: AppTheme.headline6,
//               ),
//             ),
//           ),
//           Expanded(
//               flex: 5,
//               child: Row(
//                 children: [
//                   _optionCard(
//                       imageUrl: AppAssets.appLogoURI,
//                       cardId: 1,
//                       title: 'game_code'.tr(),
//                   ),
//                   _optionCard(
//                       imageUrl: AppAssets.appLogoURI,
//                       cardId: 2,
//                       title: 'QR_code'.tr())
//                 ],
//               )),
//           Expanded(
//             child: Container(),
//             flex: 1,
//           )
//         ],
//       ),
//     );
//   }
//
//   CreateModelCubit? customCubit;
//
//   _optionCard({imageUrl, cardId, title, nextPage}) {
//     return Expanded(
//         child: InkWell(
//           onTap: ()  {
//           },
//           child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(10),
//                 color: AppColors.white,
//
//               ),
//               margin: const EdgeInsets.symmetric(horizontal: 8),
//               child: Center(
//                 child: SingleChildScrollView(
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Image.asset(imageUrl),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(vertical: 16.0),
//                           child: Text(
//                             title,
//                             style: AppTheme.bodyText2.copyWith(
//                                 color: AppColors.primaryColor,
//                                 fontWeight: FontWeight.w500),
//                           ),
//                         )
//                       ]),
//                 ),
//               )),
//         ),
//
//     );
//   }
// }
