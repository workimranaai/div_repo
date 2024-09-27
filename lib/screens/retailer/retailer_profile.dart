import 'package:flutter/material.dart';

class RetailerProfile extends StatefulWidget {
  const RetailerProfile({super.key});

  @override
  State<RetailerProfile> createState() => _RetailerProfileState();
}

class _RetailerProfileState extends State<RetailerProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Edit Profile'),
        backgroundColor: Color(0xFF7162D1),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/edit_profile.png'),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Change photo',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7162D1),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              _buildProfileField('Full Name', 'John'),
              _buildProfileField('Contact Number', '+233 5444176972'),
              _buildProfileField('Email Address', 'abc@gmail.com'),
              _buildProfileField('Date Of Birth', '20/08/1992'),
              _buildProfileField('Address', 'Hadiza Abode, Plot no: 21, La-Bawaleshi Rd, Accra, Ghana'),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                },
                style: ElevatedButton.styleFrom(
                  iconColor: Color(0xFF35489A),
                  padding: EdgeInsets.symmetric(vertical: 15,horizontal: 110),
                  textStyle: TextStyle(fontSize: 16),
                ),
                child: Text('Update Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileField(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.grey,
              fontSize: 15,
            ),
          ),
          SizedBox(height: 5),
          Text(
            value,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Colors.black,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
