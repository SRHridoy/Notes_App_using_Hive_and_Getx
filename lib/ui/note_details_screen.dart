import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:hive_learning/utils/all_styles.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/all_colors.dart';

class NoteDetailsScreen extends StatelessWidget {
  const NoteDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final note = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AllColors.blueColor,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: AllColors.whiteColor,
            )),
        title: Text(
          'Note Details',
          style: AllStyles.titleStyle.copyWith(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Clipboard.setData(ClipboardData(text: note["description"]));
              Fluttertoast.showToast(msg: "Copied note!");

            },
            icon: Icon(Icons.copy),
            color: AllColors.whiteColor,
          ),
          SizedBox(
            width: 10,
          ),
          IconButton(
            onPressed: ()async {
              await Share.share(note["description"]);
            },
            icon: Icon(Icons.share),
            color: AllColors.whiteColor,
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Text(
              note["title"],
              style: AllStyles.headingStyle.copyWith(color: AllColors.blackColor),
            ),
            Text(note["date"],
                style: AllStyles.subtitleStyle
                    .copyWith(color: AllColors.blackColor.withOpacity(.8))),
            SizedBox(
              height: 10,
            ),
            Text(
              note["description"],
              style: AllStyles.titleStyle
                  .copyWith(color: AllColors.blackColor.withOpacity(0.8)),
            )
          ],
        ),
      ),
    );
  }
}
