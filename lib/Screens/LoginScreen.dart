import 'package:flutter/material.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_code_picker/country_localizations.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(25),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
//          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 260,
              height: 195,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: ExactAssetImage("assets/icons/drawable-xhdpi/loginimage.png",),
                    fit: BoxFit.cover
                )
              ),
            ),
            SizedBox(height: 50.5,),
            Text(
                "Phone Verification",
                style: const TextStyle(
                    color:  const Color(0xff141414),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Inter",
                    fontStyle:  FontStyle.normal,
                    fontSize: 20.0
                ),
                textAlign: TextAlign.left
            ),
            SizedBox(height: 13,),
          // Please log in using your phone number to get  started!
          Text("Please log in using your phone number to get \n started!", style: const TextStyle(
                  color:  const Color(0xff414141),
                  fontWeight: FontWeight.w400,
                  fontFamily: "Assistant",
                  fontStyle:  FontStyle.normal,
                  fontSize: 14.0),
                textAlign: TextAlign.center
            ),
            SizedBox(height: 27,),
            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                Container(
                  width: size.width-50,
                  height: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(10)
                      ),
                      border: Border.all(
                          color: const Color(0xff707070),
                          width: 0.25
                      ),
                      color: const Color(0xffffffff)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      CountryCodePicker(
                        onChanged: print,
                        hideMainText: true,
                        showFlagMain: true,
                        showFlag: true,
                        searchStyle: TextStyle(
                          fontWeight: FontWeight.w400
                        ),
                        initialSelection: 'IN',
                        hideSearch: false,
                        favorite: ["+91","Bharat"],
                        showCountryOnly: true,
                        showOnlyCountryWhenClosed: true,
                        alignLeft: true,
                        searchDecoration : InputDecoration(
                          focusColor: Color(0xff7e62f4),
                        )
                      ),
                    Flexible(
                      child: TextField(
                        cursorColor: Color(0xff7e62f4),
                        decoration: InputDecoration(
                          hintText: "Phone Number",
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                            color:  const Color(0xff141414),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Assistant",
                            fontStyle:  FontStyle.normal,
                            fontSize: 16.0
                            ),
                        keyboardType: TextInputType.number,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: FlatButton(
                    onPressed: (){},
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    color: Color(0xff7e62f4),
                    child: Text(
                        "Send OTP",
                        style: const TextStyle(
                            color:  const Color(0xffffffff),
                            fontWeight: FontWeight.w600,
                            fontFamily: "Assistant",
                            fontStyle:  FontStyle.normal,
                            fontSize: 13.0
                        ),
                        textAlign: TextAlign.center
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
