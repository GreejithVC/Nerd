import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CreditsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(

        inAsyncCall: true,
        child:ListView(children: [
          Center(child: Text("CREDITS"),)
        ],)

    );
  }

}
