import 'package:easydonatefinal/backend/controllers.dart';
import 'package:easydonatefinal/models/postModel.dart';
import 'package:easydonatefinal/pages/Post/expiry.dart';
import 'package:easydonatefinal/widgets/branding.dart';
import 'package:easydonatefinal/widgets/field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker_modern/image_picker_modern.dart';

class DonationDetails extends StatefulWidget {
  @override
  _DonationDetailsState createState() => _DonationDetailsState();
}

class _DonationDetailsState extends State<DonationDetails> {
  // List<Asset> images = <Asset>[];

  // Widget buildGridView() {
  //   return GridView.count(
  //     crossAxisCount: 3,
  //     children: List.generate(images.length, (index) {
  //       Asset asset = images[index];
  //       return AssetThumb(
  //         asset: asset,
  //         width: 300,
  //         height: 300,
  //       );
  //     }),
  //   );
  // }

  // Future<void> loadAssets() async {
  //   List<Asset> resultList = <Asset>[];
  //
  //   try {
  //     resultList = await MultiImagePicker.pickImages(
  //       maxImages: 300,
  //       enableCamera: true,
  //       selectedAssets: images,
  //       cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
  //       materialOptions: MaterialOptions(
  //         actionBarColor: "#FFFF6E40",
  //         actionBarTitle: "Easy Donate",
  //         allViewTitle: "All Photos",
  //         useDetailsView: false,
  //         selectCircleStrokeColor: "#000000",
  //       ),
  //     );
  //   } on Exception catch (e) {
  //     print(e.toString());
  //   }

  // If the widget was removed from the tree while the asynchronous platform
  // message was in flight, we want to discard the reply rather than calling
  // setState to update our non-existent appearance.
  //   if (!mounted) return;
  //
  //   setState(() {
  //     images = resultList;
  //   });
  // }

  var _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, left: 25, right: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.type == "Donation"
                    ? 'Donation details'
                    : 'Request Details',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 40,
              ),
              CustomField(
                controller: nameController,
                labeltext: "Name of Product",
              ),
              SizedBox(
                height: 20,
              ),
              CustomField(
                controller: descController,
                labeltext: "Description",
              ),
              SizedBox(
                height: 20,
              ),
              CustomField(
                controller: quantityController,
                labeltext: "Quantity",
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                  onTap: () {
                    getImage();
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Attach Images",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.attach_file,
                        color: Colors.deepOrange,
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Center(
                child: _image == null
                    ? Text('No image selected.')
                    : Image.file(_image),
              ),
              SizedBox(
                height: 60,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                    try {
                      assert(nameController.text.trim() != '');
                      assert(descController.text.trim() != '');
                      post.productName = nameController.text;
                      post.description = descController.text;
                      post.quantity = quantityController.text;
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ExpiryPage()),
                      );
                    } on AssertionError {
                      Fluttertoast.showToast(
                          msg: 'None of the Fields can be Empty');
                    }
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.deepOrangeAccent,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 150,
              ),
              Center(child: Branding()),
            ],
          ),
        ),
      ),
    );
  }
}
