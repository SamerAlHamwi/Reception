// import 'dart:io';
//
// import 'package:image_cropper/image_cropper.dart';
// import '../../core/constants/constant.dart';
// import '../../core/widgets/dialog/util_dialog.dart';
// import 'package:easy_localization/easy_localization.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
//
//
// class Tool {
//   static void displayModalBottomSheet(
//     context,
//     ValueChanged<XFile?>? onSuccess, {
//     String? title_button_1,
//     String? title_button_2,
//     Function()? takeFromGellary,
//     Function()? takeFromCamera,
//   }) {
//     showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             padding: const EdgeInsets.all(16.0),
//             decoration: const BoxDecoration(
//                 color: Colors.white,
//                 /*borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(50.0),
//                   topRight: Radius.circular(50.0),
//                 )*/
//             ),
//             child: Wrap(
//               children: <Widget>[
//                 ListTile(
//                   leading: const Icon(Icons.image),
//                   title: Text(title_button_1!),
//                   onTap: takeFromGellary,
//                   // () {
//                   //   buildImage(
//                   //     source: ImageSource.gallery,
//                   //     context: context,
//                   //     onSuccess: onSuccess!,
//                   //   );
//                   // },
//                 ),
//                 // ListTile(
//                 //   leading: const Icon(Icons.camera_alt_outlined),
//                 //   title: Text(title_button_2!),
//                 //   onTap: takeFromCamera,
//                 //   // () {
//                 //   //   buildImage(
//                 //   //     source: ImageSource.camera,
//                 //   //     context: context,
//                 //   //     onSuccess: onSuccess!,
//                 //   //   );
//                 //   // },
//                 // ),
//               ],
//             ),
//           );
//         });
//   }
//
//   static buildImage(
//       {ImageSource? source,
//         required BuildContext context,
//         ValueChanged<XFile?>? onSuccess}) async {
//     // Step #1: Pick an image
//     await ImagePicker().pickImage(source: source!).then((pickedFile) async {
//       // Step #2: Check if we actually picked an image. Otherwise -> stop;
//
//       if (pickedFile == null) return;
//
//       // Step #3: Crop earlier selected image
//
//       await cropSelectedImage(pickedFile.path).then((croppedFile) {
//         // Step #4: Check if we actually cropped an image. Otherwise -> stop;
//         if (croppedFile == null) return;
//         if (isValidImage(XFile(croppedFile.path), context)) {
//           // Step #5: if the image is valid save the changes and close screen
//           Navigator.pop(context);
//           onSuccess!(XFile(croppedFile.path));
//         }
//       });
//     });
//   }
//
//   static Future<File?> cropSelectedImage(String filePath) async {
//     return await ImageCropper().cropImage(
//       sourcePath: filePath,
//       // aspectRatio: const CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
//       androidUiSettings: AndroidUiSettings(
//           toolbarTitle: 'edit_photo'.tr(),
//           toolbarColor: AppColors.primaryColor,
//           toolbarWidgetColor: Colors.white,
//           initAspectRatio: CropAspectRatioPreset.original),
//       iosUiSettings: IOSUiSettings(
//         title: 'edit_photo'.tr(),
//         aspectRatioLockEnabled: true,
//         minimumAspectRatio: 1.0,
//         aspectRatioPickerButtonHidden: true,
//       ),
//     );
//   }
//
//
//   static bool isValidImage(XFile? image, BuildContext context) {
//     List validFormat = ['png', 'jpg', 'JPG', 'jpeg', 'JPEG'];
//     if (validFormat.contains(image!.name.split('.').last)) {
//       return true;
//     } else {
//       UtilDialog.showInformation(context,
//           content: 'invalid_format'.tr(), title: 'error'.tr());
//       return false;
//     }
//   }
//
// }
