import 'package:defy/core/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class AnalyticsPage extends StatelessWidget {
  const AnalyticsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("LISTED", style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
            SizedBox(height: context.screenHeight * 0.0125),
            ...[
              {'assets': 'assets/icons/kraken.png', 'dex': 'Kraken', 'vol': '\$100M', 'price': '\$14,232.84'},
              {'assets': 'assets/icons/coinbase.png', 'dex': 'Coinbase', 'vol': '\$100M', 'price': '\$14,232.84'},
              {'assets': 'assets/icons/binance.png', 'dex': 'Binance', 'vol': '\$100M', 'price': '\$14,232.84'},
            ].map((type) {
              return Padding(
                padding: EdgeInsets.only(bottom: context.screenHeight * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(type['assets']!, height: context.screenHeight * 0.0375),
                    SizedBox(width: context.screenWidth * 0.05),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(type['dex']!, style: context.bodyMedium),
                        Row(
                          children: [
                            Text('VOL ', style: context.bodyMedium?.copyWith(color: Colors.black.withOpacity(0.5))),
                            Text(type['vol']!, style: context.bodyMedium),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Text(type['price']!, style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                  ],
                ),
              );
            }).toList(),
            Row(
              children: [
                Text("TRADING ACTIVITY", style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const Spacer(),
                ...["All", "1D", "1M", "1Y"].map((type) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.025,
                      vertical: context.screenHeight * 0.0125,
                    ),
                    margin: EdgeInsets.only(left: context.screenWidth * 0.025),
                    decoration: BoxDecoration(
                      color: type == 'All' ? Colors.grey[300] : Colors.white,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Text(type, style: context.labelSmall?.copyWith(fontWeight: FontWeight.w600)),
                  );
                }).toList(),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.05,
                vertical: context.screenHeight * 0.01,
              ),
              height: context.screenHeight * 0.18,
              width: context.screenWidth * 0.58,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color(0xFFFFFFFF),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("TXN", style: context.titleMedium?.copyWith(color: Colors.grey)),
                          Text("5034", style: context.titleLarge?.copyWith(fontWeight: FontWeight.w600)),
                        ],
                      ),
                      const Spacer(),
                      Container(
                        height: context.screenHeight * 0.04,
                        width: context.screenHeight * 0.04,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300]!),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(40),
                        ),
                        child: const Icon(PhosphorIconsRegular.bank, color: Colors.grey),
                      )
                    ],
                  ),
                  SizedBox(height: context.screenHeight * 0.0125),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
                    height: context.screenHeight * 0.09,
                    decoration: BoxDecoration(
                      color: Colors.grey[300]!.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.0375),
                          child: Row(
                            children: [
                              Text('Buy', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5))),
                              const Spacer(),
                              Text('5034', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.green)),
                            ],
                          ),
                        ),
                        const Divider(color: Colors.grey),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: context.screenWidth * 0.0375),
                          child: Row(
                            children: [
                              Text('Sell', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.black.withOpacity(0.5))),
                              const Spacer(),
                              Text('5034', style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600, color: Colors.red)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Row(
              children: [
                Text("ADDRESS BY HOLDINGS", style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const Spacer(),
                ...["1D", "1M", "1Y"].map((type) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.025,
                      vertical: context.screenHeight * 0.0125,
                    ),
                    margin: EdgeInsets.only(left: context.screenWidth * 0.025),
                    child: Text(
                      type,
                      style: context.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: type == '1D' ? Colors.black : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Container(
              height: context.screenHeight * 0.25,
              color: Colors.grey[300],
              child: const Center(child: Text("Analytics Chart Placeholder")),
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Row(
              children: [
                Text("WHALE HOLDINGS", style: context.titleMedium?.copyWith(fontWeight: FontWeight.w600)),
                const Spacer(),
                ...["1D", "1M", "1Y"].map((type) {
                  return Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: context.screenWidth * 0.025,
                      vertical: context.screenHeight * 0.0125,
                    ),
                    margin: EdgeInsets.only(left: context.screenWidth * 0.025),
                    child: Text(
                      type,
                      style: context.labelSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: type == '1D' ? Colors.black : Colors.grey,
                      ),
                    ),
                  );
                }).toList(),
              ],
            ),
            SizedBox(height: context.screenHeight * 0.025),
            Container(
              height: context.screenHeight * 0.25,
              color: Colors.grey[300],
              child: const Center(child: Text("Analytics Chart Placeholder")),
            ),
          ],
        ),
      ),
    );
  }
}