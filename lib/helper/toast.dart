import 'package:next_contact_app/widgets/widget.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:next_contact_app/helper/utility.dart';

class UtilsAlert {
  static showToast(message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.white,
        textColor: Colors.black,
        timeInSecForIosWeb: 5,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        fontSize: 12);
  }

  static loadingSimpanData(
      {bool? dismiss, required BuildContext context, required String text}) {
    showDialog(
      barrierDismissible: dismiss ?? false,
      context: context,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => dismiss ?? false,
          child: AlertDialog(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              content: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      color: Utility.baseColor3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextLabel(
                      text: text,
                      align: TextAlign.left,
                      size: Utility.medium,
                    ),
                  ),
                ],
              )),
        );
      },
    );
  }
}
