import 'package:flutter/material.dart';
import 'package:loginsignup/main.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.lightBlue,
    ),
    debugShowCheckedModeBanner: false,
    home: const LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _validateemail = false;  //variable to store the bool value for email entered
  bool _validatepassword = false;  //variable to store the bool value for password entered
  bool? isRememberMe = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // Displays white box with rounded borders
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            color: Color(0xFF0288D1),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 550,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20,),
                    // Login heading
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 20, 20, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10,),
                    // Email label
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Email',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2,),
                    // Email text field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          errorText: _validateemail ? 'Value Cannot Be Empty' : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 25,),
                    // Password label
                    const Padding(
                      padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Password',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 2,),
                    // Password text field
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          errorText: _validatepassword ? 'Value Cannot Be Empty' : null,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        obscureText: true,
                      ),
                    ),
                    const SizedBox(height: 8,),
                    // Remember me checkbox
                    Padding(
                      padding: const EdgeInsets.fromLTRB(27, 0, 30, 0),
                      child: SizedBox(
                        height: 20,
                        child: Row(
                          children: [
                            Theme(
                              data: ThemeData(unselectedWidgetColor: Colors.grey),
                              child: Checkbox(
                                value: isRememberMe,
                                checkColor: Colors.white,
                                activeColor: Colors.pinkAccent,
                                onChanged: (value) {
                                  setState(() {
                                    isRememberMe = value ?? false;
                                  });
                                },
                              ),
                            ),
                            const Text(
                              "Remember me?",
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20,),
                    // Login button
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pinkAccent,
                          fixedSize: const Size(350, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            //validate whether field is empty or not
                            _emailController.text.isEmpty ? _validateemail = true : _validateemail = false;
                            _passwordController.text.isEmpty ? _validatepassword = true : _validatepassword = false;
                          });
                        },
                        child: const Text('LOGIN'),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    // Forgot password text
                    Padding(
                      padding: const EdgeInsets.fromLTRB(27, 0, 30, 0),
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: const Text(
                          "Forget Password?",
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Divider with "OR" text
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(4, 2, 4, 2),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: const Text(
                              'OR',
                              style: TextStyle(
                                fontSize: 13.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Divider(
                              thickness: 1.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // Social media login options
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: Colors.red,
                              ),
                              shape: BoxShape.circle,
                            ),
                            height: 35,
                            width: 35,
                            child: Image.asset("google_logo.png",),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: const Color(0xFF01579B),
                              ),
                              shape: BoxShape.circle,
                            ),
                            height: 35,
                            width: 35,
                            child: Image.asset("facebook_logo.png",),
                          ),
                          const SizedBox(width: 10,),
                          Container(
                            padding: const EdgeInsets.fromLTRB(1, 0, 1, 6),
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 3,
                                color: const Color(0xFF0288D1),
                              ),
                              shape: BoxShape.circle,
                            ),
                            height: 35,
                            width: 35,
                            child: Image.asset("linkedin_logo.png",),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    // "Need an account?" text with sign up link
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          const Text(
                            'Need an account? ',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => SignUpPage()),
                              );
                            },
                            child: const Text(
                              'SIGN UP',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.normal,
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
