import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/color_constants.dart';
import 'package:google_fonts/google_fonts.dart';

class DialogBox extends StatelessWidget {
  final subject;
  VoidCallback onSave;
  VoidCallback onCancel;
  DialogBox({
    super.key,
    required this.subject,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Gcolors.neutralColor1000,
      content: Container(
        height: 250,
        width: 320,
        child: Expanded(
          child: Column(
            children: [
              Text(
                'Add Subjects',
                style: GoogleFonts.inter(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Gcolors.primaryColor050),
              ),
              SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Text(
                  'Subject Name:',
                  style: GoogleFonts.inter(
                      color: Gcolors.primaryColor050, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              TextField(
                controller: subject,
                style: TextStyle(color: Gcolors.primaryColor050),
                decoration: InputDecoration(
                  //color: Gcolors.neutralColor900,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  hintText: 'e.g Mathematics',
                  hintStyle: TextStyle(
                    color: Gcolors.neutralColor400,
                  ),
                  //labelStyle: TextStyle(color: Gcolors.primaryColor050),
                  // fillColor: Gcolors.primaryColor050
                  // borderRadius: BorderRadius.circular(20)
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Text('Initial Presents:',style: GoogleFonts.inter(fontSize: 16,color: Gcolors.primaryColor050),)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: ElevatedButton(
                        onPressed: onCancel,
                        style: ElevatedButton.styleFrom(
                            side: BorderSide(width: 2, color: Colors.red),
                            backgroundColor: Gcolors.neutralColor1000),
                        child: Text(
                          'CANCEL',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Gcolors.primaryColor050),
                        )),
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Container(
                      width: 90,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Gcolors.primaryColor400),
                          onPressed: onSave,
                          child: Text(
                            'SAVE',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ))),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
