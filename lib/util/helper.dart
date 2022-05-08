import 'package:flutter/material.dart';
import '../ui/common/custom_button_widget.dart';

class Helpers {
  static void warningDialog(BuildContext context, {String? message}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: SizedBox(
              height: 320,
              width: 300,
              child: Column(
                children: [
                  Container(
                    child: Icon(
                      Icons.warning_amber_rounded,
                      size: 130,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Text('Warning',
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text('$message',
                        style: const TextStyle(
                          fontSize: 18,
                        ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: CustomButtonWidget(
                      color: Theme.of(context).primaryColor,
                      textColor: Colors.white,
                      label: 'Close',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        );
  }
  static void confirmDialog(BuildContext context,
      {String? message, required Function() onPressed}) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Dialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Container(
              height: 320,
              width: 300,
              child: Column(
                children: [
                  Container(
                    child: Icon(
                      Icons.info_outline_rounded,
                      size: 130,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const Text('Confirm',
                      style:
                      TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),
                  Expanded(
                    child: Text('$message',
                        style: const TextStyle(
                          fontSize: 18,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 20,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomButtonWidget(
                            color: Colors.grey,
                            textColor: Colors.black,
                            label: 'Close',
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: CustomButtonWidget(
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.black,
                            label: 'OK',
                            onPressed: onPressed,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}