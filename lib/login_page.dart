import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:rolling_switch/rolling_switch.dart';

class ExerciseOne extends StatefulWidget {
  const ExerciseOne({Key? key}) : super(key: key);

  @override
  State<ExerciseOne> createState() => _ExerciseOneState();
}

class _ExerciseOneState extends State<ExerciseOne> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  // List<DropdownMenuItem<String>> get dropdownItems{
  //   List<DropdownMenuItem<String>> menuItems = [
  //     DropdownMenuItem(child: Text("+974"),value: "+974"),
  //     DropdownMenuItem(child: Text("Canada"),value: "Canada"),
  //     DropdownMenuItem(child: Text("Brazil"),value: "Brazil"),
  //     DropdownMenuItem(child: Text("England"),value: "England"),
  //   ];
  //   return menuItems;
  // }
  var Number = [
    '+987',
    '+880',
    '+550',
    '+998',
    '+123',
  ];
  String dropdownvalue = '+880';


  bool switch_bool = false;
  bool abc = false;
  bool _switchvalue = false;
  final _formKey = GlobalKey<FormState>();
  String text = '';
  int num = 0;
  int textLength = 0;
  int  numLength=0;

  String aaaa = "";

  bool _secure = false;
  bool isEmailValid =  false;
  bool isPhoneValid=false;



    // String validateEmail(String? value, Icon) {
    //   String pattern =
    //       r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    //       r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
    //       r"{0,253}[a-zA-Z0-9])?)*$";
    //   RegExp regex = RegExp(pattern);
    //   if (value == null || value.isEmpty || !regex.hasMatch(value))
    //     return Icon(Icons.arrow_forward);
    //   else
    //     return "match";
    // }



//   String validateMobile(String ?value) {
// // Indian Mobile number are of 10 digit only
//     if (value!.length != 10) {
//       isPhoneValid=false;
//       return 'Mobile Number must be of 10 digit';
//
//     }
//     else{
//       isPhoneValid=true;
//       return "null";
//     }
//
//
//
//
//   }






  @override
  void initState() {
    super.initState();
    _switchvalue = false;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 191,
              width: double.infinity,
              color: Colors.grey.shade200,
              child: Center(child: SvgPicture.asset("assets/Artboard.svg")),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    "Email or Mobile",
                    style: TextStyle(color: Colors.grey, fontSize: 24),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    width: 50,
                    height: 23,
                    child: FlutterSwitch(
                        activeColor: Colors.orange,
                        inactiveToggleColor: Colors.orange,
                        inactiveColor: Colors.black,
                        activeToggleColor: Colors.black,
                        toggleSize: 16,
                        value: _switchvalue,
                        onToggle: (value) {
                          setState(
                            () {
                              _switchvalue = value;
                            },
                          );
                          print(value);
                        }),
                  ),
                ),

                // Text(abc==false? "First textfield":"Second textfield"),
              ],
            ),

            _switchvalue == false
                ? Row(
              mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Padding(
                        padding:  EdgeInsets.only(left: 20, right: 20),
                        child: Container(
                          width: 450,
                          child: Form(
                            key: _formKey,
                            autovalidateMode: AutovalidateMode.always,
                            // autovalidateMode: AutovalidateMode.always,
                            child: TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _emailController,
                              validator: (value) {

                                  value = _emailController.text;

                                if(value.isNotEmpty) {
                                   if(value.length > 7 && value.contains('@') && value.contains('.') ) {
                                     isEmailValid = true;
                                     return null;
                                   }
                                   isEmailValid = false;
                                   return 'Input a valid email';
                                }
                              },
                              decoration:  InputDecoration(
                                border: UnderlineInputBorder(),
                                hintText: 'Customer@login.com',
                                hintStyle: TextStyle(fontWeight: FontWeight.bold),
                                icon: Icon(Icons.alternate_email_rounded),


                                // prefix: SvgPicture.asset("assets/atthe.svg"),
                                // suffix: SvgPicture.asset("assets/ok.svg"),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: isEmailValid==true ? SvgPicture.asset("assets/ok.svg",
                                      height:2,
                                    ) : null,
                                  ),


                              ),
                              onChanged: (value){
                                setState((){
                                  value = _emailController.text;
                                });
                              },
                            ),

                          ),
                        ),
                      ),
                  ],
                )
                :
                // Container(
                //   width: 70,
                //   child: const TextField (
                //     decoration: InputDecoration(
                //         border: OutlineInputBorder(),
                //         labelText: 'Email',
                //         hintText: 'Enter Your Email'
                //     ),
                //   ),
                // )



                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: SvgPicture.asset("assets/phone.svg"),
                    ),
                    Container(

                      height: 70,
                      width: 90,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5)),
                      ),
                      child: DropdownButton<String>(
                        value: dropdownvalue,
                        icon: const Icon(Icons.arrow_drop_down_outlined),
                        elevation: 2,
                        underline: Container(
                          height: 0,
                          color: Theme.of(context).backgroundColor,
                        ),
                        isExpanded: true,
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                          });
                        },
                        items: Number.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      width: 300,
                      child: Form(
                        key: _formKey,
                        autovalidateMode: AutovalidateMode.always,
                        child: TextFormField (
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          validator: (value) {
                            value = _phoneController.text;
                            if(value.isNotEmpty) {
                              if(value.length >=9 && value.length<=10 ) {
                                print(value.length);

                                isPhoneValid = true;
                                return null;

                              }
                              isPhoneValid = false;
                              return "enter valid nujmbner";

                            }
                          },


                          decoration: InputDecoration(
                              hintText: 'XXXXXXXXXXXXX',
                              hintStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                              contentPadding: EdgeInsets.all(0.0),



                              suffixIcon:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: isPhoneValid == true ?  SvgPicture.asset("assets/ok.svg",
                                  height:3,
                                  width: 3,
                                ) : null ,
                              )
                          ),
                          onChanged: (value){

                            setState((){
                              value=_phoneController.text;

                            });
                          },



                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SvgPicture.asset("assets/ok.svg"),
                    // ),
                  ],
                ),



            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 20),

              child: TextFormField(


                controller: _passwordController,
                // obscureText: true,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: '**********************',
                  icon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset("assets/lock.svg"),
                  ),
                    // suffixIcon: Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: SvgPicture.asset("assets/password.svg",
                    //     height:5,
                    //     width: 5,
                    //   ),
                    // )
                  suffixIcon: IconButton(
                    icon:SvgPicture.asset("assets/password.svg"),
                    onPressed: (){
                      setState(() {
                        _secure = !_secure;
                      });
                    },

                  ),
                ),
                obscureText: _secure,
                obscuringCharacter: '*',
                maxLength: 10,
                //maxLines: 2,
                onChanged: (value){
                  text = value;
                },
              ),
            ),
            SizedBox(
              height: 16,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
                    child: Text("Forgot password?",
                        style: TextStyle(color: Colors.orangeAccent,fontSize: 18)
                    )
                )
              ],
            ),
            SizedBox(
              height: 12,
            ),

            InkWell(
              onTap: () {
                if (_formKey.currentState!.validate()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Processing Data')),
                  );
                }
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (context) => Page2()));
              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 70.0,
                decoration: new BoxDecoration(
                  color: Colors.orangeAccent,
                  border: new Border.all(color: Colors.white, width: 2.0),
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Text(
                    'Log in',
                    style: new TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 16,
            ),

            Row(children: <Widget>[
              Expanded(
                  child: Divider(
                indent: 10,
                endIndent: 8,
              )),
              Text(
                "OR",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              Expanded(
                  child: Divider(
                indent: 10,
                endIndent: 8,
              )),
            ]),

            SizedBox(
              height: 16,
            ),

            InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 70.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
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
                          SizedBox(
                            width: 17,
                          ),

                          RichText(
                              text: TextSpan(
                                text: "Continue with",
                                  style: TextStyle(fontSize: 16,)
                              ),

                          ),
                          SizedBox(width: 5,),
                          RichText(
                              text: TextSpan(
                                text: "Google",
                                  style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                              ),

                          ),
                          // RichText(
                          //   text: TextSpan(
                          //       text: "Continue with"
                          //   ),
                          //
                          // ),
                          // Text(
                          //   'Continue with google',
                          //   style: new TextStyle(
                          //       fontSize: 18.0, fontWeight: FontWeight.bold),
                          // ),
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
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () {

              },
              child: Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                height: 70.0,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 2.0),
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
                          SizedBox(
                            width: 17,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Continue with",
                                style: TextStyle(fontSize: 16,)
                            ),

                          ),
                          SizedBox(width: 5,),
                          RichText(
                            text: TextSpan(
                                text: "Apple",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                            ),

                          ),
                          // Text(
                          //   'Continue with Apple',
                          //   style: new TextStyle(
                          //       fontSize: 18.0, fontWeight: FontWeight.bold),
                          // ),
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
            SizedBox(
              height: 22,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?",
                    style: TextStyle(fontSize: 14,)
                ),
                Text(
                  "Register",
                  style: TextStyle(color: Colors.orangeAccent),
                )
              ],
            ),
            SizedBox(height: 36,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                      text: "Want to Become a",
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)
                  ),

                ),
                SizedBox(width: 5,),
                RichText(
                  text: TextSpan(
                      text: "Driver?",
                      style: TextStyle(fontSize: 16,color: Colors.orangeAccent)
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


