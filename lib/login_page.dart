
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kadad_customer_design/custom_switch.dart';
import 'package:kadad_customer_design/page2.dart';
import 'package:rolling_switch/rolling_switch.dart';
class ExerciseOne extends StatefulWidget {
  const ExerciseOne({Key? key}) : super(key: key);

  @override
  State<ExerciseOne> createState() => _ExerciseOneState();
}

class _ExerciseOneState extends State<ExerciseOne> {
  TextEditingController _phoneController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();
  TextEditingController _emailController=TextEditingController();
  bool switch_bool=false;
  bool abc=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 191,
              width: double.infinity,
              color: Colors.grey.shade100,
              child:Center(child: SvgPicture.asset("assets/Artboard.svg")) ,
            ),
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Email or Mobile",style: TextStyle(color: Colors.grey,fontSize:24 ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 50,
                    height: 23,
                    child:
                    FlutterSwitch(
                      activeColor: Colors.orange,
                        inactiveToggleColor: Colors.orange,
                        inactiveColor: Colors.black,
                        activeToggleColor: Colors.black,
                        toggleSize: 16,

                        value: abc,
                         onToggle: (bool value) {
                           setState(() {
                             abc = value;
                             print("VALUE:$value");
                           },


                           );
                         }


                  ),


                ),

                ),
                Text(abc==false? "First textfield":"Second textfield"),

              ],
            ),





            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),

              child: TextFormField(

                controller: _emailController,
                decoration:  InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'Customer@login.com',
                    hintStyle: TextStyle(fontWeight: FontWeight.bold),
                   icon: Icon(Icons.alternate_email_rounded),
                  // prefix: SvgPicture.asset("assets/atthe.svg"),
                  // suffix: SvgPicture.asset("assets/ok.svg")

                ),
              ),
            ),
            SizedBox(height: 2,),

            Container(
              height: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Padding(
                padding:  EdgeInsets.all(10.0),
                child: IntlPhoneField(
                  controller: _phoneController,
                  decoration: InputDecoration(
                    hintText: 'XXXXXXXXXXX',
                    icon: Icon(Icons.local_phone_rounded),
                  ),
                  onChanged: (phone) {
                    print(phone.completeNumber);
                  },

                ),
              ),
            ),

            SizedBox(height: 8,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),

              child: TextFormField(
                controller: _passwordController,
                obscureText: true,


                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: '***************************',
                    hintStyle: TextStyle(),
                  icon: Icon(Icons.lock_outline),
                  // prefix: SvgPicture.asset("assets/lock.svg")

                ),
              ),
            ),
            SizedBox(height: 8,),





            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Text("Forgot password?",style: TextStyle(color: Colors.orangeAccent)))
              ],
            ),
            SizedBox(height: 12,),


            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Page2()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                height: 70.0,
                decoration: new BoxDecoration(
                  color: Colors.orangeAccent,
                  border: new Border.all(color: Colors.white, width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'login',
                    style:
                    new TextStyle(fontSize: 18.0,),
                  ),
                ),
              ),

            ),
            SizedBox(height: 8,),

            Row(
                children: <Widget>[
                  Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 8,
                      )
                  ),

                  Text("OR",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 16),),

                  Expanded(
                      child: Divider(
                        indent: 10,
                        endIndent: 8,
                      )
                  ),
                ]
            ),

            SizedBox(height: 8,),

            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Page2()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                height: 70.0,
                decoration:  BoxDecoration(
                  border:  Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(

                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: SvgPicture.asset("assets/google.svg"),
                          ),
                          SizedBox(width: 17,),
                          Text(
                            'Continue with google',
                            style:
                            new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward),
                      )

                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 12,),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Page2()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                height: 70.0,
                decoration:  BoxDecoration(
                  border:  Border.all(color: Colors.grey, width: 2.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SvgPicture.asset("assets/Apple.svg"),
                          ),
                          SizedBox(width: 17,),
                          Text(
                            'Continue with Apple',
                            style:
                            new TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_forward),
                      )

                    ],
                  ),
                ),
              ),

            ),
            SizedBox(height: 22,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?"),
                Text("Register",style: TextStyle(color: Colors.orangeAccent),)
              ],
            )


          ],
        ),
      ),
    );
  }
}