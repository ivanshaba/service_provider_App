// ignore_for_file: file_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final TextEditingController _nameController = TextEditingController();
  String _userName = '';
  bool _editingName = false;

  @override
  void initState() {
    super.initState();
    User? user = FirebaseAuth.instance.currentUser;
    _userName = user?.displayName ?? '';
    _nameController.text = _userName;
  }

  void signOut() {
    FirebaseAuth.instance.signOut();
  }

  void toggleNameEditing() {
    setState(() {
      _editingName = !_editingName;
      if (_editingName) {
        _nameController.text = _userName;
      }
    });
  }

  void saveName() {
    setState(() {
      _editingName = false;
      _userName = _nameController.text;
    });
    User? user = FirebaseAuth.instance.currentUser;
    user?.updateDisplayName(_userName);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Name saved')),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: SingleChildScrollView(
        // Wrap the entire content in a SingleChildScrollView
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "User's Information:",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Card(
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Name:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        if (_editingName)
                          Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _nameController,
                                  decoration: const InputDecoration(
                                    hintText: 'Enter your name',
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: saveName,
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: Colors.white,
                                  backgroundColor: Colors.blue,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8.0)),
                                  ),
                                ),
                                child: const Text('Save'),
                              ),
                            ],
                          )
                        else
                          Row(
                            children: [
                              Text(
                                _userName.isNotEmpty ? _userName : 'N/A',
                                style: const TextStyle(fontSize: 16),
                              ),
                              IconButton(
                                onPressed: toggleNameEditing,
                                icon: const Icon(Icons.edit),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        const Text(
                          'Email:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          user?.email ?? 'N/A',
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "My Information (Service Provider):",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                const Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Business Email:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Row(
                          children: [
                            Text(
                              "aviconst2077@gmail.com",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Business Phone Numbers:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        // ignore: prefer_const_constructors
                        Row(
                          children: [
                            Text(
                              '9841-868601',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.blue,
                              ),
                            ),
                            SizedBox(height: 4),
                          ],
                        ),
                        Text(
                          '9851-140485',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.blue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 150, // Set the desired width for the button
                  child: ElevatedButton(
                    onPressed: signOut,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.red,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.logout),
                        SizedBox(width: 8),
                        Text('Sign Out'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
