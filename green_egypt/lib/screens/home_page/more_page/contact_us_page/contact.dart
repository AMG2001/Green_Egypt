import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';


class contact extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _contactstate();
  }
}

class _contactstate extends State<contact> {
  TextEditingController MessageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(

          body: Container(
          
        height: double.infinity, // تمليء الشاشه بالكامل
        child: SingleChildScrollView(
          child: Column(
            children: [
              
//********Appbar */
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 40, left: 10),
                child: Column(
                  children: [
                     Row(
                  children: [
                    Container(
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.arrow_back),
                        color: Colors.green,
                      ),
                      height: 40,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(15), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.grey.withOpacity(0.1), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                   // SizedBox(
                     // width: 20,
                   // ),
                    
                   // SizedBox(width: 80,),
                    //Container(
                    //child: Column(
                      //      children: [
                        //      Image.asset(
                          //      "images/contact.jpg",
                            //    height: 50,
                              //  width: 50,
                             // )
                            //],
                         // ),
                    //),
                  ],
                ),
                Container(
                  child: SizedBox(
                      
                    child: Lottie.asset('images/LottieLogo1.json'),
  
                  )
                ),
                Container(
                  alignment: Alignment.center,
                      child: Text("Contact Us",
                          style: TextStyle(
                              fontSize: 26,
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                      SizedBox(
                      height: 10,
                    ),

                Container(
                  alignment: Alignment.center,
                      child: Text(
                        "🍀 Our Frindly Team Would love To Hear From You ! 🍀",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                )
                  ],
                  
                ),
                
              ),
              SizedBox(
                height: 10,
              ),
//********socail shadows */

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      
                      child: Column(
                        children: [
                          IconButton(
                            padding: EdgeInsets.only(top: 10) ,
                              icon: Image.asset(
                                'images/call.png',
                              ),
                              iconSize: 50,
                              onPressed: () {}),
                          Text("Call Us",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xfffec569),)),
                                  
                        ],
                        
                      ),
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color:
                                Color.fromARGB(255, 235, 225, 225).withOpacity(0.1), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            padding: EdgeInsets.only(top: 10),
                              icon: Image.asset('images/email.png'),
                              iconSize: 50,
                              onPressed: () {}),
                          Text("Email Us",
                              style: TextStyle(
                                  fontSize: 20, color: Color(0xff86c447))),
                        ],
                      ),
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 235, 225, 225)
                                  .withOpacity(0.1), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      child: Column(
                        children: [
                          IconButton(
                            padding: EdgeInsets.only(top: 10),
                              icon: Image.asset('images/chat.png'),
                              iconSize: 50,
                              onPressed: () {}),
                          Text(
                            "Chat",
                            style: TextStyle(
                                fontSize: 20, color: Color(0xff800080)),
                          ),
                        ],
                      ),
                      height: 90,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.circular(10), //border corner radius
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 235, 225, 225)
                                  .withOpacity(0.1), //color of shadow
                            spreadRadius: 5, //spread radius
                            blurRadius: 7, // blur radius
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                        width: 25,
                      ),
                  ],
                ),
              ),
              ),
SizedBox(height: 20,),
//*********quick contact shadow */
Row(children: <Widget>[
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 45.0, right: 10.0),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 142, 140, 140),
                      )),
                ),
                Text("OR"),
                Expanded(
                  child: new Container(
                      margin: const EdgeInsets.only(left: 10.0, right: 45.0),
                      child: Divider(
                        thickness: 1,
                        color: Color.fromARGB(255, 142, 140, 140),
                      )),
                ),
              ]
              ),
              Container(
                  alignment: Alignment.center,
                  height: 350,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    //color: Color.fromARGB(255, 255, 255, 255),
                    /*
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                
                    ), //border corner radius
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5), //color of shadow
                        spreadRadius: 5, //spread radius
                        blurRadius: 7, // blur radius
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                    */
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Your Name',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 87, 87),
                              fontStyle: FontStyle.italic,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                                style: BorderStyle.solid
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 53, 227, 59),
                                width: 2.0,
                                style: BorderStyle.solid
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 87, 87),
                              fontStyle: FontStyle.italic,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: new BorderRadius.circular(20.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 5,
                              blurRadius: 7,
                            ),
                          ],
                        ),
                        child: TextFormField(
                          maxLines: 4,
                          style: TextStyle(height: 1),
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            hintText: 'Your Message',
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 89, 87, 87),
                              fontStyle: FontStyle.italic,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.white,
                                width: 2.0,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Colors.green,
                                width: 2.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                          margin: EdgeInsets.only(left: 10, right: 10),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Color(0xff2cda86)),
                              minimumSize: MaterialStateProperty.all(
                                  const Size(130, 40)),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Send', style: TextStyle(fontSize: 24)),
                                SizedBox(width: 5),
                                Icon(
                                  Icons.arrow_forward,
                                  size: 26.0,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            onPressed: () {},
                          )),
                    ],
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
