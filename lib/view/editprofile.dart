import 'package:ecommercee/controller/profileprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profileProvider = Provider.of<Profileprovider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
            icon:  Icon(
              Icons.arrow_back,
              color: Colors.green,
            ),
            onPressed: () => Navigator.pop(context)),
        actions: [
          IconButton(
              icon: Icon(
                Icons.settings,
                color: Colors.green,
              ),
              onPressed: null),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Text(
                "Edit Profile",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 4,
                          color: Theme.of(context).scaffoldBackgroundColor,
                        ),
                        boxShadow: [
                          BoxShadow(
                            spreadRadius: 2,
                            blurRadius: 10,
                            color: Colors.black.withOpacity(0.1),
                            offset: Offset(0, 10),
                          ),
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            width: 4,
                            color: Theme.of(context).scaffoldBackgroundColor,
                          ),
                          color: Colors.green,
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 35),
              Column(children: buildTextField(context, profileProvider)),
              SizedBox(height: 35),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: null,
                    child: Text(
                      "CANCEL",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.black),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () => profileProvider.updateprofile(),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> buildTextField(context, Profileprovider profileprovider) {
    final inputDecoration = InputDecoration(
      contentPadding: EdgeInsets.only(bottom: 3),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintStyle: TextStyle(
        fontSize: 10,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
    return [
      TextFormField(
        controller: profileprovider.usernameController,
        decoration: inputDecoration.copyWith(
          labelText: "Enter your name",
          hintText: 'Name',
        ),
      ),
      TextField(
        controller: profileprovider.phoneNumberController,
        decoration: inputDecoration.copyWith(
          labelText: "Enter your Phone number",
          hintText: 'Phone Number',
        ),
      ),
      TextField(
        controller: profileprovider.addressController,
        decoration: inputDecoration.copyWith(
          labelText: "Enter your Address",
          hintText: 'Address',
        ),
      ),
      TextField(
        controller: profileprovider.ageController,
        decoration: inputDecoration.copyWith(
          labelText: "Enter your age",
          hintText: 'age',
        ),
      ),
    ];
  }
}