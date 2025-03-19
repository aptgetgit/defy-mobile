import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../config/theme/colors.dart';
import '../../../../core/navigation/routes/router.dart';

class WalletCreationScreen extends ConsumerStatefulWidget {
  const WalletCreationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _WalletCreationScreenState();
}

class _WalletCreationScreenState extends ConsumerState<WalletCreationScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Image.asset('assets/images/wallet-creation-bg.png'),
                Positioned.fill(
                  child: DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.white.withOpacity(0.1),
                            Colors.white.withOpacity(0.2),
                            Colors.white,
                            Colors.white,
                          ],
                          stops: const <double>[0.575, 0.675, 0.775, 1],
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Stack(
                          children: <Widget>[
                            Positioned(
                              bottom: 30,
                              left: 10,
                              child: Transform.rotate(
                                angle: -0.5,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffC8EDFD),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/smiling-face-with-halo.gif',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              left: 70,
                              child: Transform.rotate(
                                angle: -0.5,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffCBF4D2),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/grinning-face-with-smiling-eyes.gif',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: 70,
                              child: Transform.rotate(
                                angle: 0.5,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffD8D8D8),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/grinning-face-with-smiling-eyes.gif',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 20,
                              left: 140,
                              child: Transform.rotate(
                                angle: 0.5,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffA38CD4),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/star-struck.gif',
                                    width: 54,
                                    height: 54,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 30,
                              right: 10,
                              child: Transform.rotate(
                                angle: 0.3,
                                child: Container(
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFF9CBB),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/kissing-face.gif',
                                    width: 24,
                                    height: 24,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 70,
                              right: 70,
                              child: Transform.rotate(
                                angle: 0.3,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFF9CBB),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/slightly-smiling-face.gif',
                                    width: 28,
                                    height: 28,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              right: 70,
                              child: Transform.rotate(
                                angle: -0.3,
                                child: Container(
                                  padding: const EdgeInsets.all(6),
                                  decoration: BoxDecoration(
                                    color: const Color(0xffFFB845),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: Image.asset(
                                    'assets/images/face-with-tears-of-joy.gif',
                                    width: 28,
                                    height: 28,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  const SizedBox(height: 20),
                  const Text(
                    'Set up your Wallet',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Last Step before getting into the app. Importing wallet gives 10 extra coins.',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.greyLight,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () async {
                     await const ImportWalletScreenRoute().push<void>(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 40,),
                      decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(40),),
                      child: const Center(
                        child: Text(
                          'Import Wallet',
                          style: TextStyle(
                            color: AppColors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () async {
                      await const WalletCreationWalletNameScreenRoute().push<void>(context);
                    },
                    child: const Text(
                      'Create Wallet',
                      style: TextStyle(
                        color: AppColors.blue,
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
