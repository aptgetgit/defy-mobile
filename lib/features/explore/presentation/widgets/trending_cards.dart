import 'dart:async';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TrendingCards extends StatefulWidget {

  const TrendingCards({required this.isToggled, super.key});
  final bool isToggled;

  @override
  State<TrendingCards> createState() => _TrendingCardsState();
}

class _TrendingCardsState extends State<TrendingCards> {
  final ScrollController _scrollController = ScrollController();
  Timer? _autoScrollTimer;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
  }

  void _startAutoScroll() {
    _autoScrollTimer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_scrollController.hasClients) {
        final double maxScroll = _scrollController.position.maxScrollExtent;
        final double newOffset = _scrollController.offset + 338;

        if (newOffset >= maxScroll) {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        } else {
          _scrollController.animateTo(
            newOffset,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      }
    });
  }

  @override
  void dispose() {
    _autoScrollTimer?.cancel();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollTrending(int direction) {
    final double offset = _scrollController.offset + (direction * 338);
    _scrollController.animateTo(
      offset,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) => Container(
        width: 361,
        height: 168,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text(
                  widget.isToggled ? 'Launching' : 'Trending',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                _buildScrollButton(
                  icon: PhosphorIcons.caretLeft(PhosphorIconsStyle.bold),
                  onTap: () => _scrollTrending(-1),
                ),
                const SizedBox(width: 8),
                _buildScrollButton(
                  icon: PhosphorIcons.caretRight(PhosphorIconsStyle.bold),
                  onTap: () => _scrollTrending(1),
                ),
              ],
            ),
            const Gap(12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: _scrollController,
              child: Row(
                children: <Widget>[
                  _buildTrendingCard(
                    emoji: '😎',
                    title: 'Coolers',
                    subtitle: 'Hot Emoji 🔥',
                    percentage: '+2.5%',
                    percentageColor: Colors.green,
                  ),
                  const Gap(12),
                  _buildTrendingCard(
                    emoji: '🌍',
                    title: 'Earth',
                    subtitle: 'Hot Emoji 🔥',
                    percentage: '-3.1%',
                    percentageColor: Colors.red,
                  ),
                  const Gap(12),
                  _buildTrendingCard(
                    emoji: '🚀',
                    title: 'Space',
                    subtitle: 'Trending Now',
                    percentage: '+4.7%',
                    percentageColor: Colors.green,
                  ),
                  const Gap(12),
                  _buildTrendingCard(
                    emoji: '🎮',
                    title: 'Gaming',
                    subtitle: 'Popular Choice',
                    percentage: '-1.8%',
                    percentageColor: Colors.red,
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget _buildScrollButton({required IconData icon, required VoidCallback onTap}) => GestureDetector(
      onTap: onTap,
      child: Container(
        height: 32,
        width: 32,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Color(0xFFE0E0E0),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 18,
            color: Colors.black54,
          ),
        ),
      ),
    );

  Widget _buildTrendingCard({
    required String emoji,
    required String title,
    required String subtitle,
    required String percentage,
    required Color percentageColor,
  }) =>
      Container(
        width: 163,
        height: 103,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      emoji,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                ),
                const Gap(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          color: Colors.orange,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(10),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(
                        percentageColor == Colors.green
                            ? Icons.arrow_drop_up
                            : Icons.arrow_drop_down,
                        color: percentageColor,
                      ),
                      Text(
                        percentage,
                        style: TextStyle(
                          color: percentageColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.blue, width: 2),
                    ),
                    child: const Icon(
                      Icons.arrow_outward,
                      size: 16,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
