// ignore_for_file: use_build_context_synchronously
import 'package:defy/config/theme/colors.dart';
import 'package:defy/core/extensions/context_extensions.dart';
import 'package:defy/features/authentication/presentation/screens/authentication_screen.dart';
import 'package:defy/features/blockchain/presentation/screens/import_wallet/components/select_network.dart';
import 'package:defy/features/blockchain/presentation/screens/wallet_creation/widgets/confirm_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum PrivateKeyState {
  normal,
  invalid,
  valid,
}

class ImportPrivateKey extends ConsumerStatefulWidget {
  const ImportPrivateKey({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImportPrivateKeyState();
}

class _ImportPrivateKeyState extends ConsumerState<ImportPrivateKey> {
  final privateKey = TextEditingController();
  PrivateKeyNetwork network = PrivateKeyNetwork.aptos;
  PrivateKeyState validation = PrivateKeyState.normal;

  bool loading = false;

  @override
  void dispose() {
    privateKey.dispose();
    super.dispose();
  }

  final index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            for (int i = 1; i <= 4; i++)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 2.5),
                height: index == i ? 6 : 4,
                width: index == i ? 60 : 42,
                decoration: BoxDecoration(
                  color: i <= index ? Colors.green : colorFromHex('#F4F4F6'),
                  borderRadius: BorderRadius.circular(index == i ? 3 : 2),
                ),
              ).animate().scale(),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: context.screenHeight - 55 - MediaQuery.of(context).padding.top,
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Import through private key 🔑',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,),
              ),
              const Gap(10),
              Row(children: [
                const Icon(PhosphorIconsBold.key, size: 20),
                const Gap(5),
                Text(
                  'Private Key',
                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.w600,),
                ),
              ]),
              const Gap(10),
              Text(
                'Enter your 128-character Private Key below to import your wallet',
                style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
              ),
              const Gap(30),
              Visibility(
                visible: false,
                child: GestureDetector(
                  onTap: () async {
                    // network = await selectPrivateKeyNetwork(context) ?? network;
                    // setState(() {});
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        // child: network.getImage,
                      ),
                      const Gap(10),
                      Text(
                        "network.getName",
                      ),
                      const Spacer(),
                      // Text(
                      //   'Change ',
                      //   style: AppFont.of(context)
                      //       .GeneralMedium
                      //       .copyWith(color: Colors.blue),
                      // )
                    ],
                  ),
                ),
              ),
              const Gap(10),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: switch (validation) {
                      PrivateKeyState.valid => Colors.green,
                      PrivateKeyState.invalid => Colors.red,
                      _ => Colors.transparent,
                    },
                  ),
                ),
                child: TextField(
                  onTapOutside: (v) {},
                  controller: privateKey,
                  onChanged: (v) async {
                    if (v.contains(' ')) {
                      privateKey.text = v.replaceAll(' ', '');
                    }
                    final validity = true;
                        // await network.reference.validatePrivateKey(v);
                    validation = switch (validity) {
                      true => PrivateKeyState.valid,
                      false => PrivateKeyState.invalid,
                      _ => PrivateKeyState.normal,
                    };
                    setState(() {});
                  },
                  onSubmitted: (v) {},
                  minLines: 4,
                  maxLines: 4,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: colorFromHex('#F4F4F6'),
                    border: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: colorFromHex('#CFD2D8')!),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                      borderSide: BorderSide(color: colorFromHex('#CFD2D8')!),
                    ),
                    hintText: 'Enter private key here',
                    hintStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColors.greyLight),
                  ),
                ),
              ),
              const Gap(4),
              Container(
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    switch(validation) {
                        PrivateKeyState.invalid => Icon(PhosphorIconsRegular.x,color: Colors.red),
                        PrivateKeyState.valid => Icon(PhosphorIconsFill.checkCircle,color: Colors.green),
                        _ => SizedBox(),
                    },
                    const Gap(4),
                    Text(
                      switch (validation) {
                        PrivateKeyState.invalid => 'Not Valid ',
                        PrivateKeyState.valid => 'verified ',
                        _ => '',
                      },
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: switch (validation) {
                              PrivateKeyState.valid => Colors.green,
                              PrivateKeyState.invalid => Colors.red,
                              _ => Colors.transparent,
                            },
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              ConfirmButton(
                onTap: () async {
                  // if (privateKey.text.isEmpty) {
                  //   privateKey.text =
                  //       (await Clipboard.getData('text/plain'))?.text ?? '';
                  //   setState(() {});
                  // } else {
                  //   final status = true;
                  //   // await network.reference
                  //   //     .validatePrivateKey(privateKey.text);
                  //   if (status != true) {
                  //     // context.showToast(
                  //     //   title: 'Invalid Private Key',
                  //     //   type: ToastType.error,
                  //     // );
                  //   } else {
                  //     String privatekey = privateKey.text;
                  //     List<String> secrets = ShamirSecretManager(shares: 2)
                  //         .generate(secret: privatekey);

                  //     // ignore: unused_local_variable
                  //     final cloudKey = secrets.first;
                  //     final backendKey = secrets.last;

                  //     final res = await ref
                  //         .read(createSecretUseCaseProvider)
                  //         .call(backendKey, secretType: 'private_key');
                  //     res.fold(
                  //       (l) => context.showToast(
                  //         title: 'Operation Failed!',
                  //         type: ToastType.error,
                  //       ),
                  //       (r) async {
                  //         await ref
                  //             .read(credentialStrorageProvider)
                  //             .setIdMapSeed(r.shareId, privatekey);

                  //         /**
                  //          * TODO: Cloud backup of key: `r.shareId` and value: `cloudKey`
                  //          * TODO: On success, run below code
                  //          */

                  //         ref
                  //             .read(newWalletDataStateProvider.notifier)
                  //             .setShareId(r.shareId);
                  //         const WalletCreationScreenRoute()
                  //             .pushReplacement(context);
                  //       },
                  //     );
                  //     // createWalletFromPrivateKey(
                  //     //   ref: ref,
                  //     //   privateKey: privateKey.text,
                  //     //   persona: 'persona',
                  //     //   groupName: 'groupName',
                  //     // );
                  //   }
                  // }
                },
                label: privateKey.text.isEmpty
                    ? 'Paste from clipboard'
                    : 'Continue',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
