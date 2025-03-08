import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

import '../../../config/theme/colors.dart';
import '../../shared/presentation/widgets/custom_check_box.dart';

class WatchlistBottomSheet extends StatefulWidget {
  final Function(int?) onAddToWatchlist;

  const WatchlistBottomSheet({super.key, required this.onAddToWatchlist});

  @override
  State<WatchlistBottomSheet> createState() => _WatchlistBottomSheetState();
}

class _WatchlistBottomSheetState extends State<WatchlistBottomSheet> {
  // Add your selection logic here.  For example:
  int? _selectedCollectionIndex; // Track the selected collection
  bool _isCreatingCollection = false;

  @override
  Widget build(BuildContext context) {
    return _isCreatingCollection // Show create collection screen if true
        ? _buildCreateCollectionScreen()
        : _buildMainBottomSheet(); // Otherwise, show the main bottom sheet
  }

  Widget _buildMainBottomSheet() => Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
        ),
        padding: const EdgeInsets.only(
          top: 12,
          left: 20,
          right: 4,
          bottom: 32
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                const Text(
                  'Choose Collection',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(PhosphorIconsBold.x, color: Colors.black, size: 24),
                ),
              ],
            ),
            const Gap(4),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Column(
                children: [
                  _buildCollectionItem(
                    title: 'Safety Tokens 🤩',
                    count: 4,
                    index: 0, // Add an index for each collection
                    onTap: () {
                      setState(() {
                        _selectedCollectionIndex = 0;
                      });
                    },
                  ),
                  _buildCollectionItem(
                    title: 'Avatar NFT',
                    count: 8,
                    index: 1,
                    onTap: () {
                      setState(() {
                        _selectedCollectionIndex = 1;
                      });
                    },
                  ),
                  _buildCollectionItem(
                    title: 'Cute NFTs 🐣',
                    count: 8,
                    index: 2,
                    onTap: () {
                      setState(() {
                        _selectedCollectionIndex = 2;
                      });
                    },
                  ),
                  const Gap(10),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isCreatingCollection = true; // Navigate to create screen
                      });
                    },
                    child: Container(
                      height: 54,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.greyVeryLight,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Gap(10),
                          const Icon(PhosphorIconsFill.plusCircle,size: 28),
                          Gap(10),
                          const Text('Create new collection', style: TextStyle(fontSize:16,color: AppColors.greyLight)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      // Implement add to watchlist logic, using _selectedCollectionIndex
                      if (_selectedCollectionIndex != null) {
                        widget.onAddToWatchlist(_selectedCollectionIndex!);
                        Navigator.pop(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedCollectionIndex != null
                          ? AppColors.black
                          : AppColors.greyMedium,
                      elevation: 0,
                      foregroundColor: Colors.white,
                      minimumSize: const Size(double.infinity, 54),
                      textStyle: const TextStyle(fontSize: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      ),
                    ),
                    child: const Text('Add to Watchlist'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );

  Widget _buildCreateCollectionScreen() => Align(
    alignment: Alignment.bottomCenter,
    child: Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(21),
            topRight: Radius.circular(21),
          ),
        ),
        padding: const EdgeInsets.only(top: 12,bottom: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 4, right: 4),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _isCreatingCollection = false; // Go back to main sheet
                      });
                    },
                    icon: const Icon(PhosphorIconsBold.caretLeft, size: 24), // Back button
                  ),
                  const Text(
                    'New Token Collection',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the whole sheet
                    },
                    icon: const Icon(PhosphorIconsBold.x, color: Colors.black, size: 24),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Gap(8),
                  const Text("Collections helps you to group tokens and keep track on them",
                    style: TextStyle(fontSize: 16, color: AppColors.greyLight),),
                  const Gap(20),
                  const Text("Collection name", style: TextStyle(fontSize: 14,color: AppColors.greyLight)),
                  const Gap(4),
                  Container(
                    height: 54,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.greyVeryLight,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  Widget _buildCollectionItem({
    required String title,
    required int count,
    required int index, // Add an index parameter
    required VoidCallback onTap,
  }) =>
      InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(title, style: const TextStyle(fontSize: 18)),
                  Text('$count Tokens',
                      style: const TextStyle(fontSize: 14, color: Color.fromARGB(255, 100, 109, 128)),),
                ],
              ),
              const Spacer(),
              CustomCheckbox(
                isChecked: _selectedCollectionIndex == index,
                isRound: true,
                onTap: () {
                  setState(() {
                    _selectedCollectionIndex = index;
                  });
                },
              ),
            ],
          ),
        ),
      );
}