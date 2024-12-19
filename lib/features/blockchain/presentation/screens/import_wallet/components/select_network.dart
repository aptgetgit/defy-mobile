import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum PrivateKeyNetwork {
  ethereum,
  solana,
  bitcoin,
  arbitrum,
  aptos,
}

Future<PrivateKeyNetwork?> selectPrivateKeyNetwork(BuildContext context) async {
  return await showModalBottomSheet(
    context: context,
    builder: (context) => const _PrivateKeyNetwork(),
    isScrollControlled: true,
    isDismissible: false,
    enableDrag: false,
    clipBehavior: Clip.hardEdge,
  );
}

class _PrivateKeyNetwork extends StatefulWidget {
  const _PrivateKeyNetwork();

  @override
  State<_PrivateKeyNetwork> createState() => _PrivateKeyNetworkState();
}

class _PrivateKeyNetworkState extends State<_PrivateKeyNetwork> {
  final search = TextEditingController();

  @override
  void dispose() {
    search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = context.screenHeight;
    return Container(
      height: height * 0.9,
      width: double.maxFinite,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    PhosphorIconsBold.caretLeft,
                    size: 20,
                  ),
                ),
                Text(
                  'Network',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: search,
              onChanged: (v) {
                setState(() {});
              },
              decoration: InputDecoration(
                isDense: true,
                fillColor: colorFromHex('#f4f4f6'),
                filled: true,
                hintText: 'Search Network',
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                border: const OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
            ),
          ),
          const Gap(10),
          ...(PrivateKeyNetwork.values.map((e) {
            final searchTerm = search.text.toLowerCase();
            final availableTerm = e.name;
            if (searchTerm.isNotEmpty && !availableTerm.contains(searchTerm)) {
              return Container();
            }
            return GestureDetector(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8,
                  vertical: 2,
                ),
                // child: ListTile(
                //   leading: e.getImage,
                //   title: Text(
                //     e.getName,
                //   ),
                // ),
              ),
            );
          }))
        ],
      ),
    );
  }
}
