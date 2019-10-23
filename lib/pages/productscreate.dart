import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hello_market/common/apifunctions/requestProductAPI.dart';
import 'dart:io';
// import 'package:image_picker/image_picker.dart';

class ProductCreatePage extends StatefulWidget {
  final id;
  ProductCreatePage(this.id);
  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String _titleValue;
  String _descriptionValue;
  String _category_id;
  String fileName;
  double _priceValue;
  File _file;
  String base64Image;
  // void _choose() async {
  //   _file = await ImagePicker.pickImage(source: ImageSource.camera);
  // }

  // void _upload() {
  //   if (_file == null) return;
  //   base64Image = base64Encode(_file.readAsBytesSync());
  //   fileName = _file.path.split("/").last;
  // }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        TextField(
          decoration: new InputDecoration(labelText: "Enter Title "),
          keyboardType: TextInputType.text,
          onChanged: (String value) {
            setState(() {
              _titleValue = value;
            });
          },
        ),
        TextField(
          decoration: new InputDecoration(labelText: "Enter Description "),
          maxLength: 50,
          maxLines: 2,
          onChanged: (String value) {
            setState(() {
              _descriptionValue = value;
            });
          },
        ),
        TextField(
          decoration: new InputDecoration(labelText: "Enter Price "),
          keyboardType: TextInputType.number,
          onChanged: (String value) {
            setState(() {
              _priceValue = double.parse(value);
            });
          },
        ),
        SizedBox(
          height: 10.0,
        ),
        // Column(
        //   children: <Widget>[
        //     Row(
        //       children: <Widget>[
        //         RaisedButton(
        //           onPressed: _choose,
        //           child: Text("Choose Image"),
        //         ),
        //         SizedBox(width: 10.0),
        //         RaisedButton(
        //           onPressed: _upload,
        //           child: Text('Upload Image'),
        //         )
        //       ],
        //     ),
        //     _file == null ? Text("No Image Selected") : Image.file(_file)
        //   ],
        // ),
        DropdownButton<String>(
          hint: new Text("Select Categories"),
          value: _category_id,
          onChanged: (String newValue) {
            setState(() {
              _category_id = newValue;
            });
          },
          style: TextStyle(color: Colors.black54, fontSize: 20),
          isDense: true,
          iconSize: 40.0,
          items: <String>[
            'Jewullery',
            'Lezer Products',
            'Electronics',
            'Home, Garden & kids',
            'Vechiles',
            'Fasion & Beauty',
            'Leisure ,Sports & Travel',
            'Building Supplies',
            'Services'
                'Jop',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
        SizedBox(
          height: 10.0,
        ),
        RaisedButton(
          child: Text('Save'),
          onPressed: () {
            final Map<String, dynamic> product = {
              'title': _titleValue,
              'description': _descriptionValue,
              'price': _priceValue,
              'category_id': _category_id,
              'owner_id': widget.id,
            };
            createProduct(context, product);
            //print(widget.id);
            print(widget.id.runtimeType);

            //  Navigator.pushReplacementNamed(context, '/products');
          },
        ),
      ],
    );
  }
}
