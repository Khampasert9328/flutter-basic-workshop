import 'package:flutter/material.dart';
import 'package:gennexs_workshop_flutter_basic/Login/login.dart';

class SigUpScreen extends StatefulWidget {
  const SigUpScreen({super.key});

  @override
  State<SigUpScreen> createState() => _SigUpScreenState();
}

class _SigUpScreenState extends State<SigUpScreen> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.lightBlue[100], // Background color
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'SIGN UP',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Add sign-up logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  minimumSize: const Size(double.infinity, 50),
                ),
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              const Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text('OR'),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.blue),
                    ),
                    child: IconButton(
                      onPressed: () {
                      },
                      icon: const Icon(Icons.g_mobiledata, color: Colors.red),
                    ),
                  ),
                  Container(
                     decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.blue),
                      
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Add Facebook sign-in logic
                      },
                      icon: const Icon(Icons.facebook, color: Colors.blue),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.blue),
                      
                    ),
                    child: IconButton(
                      onPressed: () {
                        // Add LinkedIn sign-in logic
                      },
                      icon: const Icon(Icons.linked_camera, color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
               Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>LoginPage()));
                  },
                  child: const Text.rich(
                    TextSpan(
                      text: 'Already a user? ',
                      children: [
                        TextSpan(
                          text: 'LOGIN',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}