import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jotour/utility/my_style.dart';
import 'package:image_picker/image_picker.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Field
  File file;

  //Method
  Widget nameForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Username',
          helperText: 'Your Name',
          hintText: 'English Only',
          icon: Icon(
            Icons.account_box,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget emailForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Email',
          helperText: 'your@email.com',
          hintText: 'Email Only',
          icon: Icon(
            Icons.email,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget passwordForm() {
    return Container(
      width: 250.0,
      child: TextFormField(
        decoration: InputDecoration(
          labelText: 'Password',
          helperText: 'More 6 Charactor',
          hintText: 'Password Only',
          icon: Icon(
            Icons.lock,
            size: 28,
          ),
        ),
      ),
    );
  }

  Widget showPicture() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      color: MyStyle().textColor,
      margin: EdgeInsets.only(top: 18),
      elevation: 8,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Colors.white,
          height: MediaQuery.of(context).size.height * 0.25,
          width: MediaQuery.of(context).size.width * 0.6,
          child: file == null 
          ?  Image.asset('images/picture.png',
          fit: BoxFit.contain,)
          :  Image.file(file),
        ),
      ),
    );
  }

  Widget cameraButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
      color: MyStyle().textColor,
      icon: Icon(
        Icons.add_a_photo,
        color: Colors.white,
      ),
      label: Text(
        'Camera',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        cameraAndGallery(ImageSource.camera);
      },
    );
  }

  Future<void> cameraAndGallery(ImageSource imageSource) async {

   var object = await ImagePicker.pickImage(source: imageSource); 

   setState(() {
     file = object;

   });
  }

  Widget galleryButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      color: MyStyle().textColor,
      icon: Icon(
        Icons.add_photo_alternate,
        color: Colors.white,
      ),
      label: Text(
        'Gallery',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        cameraAndGallery(ImageSource.gallery);
      },
    );
  }

  Widget showButton() {
    return Container(
      margin: EdgeInsets.only(top: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          cameraButton(),
          galleryButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            showPicture(),
            showButton(),
            nameForm(),
            emailForm(),
            passwordForm(),
          ],
        ),
      ),
    );
  }
}
