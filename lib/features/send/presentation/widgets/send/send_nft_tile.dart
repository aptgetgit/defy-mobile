import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/presentation/widgets/custom_check_box.dart';

class SendNftTile extends ConsumerStatefulWidget {
  final String assetPath;
  final bool isChecked;
  final VoidCallback onTap;
  final bool isSelectionMode;

  const SendNftTile({
    required this.assetPath,
    required this.isChecked,
    required this.onTap,
    required this.isSelectionMode,
    super.key,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SendNftTileState();
}

class _SendNftTileState extends ConsumerState<SendNftTile> {
  @override
  Widget build(BuildContext context) => Stack(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.5,
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(widget.assetPath),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          child: Visibility(
            visible: widget.isSelectionMode,
            child: CustomCheckbox(
              isChecked: widget.isChecked,
              isRound: true,
              onTap: widget.onTap,
            ).animate().slideX(
                  begin: 1,
                  end: 0,
                  duration: const Duration(milliseconds: 100),
                ),
          ),
        ),
      ],
    );
}
