import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final email=TextEditingController();
  final password=TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/cc.jpeg'),fit: BoxFit.cover)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        key: _scaffoldKey,
        body: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: 40,top: 120),
              child: const Text('WELCOME\nBACK',style: TextStyle(
                color: Colors.white,
                fontSize: 50),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5,
                  right: 35,left: 35),
              child:SingleChildScrollView(
                child: Column(
                  children: [
                    TextField(
                      controller: email,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),
                        fillColor: Colors.transparent,
                        filled: true,
                        labelText: 'Email',
                        hintText: 'write your Email',hintStyle: (const TextStyle(color: Colors.white)),
                        labelStyle: const TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.greenAccent),
                          borderRadius: BorderRadius.circular(10)
                        )
                            
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    TextField(
                      controller: password,
                      style: TextStyle(color: Colors.white),
                      obscureText: true,
                      decoration: InputDecoration(
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                        ),

                          fillColor: Colors.transparent,
                          filled: true,
                          labelText: 'password',
                          hintText: 'write your Password',hintStyle: TextStyle(color: Colors.white),
                          labelStyle: TextStyle(color:Colors.white),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)
                          )

                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(onPressed: (){}, child: const Text('Forgot Password',
                          style: (TextStyle(color: Colors.blueAccent,)
                          ),))
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      
                      children: [
                        Text('LOG IN',style: TextStyle(color: Colors.white,
                        fontSize: 20,
                            fontWeight: FontWeight.w500),
                        ),
                        CircleAvatar(
                          radius: 30,
                          backgroundColor: Colors.white38,
                          child: IconButton(
                            onPressed: (){
                              if(email.text!=''&&password.text!=""){
                                print(email.text);
                                print(password.text);
                                showMessage('LogIn Successful');
                              }else{

                                email.text==""?
                                 showErrorMessage('Please EnterEmail'):showErrorMessage('Please Enter Password');

                              };
                              FirebaseFirestore.instance.collection('user').add(
                                  {
                                    "email" :email.text,
                                    "password" :password.text
                                  }
                                  );
                            },
                            icon: Icon(Icons.arrow_forward),
                          ),
                        )
                      ],
                    ),

                  ],
                ),
              )
            )
          ],
        ),
      ),
    );
  }
  void showErrorMessage(String text){
    var snackdemo = SnackBar(
      content: Text(text),
      backgroundColor: Colors.red,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }
  void showMessage(String text){
    var snackdemo = SnackBar(
      content: Text(text),
      backgroundColor: Colors.green,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(5),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackdemo);
  }

}
