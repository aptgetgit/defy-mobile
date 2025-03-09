import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';

class WatchlistTokenTile extends StatefulWidget {
  final bool deleteNft;
  const WatchlistTokenTile({required this.deleteNft, super.key});

  @override
  State<WatchlistTokenTile> createState() => _WatchlistTokenTileState();
}

class _WatchlistTokenTileState extends State<WatchlistTokenTile> with SingleTickerProviderStateMixin {
  bool clickDelete = false;
  bool isDeleted = false;

  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1, 0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void delete() {
    _controller.forward(from: 0);

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
    if (widget.deleteNft) {
      _controller.forward();
    } else {
      _controller.reverse();
    }

    return Column(
      children: <Widget>[
        Visibility(
          visible: !isDeleted,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 70,
            child: Stack(
              children: <Widget>[
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  right: clickDelete ? MediaQuery.of(context).size.width : 0,
                  top: 0,
                  bottom: 0,
                  child: SizedBox(
                    height: 55,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: <Widget>[
                          const Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Image(
                                height: 55,
                                width: 55,
                                fit: BoxFit.cover,
                                image: AssetImage('assets/images/watchlist2.png'),
                              ),
                            ],
                          ),
                          const Gap(12),
                          const Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: 'Funky Monkey',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '14K',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(4),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text.rich(
                                      TextSpan(
                                        text: r'$123.39',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    Text.rich(
                                      TextSpan(
                                        text: '32 APT ',
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
                          SlideTransition(
                            position: _offsetAnimation,
                            child: Visibility(
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
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Visibility(
                                visible: clickDelete,
                                child: AnimatedBuilder(
                                  animation: _controller,
                                  builder: (BuildContext context, Widget? child) => ShaderMask(
                                      shaderCallback: (Rect bounds) => LinearGradient(
                                        // colors: <Color>[Colors.grey, Colors.grey.withOpacity(0.6)],
                                           colors: <Color>[AppColors.greyDark, AppColors.greyLight.withValues(alpha: 0.6),],
                                        stops: <double>[_controller.value, _controller.value],
                                      ).createShader(bounds),
                                      child: Text(
                                        'Removing from collection',
                                        style: TextStyle(
                                          color: AppColors.greyLight.withValues(alpha: 0.6),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                ),
                              ),
                              GestureDetector(
                                onTap: delete,
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    border: Border.all(),
                                  ),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 4),
                                    child: Text(
                                      'undo',
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
