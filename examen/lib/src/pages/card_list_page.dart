import 'package:examen/src/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:qrscan/qrscan.dart' as scanner;

class CardListPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Stack(
                    fit: StackFit.loose,
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height*0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(image: AssetImage('assets/images/image9.png'), fit: BoxFit.cover),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))
                        ),
                      ),
                      Column(
                        children: [
                          Text('Credit',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 42,fontStyle: FontStyle.italic)),
                          Text('Card',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 42,fontStyle: FontStyle.italic)),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.black12
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 30),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(child: Text("Select a credit card",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),padding: EdgeInsets.only(left: 20)),
                            GestureDetector(
                                child: Icon(Icons.camera_alt_outlined),
                              onTap: () async{
                                String cameraScanResult = await scanner.scan();
                                launchURL(context, cameraScanResult)
                              },
                            )
                          ],
                        ),
                        SizedBox(height: 20,),
                        Container(
                          alignment: Alignment.center,
                          height: 80,
                          width: MediaQuery.of(context).size.width*0.9,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text('Rp.76.547.000,-',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,fontStyle: FontStyle.italic,),),
                        ),
                        SizedBox(height: 20),
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            height: 65,
                            width: MediaQuery.of(context).size.width*0.9,
                            decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Text('TOP UP',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24,color: Colors.white),),
                          ),
                          onTap: (){
                            Navigator.push(context,MaterialPageRoute(
                                builder: (context) => CardListPage()
                            ));
                          },
                        ),
                        SizedBox(height: 20,),
                        Container(child: Text("Qr Code",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),textAlign: TextAlign.start,),margin: EdgeInsets.only(right: 250),),
                        Image(image: AssetImage('assets/images/image14.png'))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
  
}