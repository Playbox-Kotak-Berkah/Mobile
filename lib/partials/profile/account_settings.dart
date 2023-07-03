import 'package:flutter/material.dart';
import 'package:playbox/utils/color_constants.dart';
import 'package:playbox/utils/text_styles.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Account Settings',
          style: body4TextStyle(
            weight: FontWeight.w800,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(vertical: 9, horizontal: 12),
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  // Get.toNamed(RoutePage.myAddress);
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 15,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Address Settings',
                          style: body6TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
              Divider(
                thickness: 1,
                color: ColorConstants.slate[400],
                height: 5,
              ),
              InkWell(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock_outlined,
                        size: 15,
                      ),
                      SizedBox(width: 18),
                      Expanded(
                        child: Text(
                          'Change Password',
                          style: body6TextStyle(
                            weight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Icon(Icons.chevron_right, size: 20),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
