// Programmer name:   Lebogang Tsatsi
// Student number:    224074064
// Program purpose:   Profile page allows user to edit personal information,
//                    upload a profile image from gallery or using camera.

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:unit1_project/models/user.dart';
import 'package:unit1_project/widgets/c_listTile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController surnameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController roleCtrl = TextEditingController();
  final TextEditingController languageCtrl = TextEditingController();

  final Color appAccent = Colors.white;
  final User u = User(
    null,
    'Robin',
    'James',
    '0815532801',
    'robinjames@gmail.com',
    'Software Developer',
    'Flutter',
  );

  File? _selectedImage;

  // show modal functions
  void editProfilePictureDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 350,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // call to action
              Text(
                'Edit profile picture',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),

              // ListTile
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: Text(
                    'Take a photo',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  trailing: Icon(Icons.camera_alt, color: Colors.white),
                  onTap: () {
                    takeImageFromCamera();
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 10),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: Text(
                    'Choose a photo',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                  trailing: Icon(Icons.image_outlined, color: Colors.white),
                  onTap: () {
                    pickImageFromLibrary();
                    Navigator.pop(context);
                  },
                ),
              ),
              SizedBox(height: 10),

              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 5.0,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF181818),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  leading: Text(
                    'Delete photo',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  trailing: Icon(Icons.delete, color: Colors.red),
                  onTap: () {
                    setState(() {
                      _selectedImage = null;
                      Navigator.pop(context);
                    });
                  },
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  void editNameDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          // decoration
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 950,
          width: double.infinity,

          // modal content
          child: Column(
            children: [
              // call to action & action buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF3F3F3F),
                        ),
                      ),
                    ),
                    Text(
                      'Edit name',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          u.name = nameCtrl.text;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // name text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: nameCtrl,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Name',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void editSurnameDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          // decoration
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 950,
          width: double.infinity,

          // modal content
          child: Column(
            children: [
              // call to action & action buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF3F3F3F),
                        ),
                      ),
                    ),
                    Text(
                      'Edit surname',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          u.surname = surnameCtrl.text;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // name text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: surnameCtrl,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Surname',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void editPhoneDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          // decoration
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 950,
          width: double.infinity,

          // modal content
          child: Column(
            children: [
              // call to action & action buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF3F3F3F),
                        ),
                      ),
                    ),
                    Text(
                      'Edit phone number',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          u.phone = phoneCtrl.text;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // name text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: phoneCtrl,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.phone),
                          labelText: 'Phone',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void editEmailDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          // decoration
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 950,
          width: double.infinity,

          // modal content
          child: Column(
            children: [
              // call to action & action buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF3F3F3F),
                        ),
                      ),
                    ),
                    Text(
                      'Edit email address',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          u.email = emailCtrl.text;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // name text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: emailCtrl,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Email address',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void editRoleDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          // decoration
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 950,
          width: double.infinity,

          // modal content
          child: Column(
            children: [
              // call to action & action buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF3F3F3F),
                        ),
                      ),
                    ),
                    Text(
                      'Edit role',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          u.role = roleCtrl.text;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // name text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: roleCtrl,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Role',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void editLanguageDialog() {
    showModalBottomSheet(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      context: context,
      builder: (context) {
        return Container(
          // decoration
          decoration: BoxDecoration(
            color: Color(0xFF0F0F0F),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          height: 950,
          width: double.infinity,

          // modal content
          child: Column(
            children: [
              // call to action & action buttons
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: const Color(0xFF3F3F3F),
                        ),
                      ),
                    ),
                    Text(
                      'Edit language',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          u.language = languageCtrl.text;
                        });

                        Navigator.pop(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.grey[400],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // name text field
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: languageCtrl,
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          labelText: 'Programming Language',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  // image picker functions
  Future pickImageFromLibrary() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage.path);
      u.image = _selectedImage!;
    });
  }

  Future takeImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    if (returnedImage == null) return;

    setState(() {
      _selectedImage = File(returnedImage.path);
      u.image = _selectedImage!;
    });
  }

  @override
  void initState() {
    super.initState();

    nameCtrl.text = u.name;
    surnameCtrl.text = u.surname;
    phoneCtrl.text = u.phone;
    emailCtrl.text = u.email;
    roleCtrl.text = u.role;
    languageCtrl.text = u.language;
  }

  @override
  void dispose() {
    super.dispose();

    nameCtrl.dispose();
    surnameCtrl.dispose();
    phoneCtrl.dispose();
    emailCtrl.dispose();
    roleCtrl.dispose();
    languageCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF070707),
      // application bar
      appBar: AppBar(
        // leading action
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back, color: Colors.white),
        ),

        // application title
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        centerTitle: true,

        // actions
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.transparent,
      ),

      // application body
      body: Stack(
        children: [
          // profile image
          Positioned(
            top: 30,
            left: 0,
            right: 0,
            child: CircleAvatar(
              backgroundColor: Color(0xFF333333),
              radius: 60,
              child: ClipOval(
                child: _selectedImage != null
                    ? Image.file(
                        _selectedImage!,
                        fit: BoxFit.cover,
                        height: 120,
                        width: 120,
                      )
                    : const Icon(
                        Icons.camera_alt_outlined,
                        color: Colors.white,
                      ),
              ),
            ),
          ),

          // Edit button
          Positioned(
            top: 160,
            left: 0,
            right: 0,
            child: TextButton(
              onPressed: editProfilePictureDialog,
              child: Text(
                'Edit',
                style: TextStyle(fontSize: 16, color: const Color(0xFF416EBB)),
              ),
            ),
          ),

          // user information
          Positioned(
            top: 230,
            left: 20,
            right: 20,
            bottom: 0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  CListTile(
                    label: 'Name',
                    userInfo: u.name,
                    onTap: editNameDialog,
                  ),
                  CListTile(
                    label: 'Surname',
                    userInfo: u.surname,
                    onTap: editSurnameDialog,
                  ),
                  CListTile(
                    label: 'Phone',
                    userInfo: u.phone,
                    onTap: editPhoneDialog,
                  ),
                  CListTile(
                    label: 'Email',
                    userInfo: u.email,
                    onTap: editEmailDialog,
                  ),
                  CListTile(
                    label: 'Role',
                    userInfo: u.role,
                    onTap: editRoleDialog,
                  ),
                  CListTile(
                    label: 'Programming Language',
                    userInfo: u.language,
                    onTap: editLanguageDialog,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
