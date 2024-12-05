import 'package:first_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'customform_field.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "My First App",
      debugShowCheckedModeBanner: false,
      home: FirstPage(),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("My First App"),
          foregroundColor: Colors.white,
          backgroundColor: Colors.black,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.info),
              onPressed: () {},
            ),
          ],
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {
              // Navigator.push(context, MaterialPageRoute(builder: (context) {
              //   return const secondPage();
              // }));
              Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (BuildContext context) => const FormPageBase(),
                    fullscreenDialog: true),
              );
            },
            child: const Text("Register"),
          ),
        ));
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("second page"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.only(bottom: 80.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Go Back"),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Image.asset(
                'images/Image.png',
                width: 300,
                height: 300,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyFormPage extends StatefulWidget {
  const MyFormPage({super.key});

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Flutter Form Example')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assign the GlobalKey to the Form
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: 'Enter your name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Form is valid, proceed
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class MyApp extends StatefulWidget {
//   MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String buttonName = "Click";
//   int index = 0;

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text("My First App"),
//           foregroundColor: Colors.white,
//           backgroundColor: Colors.black,
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.home),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: const Icon(Icons.info),
//               onPressed: () {},
//             ),
//           ],
//         ),
//         backgroundColor: const Color.fromARGB(0, 204, 220, 29),
//         body: Center(
//           child: index == 0
//               ? Container(
//                   width: double.infinity,
//                   height: double.infinity,
//                   color: Colors.red,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             overlayColor:
//                                 const Color.fromARGB(255, 237, 17, 17),
//                             foregroundColor: Colors.amber[900],
//                             backgroundColor: Colors.brown,
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               buttonName = "Clicked";
//                             });
//                           },
//                           child: Text(buttonName)),
//                       ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               buttonName = "Clicked";
//                             });
//                           },
//                           child: Text(buttonName))
//                     ],
//                   ),
//                 )
//               : Image.asset('images/Image.png'),
//         ),
//         bottomNavigationBar: BottomNavigationBar(
//           items: const [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_sharp),
//               label: "Home",
//             ),
//             BottomNavigationBarItem(
//                 icon: Icon(Icons.settings_applications), label: "Settings"),
//             BottomNavigationBarItem(
//                 icon: Icon(
//                   Icons.favorite,
//                   color: Colors.pink,
//                   size: 24.0,
//                   semanticLabel: 'Text to announce in accessibility modes',
//                 ),
//                 label: "Like")
//           ],
//           currentIndex: index,
//           onTap: (int currentIndex) {
//             setState(() {
//               index = currentIndex;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }

//form page for the flutter form example
class FormPageBase extends StatefulWidget {
  const FormPageBase({super.key});

  @override
  State<FormPageBase> createState() => _FormPageBaseState();
}

class _FormPageBaseState extends State<FormPageBase> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register From"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
      body: _buildUI(),
    );
  }

  Widget _buildUI() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Customfromfield(
                hintText: "Enter your name",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your name";
                  }
                  if (val.isValidName == false) {
                    return "Please enter a valid Name";
                  }
                  return null;
                },
              ),
              Customfromfield(
                hintText: "Enter your email",
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your email";
                  }
                  if (val.isValidEmail == false) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              Customfromfield(
                hintText: "Enter your password",
                obsecure: true,
                validator: (val) {
                  if (val == null || val.isEmpty) {
                    return "Please enter your password";
                  }
                  if (val.isValidPassWord == false) {
                    return "Please enter a valid password";
                  }
                  return null;
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Form Submitted Successfully")),
                    );
                  }
                },
                child: const Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
