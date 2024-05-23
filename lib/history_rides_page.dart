import 'package:flutter/material.dart';
import 'package:flutter_scooter_rent_app/app_styles.dart';
import 'package:flutter_scooter_rent_app/size_config.dart';

class HistoryRidesPage extends StatelessWidget {
  final int rating;

  const HistoryRidesPage({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: kPadding24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: kPadding18),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(kBorderRadius10),
                  color: kGreenEmerald3D,
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: kPadding24,
                    vertical: kPadding16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Total Amount',
                            style: kWorkSansMedium.copyWith(
                              color: kLightGreenNyanzaE5,
                              fontSize: SizeConfig.blockSizeHorizontal! * 3,
                            ),
                          ),
                          Text(
                            '120',
                            style: kWorkSansBold.copyWith(
                              color: kWhite,
                              fontSize: SizeConfig.blockSizeHorizontal! * 4.5,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        height: 45,
                        width: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: kYellowXanthousFF,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: kWhite,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: kPadding24),
              Text(
                'Your History Rides',
                style: kWorkSansBold.copyWith(
                  color: kUltraViolet66,
                  fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                ),
              ),
              const SizedBox(height: kPadding16),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 6,
                itemBuilder: (context, index) {
                  return Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kBorderRadius10),
                      border: Border.all(
                        color: kGrey,
                        width: 1,
                      ),
                    ),
                    margin: const EdgeInsets.only(bottom: kPadding12),
                    padding: EdgeInsets.all(
                      SizeConfig.blockSizeHorizontal! * 5,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'M Engineering',
                              style: kWorkSansBold.copyWith(
                                color: kUltraViolet66,
                                fontSize: SizeConfig.blockSizeHorizontal! * 3.5,
                              ),
                            ),
                            Text(
                              'Dec1, 11:30',
                              style: kWorkSansMedium.copyWith(
                                color: kLightUltraVioletAA,
                                fontSize:
                                SizeConfig.blockSizeHorizontal! * 2.9,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Travel Time',
                              style: kWorkSansMedium.copyWith(
                                color: kLightUltraVioletAA,
                                fontSize:
                                SizeConfig.blockSizeHorizontal! * 2.9,
                              ),
                            ),
                            SizedBox(
                              height: SizeConfig.blockSizeVertical! * 0.5,
                            ),
                            RichText(
                              text: TextSpan(
                                text: '57',
                                style: kWorkSansBold.copyWith(
                                  color: kUltraViolet66,
                                  fontSize:
                                  SizeConfig.blockSizeHorizontal! * 6,
                                ),
                                children: [
                                  TextSpan(
                                    text: 'min',
                                    style: kWorkSansMedium.copyWith(
                                      color: kLightUltraVioletAA,
                                      fontSize:
                                      SizeConfig.blockSizeHorizontal! * 3.5,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}