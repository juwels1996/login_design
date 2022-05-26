import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class EmailField extends StatefulWidget {
  const EmailField({Key? key}) : super(key: key);

  @override
  State<EmailField> createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  TextEditingController _emailController=TextEditingController();
  TextEditingController _phoneController=TextEditingController();
  final _formKey = GlobalKey<FormState>();
  var Number = [
    '+987',
    '+880',
    '+550',
    '+998',
    '+123',
  ];
  String dropdownvalue = '+880';


  String text = '';
  int num = 0;
  int textLength = 0;
  int  numLength=0;

  String aaaa = "";

  bool _secure = false;
  bool isEmailValid =  false;
  bool isPhoneValid=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            color: Colors.black,
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(Icons.arrow_back,color: Colors.white,),
                ),
                Center(
                  child: Text("Change Mobile Number",style: TextStyle(color: Colors.white,fontSize: 16),),
                ),
                Icon(Icons.arrow_back)

              ],
            ),
          ),



          SizedBox(height: 38,),
          Container(
            height: 70,
            child: FittedBox(
              fit: BoxFit.cover,
              child:
              Text(
                " Please enter  your new mobile number and you will\n receive an OTP shorty for verify again with your new\n mobile number",
                style: TextStyle(fontSize: 3),
              ),)
          ),
          SizedBox(height: 21),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //
          //     Padding(
          //       padding:  EdgeInsets.only(left: 20, right: 20),
          //       child: Container(
          //         width: 450,
          //         child: Form(
          //           key: _formKey,
          //           autovalidateMode: AutovalidateMode.always,
          //           // autovalidateMode: AutovalidateMode.always,
          //           child: TextFormField(
          //             keyboardType: TextInputType.text,
          //             controller: _emailController,
          //             validator: (value) {
          //
          //               value = _emailController.text;
          //
          //               if(value.isNotEmpty) {
          //                 if(value.length > 7 && value.contains('@') && value.contains('.') ) {
          //                   isEmailValid = true;
          //                   return null;
          //                 }
          //                 isEmailValid = false;
          //                 return 'Input a valid email';
          //               }
          //             },
          //             decoration:  InputDecoration(
          //               border: UnderlineInputBorder(),
          //               hintText: 'please enter email here',
          //               hintStyle: TextStyle(fontWeight: FontWeight.bold),
          //               icon: Icon(Icons.alternate_email_rounded),
          //
          //
          //               // prefix: SvgPicture.asset("assets/atthe.svg"),
          //               // suffix: SvgPicture.asset("assets/ok.svg"),
          //               suffixIcon: Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //                 child: isEmailValid==true ? SvgPicture.asset("assets/ok.svg",
          //                   height:2,
          //                 ) : null,
          //               ),
          //
          //
          //             ),
          //             onChanged: (value){
          //               setState((){
          //                 value = _emailController.text;
          //               });
          //             },
          //           ),
          //
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
          SizedBox(height: 18,),


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
                        hintText: 'Enter ur phone number',
                        // labelText: _phoneController.text,
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
          SizedBox(height: 12,),
          Row(
            children: [
              Row(

                children: [
                  Container(
                    color: Colors.black87,
                    height: 120,
                    width: 150,
                    child: FlutterLogo(
                      size: 22,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Title of Flutter"),
                  Text("Some description")
                ],
              ),


            ],
          ),







          SizedBox(height: 12,),
          InkWell(
            onTap: () {

              // Navigator.of(context)
              //     .push(MaterialPageRoute(builder: (context) => Page2()));
            },
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 70.0,
              decoration: new BoxDecoration(
                color: Colors.black,
                border: new Border.all(color: Colors.white, width: 2.0),
                borderRadius: new BorderRadius.circular(10.0),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(),
                    Text(
                      'Continue',
                      style: new TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Icon(Icons.arrow_forward,color: Colors.white,),
                    )
                  ],
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
