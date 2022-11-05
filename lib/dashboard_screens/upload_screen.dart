import 'package:flutter/material.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({Key? key}) : super(key: key);

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          //reverse: true,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.2,
                      color: Colors.red,
                      child: Text('no image selected'),

                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .3,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'please enter price';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'price'
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .4,
                    child: TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return 'please enter quantity';
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Quantity'
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      maxLines: 3,
                      maxLength: 100,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'product name'
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * .8,
                    child: TextFormField(
                      maxLength: 800,
                      maxLines: 5,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Proudct description'
                      ),
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
