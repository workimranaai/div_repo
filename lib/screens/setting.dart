import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final List<String> textList = [
    "Edit profile",
    "Privacy policy",
    "Terms and Condition",
    "Clean Cache",
    "About prediction 2021",
    "Logout",
  ];

  double width = 2000;
  bool myAnimation = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        myAnimation = true;
        width = 0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontSize: 16,
            color: Colors.blueGrey,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: ListView.builder(
        shrinkWrap: true,
        itemCount: textList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(12.0),
            child: AnimatedContainer(
              duration: Duration(milliseconds: 400 + (index * 90)),
              curve: Curves.decelerate,
              transform: Matrix4.translationValues(myAnimation ? 0 : width, 0, 0),
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                  borderRadius: BorderRadius.circular(10.0), // Optional: for rounded corners
                ),
                child: ListTile(
                  title: Text(
                    textList[index],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  onTap: () {
                    // Add navigation or other actions here if needed
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
