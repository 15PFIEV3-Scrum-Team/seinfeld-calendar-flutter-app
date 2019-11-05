import 'package:flutter/material.dart';
import 'package:seinfeld/src/screens/home/home_page.dart';
import 'package:seinfeld/src/routes/routes.dart';

class LoginPage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isHidden = true;
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  bool isCorrectUsername = true;
  bool isCorrectPassword = true;
  var userError = 'Nhập sai username';
  var passError = 'Nhập sai password';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment:  MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                width: 70,
                height: 70,
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey
                ),
                child: FlutterLogo()
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Text(
                "SEINFELD",
                style: TextStyle(color: Colors.orange, fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: TextField(
                controller: userController,
                style: TextStyle(color: Colors.black, fontSize: 18),
                decoration: InputDecoration(
                  errorText: isCorrectUsername? null : userError,
                  labelText: "Username",
                  labelStyle: TextStyle(fontSize: 15, color: Color(0xff888888))
                ),
              ),
            ),
            Stack(
              alignment: AlignmentDirectional.centerEnd,
              children:<Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: TextField(
                    controller: passController,
                    style: TextStyle(color: Colors.black, fontSize: 18),
                    obscureText: isHidden,
                    decoration: InputDecoration(
                      errorText: isCorrectPassword? null : passError,
                      labelText: "Password",
                      labelStyle: TextStyle(fontSize: 15, color: Color(0xff888888))
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: showPassword,
                  child: Text(
                    isHidden ? 'SHOW': 'HIDE',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.blue),                    
                  ),
                )
              ]
            ),              
            SizedBox(
              width: double.infinity,
              height: 40,               
              child: RaisedButton(
                color: Colors.blue,
                onPressed: onSignInPress,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child: Text(
                  'SIGN IN',
                  style: TextStyle(fontSize: 15)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(                                           
                    'New user? Sign up?',                                          
                  ),
                  Text(
                    'Forgot Password?'
                  )
                ],
              ),
            )
          ],
        ),
      )
    );
  }
  void showPassword(){
    setState(() {
     isHidden = !isHidden; 
    });
  }
  void onSignInPress(){
    setState(() {
     if(userController.text.length<6 || !userController.text.contains('@')){
       isCorrectUsername = false;
     }
     else{isCorrectUsername = true;} 
     if(passController.text.length<6){
       isCorrectPassword = false;
     }
     else{isCorrectPassword = true;}
     if(isCorrectPassword && isCorrectUsername){
       //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
       Routes.goToHomePage(context);
     }
    });
  }
}
