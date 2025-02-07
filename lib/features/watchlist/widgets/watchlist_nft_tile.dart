import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class WatchlistNFTTile extends StatefulWidget {
  final bool deleteNft;
  const WatchlistNFTTile({required this.deleteNft, super.key});

  @override
  State<WatchlistNFTTile> createState() => _WatchlistNFTTileState();
}

class _WatchlistNFTTileState extends State<WatchlistNFTTile> with SingleTickerProviderStateMixin {
  bool clickDelete = false;
  bool isDeleted = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 6),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void delete() {
    _controller.forward(from: 0.0);

    setState(() {
      clickDelete = !clickDelete;
    });

    Future.delayed(const Duration(seconds: 6), () {
      if (clickDelete) {
        setState(() {
          isDeleted = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: !isDeleted,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Stack(
              children: [
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: clickDelete ? MediaQuery.of(context).size.width : 0,
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image(
                                height: 55,
                                width: 55,
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/watchlist2.png"),
                              ),
                            ],
                          ),
                          const Gap(12),
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: "Funky Monkey",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "14K",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                const Gap(4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text.rich(
                                      TextSpan(
                                        text: "\$123.39",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: "32 APT ",
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(12),
                          Visibility(
                            visible: widget.deleteNft,
                            child: GestureDetector(
                              onTap: delete,
                              child: Icon(
                                PhosphorIcons.minusCircle(PhosphorIconsStyle.bold),
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  left: clickDelete ? 0 : MediaQuery.of(context).size.width,
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 6),
                    height: clickDelete ? 45 : 65,
                    width: MediaQuery.of(context).size.width,
                    child: Container(
                      color: Colors.grey[200],
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Visibility(
                                visible: clickDelete,
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (context, child) {
                                    return ShaderMask(
                                      shaderCallback: (Rect bounds) => LinearGradient(
                                        colors: <Color>[Colors.grey, Colors.grey.withOpacity(0.6)],
                                        stops: <double>[_controller.value, _controller.value],
                                      ).createShader(bounds),
                                      child: Text(
                                        "Removing from collection",
                                        style: TextStyle(
                                          color: Colors.grey.withOpacity(0.6),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                              GestureDetector(
                                onTap: delete,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(color: Colors.black, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4),
                                    child: Text(
                                      "undo",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}