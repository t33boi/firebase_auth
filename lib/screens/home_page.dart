import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../services/auth_service.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List<String> usersUUID = [];

  final currentUser = FirebaseAuth.instance.currentUser;

  Future getUsersUUID() async {
    await FirebaseFirestore.instance
        .collection("users")
        .get()
        .then((snapshot) => snapshot.docs.forEach((documentid) {
              usersUUID.add(documentid.reference.id);
            }));
  }

  // CollectionReference users = FirebaseFirestore.instance.collection("user");

  void logout() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Home Page"),
        centerTitle: true,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: logout,
            icon: const Icon(
              Icons.logout,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "LOGGED IN AS : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "${currentUser!.email}",
                  style: const TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 200,),
            Expanded(
              child: FutureBuilder(
                future: getUsersUUID(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {                      return ListView.builder(
                      itemCount: usersUUID.length,
                      itemBuilder: (context, index) {
                        return Text(
                          usersUUID[index],
                          style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        );
                      },
                    );
                    
                  }
                  return const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Loading..."),
                      // LinearProgressIndicator(),
                    ],
                  );
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
