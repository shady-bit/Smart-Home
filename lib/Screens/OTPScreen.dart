import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_field.dart';

class OTPScreen extends StatefulWidget {
  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
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
            Text("Please enter the One Time Password that", style: const TextStyle(
                color:  const Color(0xff414141),
                fontWeight: FontWeight.w400,
                fontFamily: "Assistant",
                fontStyle:  FontStyle.normal,
                fontSize: 14.0),
                textAlign: TextAlign.center
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "is send to  ",style: TextStyle(color: Colors.black)
                  ),
                  TextSpan(
                    text: "+919899152786",style: TextStyle(color: Color(0xff7e62f4),fontWeight: FontWeight.w400)
                  )
                ]
              ),
            ),
            SizedBox(height: 25,),
//            SizedBox(height: 15,),
            Row(
              children: <Widget>[
                Flexible(
                  child: OTPTextField(
                    length: 6,
                    width: MediaQuery.of(context).size.width,
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldWidth: 50,
                    style: TextStyle(
                        fontSize: 17,
                      fontWeight: FontWeight.w400
                    ),
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 25,),
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
                        "Verify Phone Number",
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
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        "Change Phone Number",
                        style: const TextStyle(
                            color:  const Color(0xff141414),
                            fontWeight: FontWeight.w400,
                            fontFamily: "Oxygen",
                            fontStyle:  FontStyle.normal,
                            fontSize: 13.0
                        ),
                        textAlign: TextAlign.left
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text(
                        "Resend OTP",
                        style: const TextStyle(
                            color:  const Color(0xff7e62f4),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Oxygen",
                            fontStyle:  FontStyle.normal,
                            fontSize: 13.0
                        ),
                        textAlign: TextAlign.right
                    ),
                  )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
