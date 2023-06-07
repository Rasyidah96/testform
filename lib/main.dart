
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_options.dart';




Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "test",
    options: DefaultFirebaseOptions.currentPlatform,
  );
 
  runApp(MyApp());
}



class MyApp extends StatelessWidget {


 

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registeration form',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
     
      home: const RegistrationForm(),
    
    );
  }
}


class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController NoPhoneController = TextEditingController();
  
  
  late String dropdownvalue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('Registration Form'),
      ),
      
      body: SafeArea(
        child: Column(
            
              children: <Widget>[
                Form(
                  child: Column(
                    children:<Widget>[
                      Padding(padding: EdgeInsets.all(10),
                        child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                           prefixIcon: Icon(Icons.person), 
                           border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                            hintText: 'Name'),
                            keyboardType: TextInputType.name,     
                      ),
                      ),

                      Padding(padding: EdgeInsets.all(10),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                           contentPadding: EdgeInsets.all(10),
                            prefixIcon: Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10))),
                          hintText:'Password'),
                          obscureText: true,
                          autocorrect: false,
                          keyboardType: TextInputType.text,
                        ),
                      ),
                     
                     Padding(padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: NoPhoneController,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.phone),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: 'NoPhone'),
                        keyboardType: TextInputType.streetAddress,
                      ),
                     ),
                      
                    Padding(padding: EdgeInsets.all(10),
                      child: TextFormField(
                        controller: addressController,
                        maxLines: 5,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.all(10),
                          prefixIcon: Icon(Icons.send),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10))),
                        hintText: 'Address'),
                        keyboardType: TextInputType.streetAddress,
                      ),
                     ),
                     
                      
                    ],
                  )),
          ElevatedButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('user').add({
            'name': nameController.text, 
            'password': passwordController.text, 
            'address': addressController.text,
            'NoPhone': NoPhoneController.text,
          
          }).catchError((error) {
            print("Failed to add user: $error");
            });
            },
            child: Text('Register')),
              ],
            
          
                       )
      
        
        )

      
    ,
    );
   
  }
}



