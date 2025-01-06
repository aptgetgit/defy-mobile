// // ignore_for_file: use_build_context_synchronously, prefer_const_constructors
// import 'package:defy/config/assets.gen.dart';
// import 'package:defy/config/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_animate/flutter_animate.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:gap/gap.dart';
// import 'package:phosphor_flutter/phosphor_flutter.dart';

// class SeedCloudBackupScreen extends ConsumerStatefulWidget {
//   final String seedId;
//   final String secretShare;
//   const SeedCloudBackupScreen(this.seedId, this.secretShare, {super.key});

//   @override
//   ConsumerState<SeedCloudBackupScreen> createState() =>
//       _SeedCloudBackupScreenState();
// }

// class _SeedCloudBackupScreenState extends ConsumerState<SeedCloudBackupScreen> {
//   int page = 1;
//   bool create = false;
//   int index = 0;
//   Mnemonic? mnemonic;
//   String fileID = '';

//   @override
//   void initState() {
//     super.initState();
//     createKey();
//   }

//   void createKey() async {
//     // setState(() {
//     //   create = true;
//     // });
//     // final response = await ref.read(getCloudFilesProvider.future);
//     // response.fold((l) => null, (r) async {
//     //   if (r.isEmpty) {
//     //     newUser();
//     //   } else {
//     //     setState(() {
//     //       fileID = r.first.fileId;
//     //     });
//     //     update();
//     //   }
//     // });
//   }

//   Future<void> newUser() async {
//     // final cloudData = CloudDataEntity(
//     //   shareId: widget.seedId,
//     //   secretShare: widget.secretShare,
//     // );

//     // await inc();

//     // final CloudDataRes? cloudResponse = await ref
//     //     .read(cloudBackupDriveProvider.notifier)
//     //     .uploadFileToDrive(cloudData, "");
//     // await inc();

//     // if (cloudResponse == null) {
//     //   //handle error
//     //   return;
//     // }

//     // //store the fileId in the backend
//     // ref.read(
//     //   createCloudFileProvider(
//     //     CloudFileEntity(
//     //       cloudProvider: CloudProvider.google_drive,
//     //       fileId: cloudResponse.fileId!,
//     //       contentHash: cloudResponse.contentHash,
//     //     ),
//     //   ),
//     // );
//     // if (index == 2) {
//     //   await ref.read(credentialStrorageProvider).setSeed(mnemonic.toString());
//     //   const HomeScreenRoute().pushReplacement(context);
//     // }
//   }

//   Future<void> update() async {
//     // final String fileId = fileID;
//     // await inc();

//     // final cloudData = CloudDataEntity(
//     //   shareId: widget.seedId,
//     //   secretShare: widget.secretShare,
//     // );

//     // final CloudDataRes? cloudResponse = await ref
//     //     .read(cloudBackupDriveProvider.notifier)
//     //     .uploadFileToDrive(cloudData, fileId);
//     // await inc();

//     // if (cloudResponse == null) {
//     //   //handle error
//     //   return;
//     // }

//     // //store the fileId in the backend
//     // ref.read(
//     //   createCloudFileProvider(
//     //     CloudFileEntity(
//     //       cloudProvider: CloudProvider.google_drive,
//     //       fileId: cloudResponse.fileId!,
//     //       contentHash: cloudResponse.contentHash,
//     //     ),
//     //   ),
//     // );

//     // if (index == 2) {
//     //   await ref.read(credentialStrorageProvider).setSeed(mnemonic.toString());
//     //   //handle next screen navigation
//     //   HomeScreenRoute().pushReplacement(context);
//     // }
//   }

//   Future inc() async {
//     await Future.delayed(1.seconds);
//     setState(() => index++);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           icon: const Icon(PhosphorIconsBold.caretLeft),
//         ),
//         title: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             for (int i = 1; i <= 2; i++)
//               Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 5),
//                 height: page == i ? 6 : 4,
//                 width: page == i ? 60 : 42,
//                 decoration: BoxDecoration(
//                   color: page >= i ? Colors.green : AppColors.grey,
//                   borderRadius: BorderRadius.circular(page == i ? 3 : 2),
//                 ),
//               ).animate().scale(),
//           ],
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Gap(16),
//                 const Text(
//                   'Lets set up your Account',
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//                 const Gap(2),
//                 Text(
//                   'Create your wallet with two security levels',
//                   style: TextStyle(
//                       fontSize: 15,
//                       fontWeight: FontWeight.w700,
//                       color: AppColors.grey,
//                       ),
//                 ),
//               ],
//             ),
//             Container(
//               alignment: Alignment.center,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Gap(60),
//                   Assets.images.cloud.image(width: create ? 80 : 130),
//                   const Gap(25),
//                   const Text(
//                     'Cloud Key Storage',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   const Gap(8),
//                   Text(
//                     'Securely store your secret key in\npreffered cloud storage',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w700,
//                       color: isDarkMode ? whiteColor : greyDark,
//                     ),
//                   ),
//                   Visibility(
//                     visible: create,
//                     child: Column(
//                       children: [
//                         const Gap(20),
//                         BackupTile(
//                           icon: PhosphorIcons.shareFat(PhosphorIconsStyle.fill),
//                           label: 'Creating Local share',
//                           focusFactor: index - 0,
//                           active: index >= 0,
//                         ).animate().scale(duration: 1.seconds),
//                         BackupTile(
//                           icon: PhosphorIcons.shareNetwork(
//                               PhosphorIconsStyle.fill),
//                           label: 'Creating remote share',
//                           focusFactor: index - 1,
//                           active: index >= 1,
//                         ).animate().scale(duration: 1.seconds),
//                         BackupTile(
//                           icon: PhosphorIcons.cloudArrowUp(
//                               PhosphorIconsStyle.fill),
//                           label: 'Creating cloud backup',
//                           focusFactor: index - 2,
//                           active: index >= 2,
//                         ).animate().scale(duration: 1.seconds),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             const Spacer(),
//             Visibility(
//               visible: !create,
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: ActiveButton(
//                   label: 'Create Key',
//                   onTap: createKey,
//                   isDarkMode: isDarkMode,
//                   size: ButtonSize.large,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
