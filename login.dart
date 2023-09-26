import 'package:flutter/material.dart';
import 'package:kian/login/profile.dart';
class login extends StatefulWidget {
   login({super.key});
  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController emailcontroll = TextEditingController();
  TextEditingController passwordcontroll = TextEditingController();
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title:
        Text(
            ' LOGIN',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),

        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2021/12/10/16/37/facebook-6860914_1280.png'),
                ),
                SizedBox(height: 30,),
                TextFormField(
                  validator: (value){
                    if (value!.isEmpty){
                      return 'please entre your email ';
                    }
                  },
                  onFieldSubmitted: ( value){
                    if(formkey.currentState!.validate()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const profile()),
                      );
                    }
                  },
                  controller: emailcontroll,
                  maxLength: 20,
                  keyboardType: TextInputType.emailAddress,
                  decoration:InputDecoration(
                    contentPadding: EdgeInsets.symmetric(horizontal: 60),
                    focusedBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: Colors.blue,
                        width: 3,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: 'email',
                    labelStyle: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    )
                  ) ,
                ),
                SizedBox(height: 8,),
                TextFormField(
                  validator: (value){
                    if (value!.isEmpty){
                      return 'please entre your password ';
                    }
                  },
                  onFieldSubmitted: ( value){
                    if(formkey.currentState!.validate()){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const profile()),
                      );
                    }
                  },
                  obscureText: ispassword,
                  maxLength: 50,
                  keyboardType: TextInputType.visiblePassword,
                  decoration:InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 60),
                      focusedBorder:  OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.blue,
                          width: 3,
                        ),
                      ),
                      border:
                      OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(onPressed: (){
                        setState(() {
                          ispassword = !ispassword;
                        });
                      },
                      icon: ispassword== true ? Icon(Icons.remove_red_eye): Icon(Icons.visibility_off)  ,
                      ),
                      labelText: 'password',
                      labelStyle: TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )
                  ) ,
                ),
                SizedBox(height: 15,),
                MaterialButton(
                     height: 40,
                     shape:RoundedRectangleBorder(
                       borderRadius: BorderRadius.all(Radius.circular(20)),
                     ),
                    color: Colors.blue,
                    minWidth: double.infinity,
                      onPressed: (){
                       if(formkey.currentState!.validate()){
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => const profile()),
                         );
                       }
                      },
                      child: Text(
                          'Login',
                        style:TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ) ,
                      )
                  ),
                TextButton(
                  child: const Text('forgot password ?',
                    style:TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ) ,
                  ),
                  onPressed: () {  },),
                SizedBox(height: 10,),
                MaterialButton(
                    height: 40,
                    shape:RoundedRectangleBorder(
                      side: BorderSide(
                        width: 2,
                        color: Colors.blue
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    minWidth: double.infinity,
                    onPressed: (){
                    },
                    child: Text(
                        'Make new profile ',
                      style:TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ) ,
                    )
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
