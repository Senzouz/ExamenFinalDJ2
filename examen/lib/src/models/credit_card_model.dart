import 'package:flutter/material.dart';

class CreditCard{
  String name;
  String imagePath;

  CreditCard({this.name,this.imagePath});
}

class CreditCardModel extends StatelessWidget{
  final String name;
  final String imagePath;

  const CreditCardModel({Key key, this.name, this.imagePath}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 65,
      width: MediaQuery.of(context).size.width*0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(image: AssetImage("assets/images/${imagePath}.png")),
              Text(name)
            ],
          ),
          Icon(Icons.keyboard_arrow_right)
        ],
      )
    );
  }

}