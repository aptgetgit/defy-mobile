import 'package:defy/config/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  final TextEditingController _searchConroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Column(children: [
                  //search bar
                  Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                      color: Color(0xfff4f4f6),
                      borderRadius: BorderRadius.circular(58),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Gap(16),
                        Icon(
                          PhosphorIconsBold.magnifyingGlass,
                          color: AppColors.greyMedium,
                        ),
                        const Gap(8),
                        Expanded(
                          child: TextField(
                            autofocus: true,
                            textAlign: TextAlign.start,
                            controller: _searchConroller,
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Search or paste URL",
                              hintStyle: TextStyle(
                                color: AppColors.greyMedium,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        Icon(
                          PhosphorIconsBold.cards,
                          color: AppColors.greyMedium,
                        ),
                        const Gap(16),
                      ],
                    ),
                  ),
                ]))));
  }
}
