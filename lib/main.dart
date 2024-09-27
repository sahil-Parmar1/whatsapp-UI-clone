import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
void main()
{
  runApp(
    CupertinoApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        brightness: Brightness.dark,
        primaryColor: CupertinoColors.systemGreen,
      ),
    )
  );
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState()
  {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(icon: Icon(CupertinoIcons.chat_bubble_text),
          tooltip: 'chat',
          label: 'Chat',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.update),
        label: 'Update'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.group),
        label: 'Community'
        ),
        BottomNavigationBarItem(icon: Icon(Icons.call),
        label: "Calls"
        ),
      ]),
      tabBuilder: (context,index)
      {
         switch(index)
             {
           case 0:return CupertinoTabView(
                              builder: (context)
                               {
                                 return Home(index:index);
                               },
                         );
           case 1:return CupertinoTabView(
                             builder: (context)
                             {
                               return Update();
                             },
                           );
           case 2:return CupertinoTabView(
                           builder: (context)
                           {
                             return Communities();
                           },
                         );
               case 3:return CupertinoTabView(
                             builder: (context)
                             {
                               return call();
                             },
                           );
           default:return CupertinoTabView(
                             builder: (context)
                             {
                               return Home(index:index);
                             },
                           );

         }
      },
    );
  }
}

class Home extends StatefulWidget {
  int index;
   Home({required this.index,super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> name = [
    'Aurora',
    'Luna',
    'Zara',
    'Kai',
    'Milo',
    'Ivy',
    'Nova',
    'Ezra'
  ];

  List<String> images=[
    'https://th.bing.com/th/id/OIP.I7-Kp6ayUzLQuonE6-rrlAAAAA?rs=1&pid=ImgDetMain',
    'https://th.bing.com/th/id/OIP.u2pHicA6N4-fKwyR4lRNawHaHa?w=206&h=189&c=7&r=0&o=5&pid=1.7',
    'http://ts3.explicit.bing.net/th?id=OIP.7FUyLjee8nCf6B6Dy6gdKwAAAA&pid=15.1',
    'https://th.bing.com/th/id/OIP.YnWxqTr1i0c9uMSoYeWZRgHaHK?w=208&h=202&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.BltPJNxVWvE3zktPkQfACAHaHa?w=202&h=202&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.WHFmW5abKH37DSlRcNXtwwHaHa?w=228&h=220&c=7&r=0&o=5&pid=1.7',
    'https://cdn.statusqueen.com/dpimages/thumbnail/whatsapp%20dp%20image6-601.jpg',
    'https://th.bing.com/th/id/OIP.1lmceMdItiLJ6SRmk69QhQHaHt?w=162&h=180&c=7&r=0&o=5&pid=1.7',
  ];
  List<String> messages = [
    "Hi!",
    "What's up?",
    "Sure.",
    "Got it.",
    "On my way.",
    "Thanks!",
    "See you!",
    "Okay."
  ];

  int tabindex=0;
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("WhatsApp",style: TextStyle(fontSize: 20,color: Colors.white),),
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.document_scanner_rounded),
                SizedBox(width: 15,),
                Icon(CupertinoIcons.camera),
                SizedBox(width: 15,),
                Icon(Icons.more_vert),
                SizedBox(width: 15,),
              ],
            ),
          ],
        ),
      ),
      child: Stack(
        children: [
          Column(
           children: [
             SizedBox(height: 50,),
             Column(
               children: [
                 CupertinoTextField(
                  placeholder: 'Search...',
                   padding: EdgeInsets.all(12.0),
                   style: TextStyle(fontSize: 16,color: Colors.white),
                   decoration: BoxDecoration(
                     border: Border.all(),
                     borderRadius: BorderRadius.circular(50),
                     color: CupertinoColors.systemFill,
                   ),
                   prefix: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(width: 15,),
                       Icon(CupertinoIcons.search),
                     ],
                   ),
                 ),
                  SizedBox(height: 8,),
                   Row(
                     children: [
                       Container(
                         width: 50,
                           height: 33,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: tabindex==0?Colors.greenAccent.withOpacity(0.2):Colors.grey.withOpacity(0.2),
                           ),
                           child: TextButton(onPressed: (){
                             setState(() {
                               tabindex=0;
                             });
                           }, child: Text("All",style: TextStyle(fontSize: 12,color: Colors.white),))),
                       SizedBox(width: 5,),
                       Container(
                           width: 70,
                           height: 33,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: tabindex==1?Colors.greenAccent.withOpacity(0.2):Colors.grey.withOpacity(0.2),
                           ),
                           child: TextButton(onPressed: (){
                             setState(() {
                               tabindex=1;
                             });
                           }, child: Text("Unread",style: TextStyle(fontSize: 12,color: Colors.white),))),
                       SizedBox(width: 5,),
                       Container(
                           width: 80,
                           height: 33,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: tabindex==2?Colors.greenAccent.withOpacity(0.2):Colors.grey.withOpacity(0.2),
                           ),
                           child: TextButton(onPressed: (){
                             setState(() {
                               tabindex=2;
                             });
                           }, child: Text("Favorites",style: TextStyle(fontSize: 12,color: Colors.white),))),
                       SizedBox(width: 5,),
                       Container(
                           width: 80,
                           height: 33,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(20),
                             color: tabindex==3?Colors.greenAccent.withOpacity(0.2):Colors.grey.withOpacity(0.2),
                           ),
                           child: TextButton(onPressed: (){
                             setState(() {
                               tabindex=3;
                             });
                           }, child: Text("Groups",style: TextStyle(fontSize: 12,color: Colors.white),))),
                     ],
                   ),

               ],
             ),

             tabindex==0?Expanded(
               child: ListView.builder(
                   itemCount: name.length,
                   itemBuilder: (BuildContext context,index)
                   {
                    return buildChattile(name[index],images[index],messages[index]);
                   }
                   ),
             ):Expanded(child: ListView.builder(
                 itemCount: 2,
                 itemBuilder: (context,index)
                {
                  return buildChattile(name[index], images[index], messages[index]);
                }
               )),
           ],
            ),
          Positioned(
              bottom: 70,
              left: 280,
              child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: CupertinoColors.systemGreen
                ),
                alignment: Alignment.center,
                child: Icon(Icons.chat,color: Colors.black,),
              )),
          Positioned(
              bottom: 140,
              left: 280,
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image(image: NetworkImage('https://about.fb.com/wp-content/uploads/2024/04/Meta-AI-Expasion_Header.gif'),
                  fit: BoxFit.cover,
                    width: 40,
                    height: 40,
                  ),
                ),
              ))
        ],
      ),
    );

  }
  Widget buildChattile(String name,String image,String msg)
  {
    return Column(
      children: [
        Row(
          children: [
            GestureDetector(
              onTap: () {
                // Show the full image when tapped using Cupertino-style dialog
                showCupertinoDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoAlertDialog(
                      content: Stack(
                        alignment: Alignment.center, // Center the children within the stack
                        children: [
                          Image.network(
                            image,
                            fit: BoxFit.cover, // Ensure the full image fits
                            width: 200, // Full width of image
                            height: 200, // Fixed height
                          ),
                          Positioned(
                            top: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5), // Slightly transparent black background
                                borderRadius: BorderRadius.circular(20), // Rounded corners for the name container
                              ),
                              child: Text(
                                "$name",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5), // Black background color
                                // Rounded corners for the icon container
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Icon(Icons.chat, color: Colors.white),
                                  Icon(Icons.call, color: Colors.white),
                                  Icon(Icons.info, color: Colors.white),
                                  Icon(Icons.more_horiz, color: Colors.white),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )

                    );
                  },
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 55,
                  height: 55,
                  child: Image(image: NetworkImage(image),
                   fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            SizedBox(
              width: 250,
                child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,style: TextStyle(fontSize:16,fontWeight:  FontWeight.bold),),
                    Text(msg,style: TextStyle(color: CupertinoColors.systemGrey),),
                  ],
                ),
            ),
            //SizedBox(width: 35,),
           name=='Aurora' || name=='Luna'?Container(
            //padding: EdgeInsets.all(8.0),
             alignment: Alignment.center,
             //margin: EdgeInsets.all(16.0),
             width: 25,
             height: 25,
             decoration: BoxDecoration(
               //borderRadius: BorderRadius.circular(10),
               color: CupertinoColors.systemGreen,
               shape: BoxShape.circle
             ),
             child: Text("2",style: TextStyle(color: Colors.white,fontSize: 15),),
           ):SizedBox.shrink(),
          ],
        ),
        SizedBox(height: 15,),
      ],
    );



  }
}


class Update extends StatefulWidget {
  const Update({super.key});

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  bool _isExpandedview=false;
  bool _isExpandedMute=false;
  List<String> channelnames=[
    'Chennai Super King',
    'Sun News',
    'APB News',
    'katrina kaif',
    'Royal challengers bangalore',
    'Aaj Tak',
    'WhatsApp',
    'The Hindu News',
    'tv9 News',


  ];
  List<String> channelImages=[
    'https://th.bing.com/th/id/OIP._ATVY6ecFCEM-VDoqst3PAHaEK?w=305&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.gTOR1r_K-SCq1DJguySTsQHaHa?w=186&h=186&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.a6ZJNql6Kf3aOeETPBa8qgHaHa?w=179&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.rRx3steFd9v7jEYfnfc3HAHaDM?w=288&h=151&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.gU-7AI9wgy_eDZ1wmyB5fwHaLH?w=120&h=180&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.pfPMOmkQLeeN_Phwi_iXvAHaHk?w=193&h=197&c=7&r=0&o=5&pid=1.7',
    'https://th.bing.com/th/id/OIP.GbsrglNpiRVjIa8pKAcUzAHaHa?w=200&h=200&c=7&r=0&o=5&pid=1.7',
     'https://th.bing.com/th/id/OIP.xB6RyhV8vOuyw6GyosOh2wAAAA?w=139&h=180&c=7&r=0&o=5&pid=1.7',
     'https://th.bing.com/th/id/OIP.tVmQS-KXSaCui7Fa7AAriAHaE8?w=280&h=187&c=7&r=0&o=5&pid=1.7',
  ];

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Update",style: TextStyle(fontSize: 20,color: Colors.white),),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 15,),
                  Icon(CupertinoIcons.camera),
                  SizedBox(width: 15,),
                  Icon(Icons.more_vert),
                  SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ),
        child:Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 60,),
                    Text("Status",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Positioned(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.ZrSrk4EqHD7rWdbx695ZfQHaHL?w=196&h=191&c=7&r=0&o=5&pid=1.7'),
                                  width: 80,
                                  height: 80,
                                ),
                              ),
                            ),
                            Positioned(
                                bottom: 15,
                                left: 50,
                                child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: CupertinoColors.systemGreen,
                              ),
                              alignment: Alignment.center,
                              child: Padding(
                                padding: EdgeInsets.all(2.0),
                                child: Icon(CupertinoIcons.add,color: Colors.black,size: 19,),
                              ),
                            )),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("My Status",style: TextStyle(fontSize: 15,),),
                            Text("Tap to add status update",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                          ],
                        )
                      ],
                    ),
                    Text("Recent updates",style: TextStyle(fontSize: 13,color: CupertinoColors.systemGrey),),
                        SizedBox(height: 10,),
                        GestureDetector(
                          onTap: (){

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: CupertinoColors.systemGreen,width: 2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.3nll6HPob5YHuCr8a68YeAHaHa?w=199&h=199&c=7&r=0&o=5&pid=1.7'),
                                  width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 12,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Milo",style: TextStyle(fontSize: 15,color: Colors.white),),
                                  Text("8:18 AM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10,),
                         Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: CupertinoColors.systemGreen,width: 2),
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.mknE-tpJbwBMdNHrW9SXZQHaHW?w=194&h=193&c=7&r=0&o=5&pid=1.7'),
                              width: 60,
                              height: 60,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Nova",style: TextStyle(fontSize: 15,color: Colors.white),),
                            Text("Yesterday",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                          ],
                        )
                      ],
                    ),
                         SizedBox(height: 10,),
                         GestureDetector(
                           onTap: (){
                             Navigator.push(context,
                                 CupertinoPageRoute(builder: (context)=>Viewstatus(name: 'Zara', image: 'https://th.bing.com/th/id/OIP.WHFmW5abKH37DSlRcNXtwwHaHa?w=194&h=194&c=7&r=0&o=5&pid=1.7'))
                             );
                           },
                           child: Row(
                                             mainAxisAlignment: MainAxisAlignment.start,
                                             children: [
                                               Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.systemGreen,width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.WHFmW5abKH37DSlRcNXtwwHaHa?w=194&h=194&c=7&r=0&o=5&pid=1.7'),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                                               ),
                                               SizedBox(width: 12,),
                                               Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Zara",style: TextStyle(fontSize: 15,color: Colors.white),),
                              Text("9:00 PM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                            ],
                                               )
                                             ],
                                           ),
                         ),
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _isExpandedview=!_isExpandedview;
                        });
                      },
                      child: Row(
                        children: [
                          Expanded(child: Text("Viewed updates",style: TextStyle(fontSize: 13,color: CupertinoColors.systemGrey),)),
                          Icon(!_isExpandedview?CupertinoIcons.chevron_down:CupertinoIcons.chevron_up,color: CupertinoColors.systemGrey,size: 18,),
                        ],
                      ),
                    ),
                    if(_isExpandedview)...[
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.systemGrey,width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.b0r3hjhUXuURjk2sS6_KDwHaJQ?w=165&h=206&c=7&r=0&o=5&pid=1.7'),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Kai",style: TextStyle(fontSize: 15,color: Colors.white),),
                              Text("8:00 PM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.systemGrey,width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.BPwFQKhEwgLzL5CPte8HdwHaGl?w=255&h=220&c=7&r=0&o=5&pid=1.7'),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Luna",style: TextStyle(fontSize: 15,color: Colors.white),),
                              Text("8:00 PM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                            ],
                          )
                        ],
                      ),
                    ],
                    SizedBox(height: 10,),
                    GestureDetector(
                      onTap: (){
                        setState(() {
                          _isExpandedMute=!_isExpandedMute;
                        });
                      },
                      child: Row(
                        children: [
                          Expanded(child: Text("Muted updates",style: TextStyle(fontSize: 13,color: CupertinoColors.systemGrey),)),
                          Icon(!_isExpandedMute?CupertinoIcons.chevron_down:CupertinoIcons.chevron_up,color: CupertinoColors.systemGrey,size: 18,),
                        ],
                      ),
                    ),
                    if(_isExpandedMute)...[
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.systemGrey,width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.6RnfjO-3OFTX2rhkLJuynwHaHa?w=212&h=212&c=7&r=0&o=5&pid=1.7'),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ben 10",style: TextStyle(fontSize: 15,color: CupertinoColors.systemGrey),),
                              Text("8:00 AM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: CupertinoColors.systemGrey,width: 2),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.pP_lgku16otE_wnz-EiLegAAAA?w=206&h=206&c=7&r=0&o=5&pid=1.7'),
                                width: 60,
                                height: 60,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("kris",style: TextStyle(fontSize: 15,color: CupertinoColors.systemGrey),),
                              Text("11:00 PM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                            ],
                          )
                        ],
                      ),
                    ],
                    SizedBox(height: 20,),
                   Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Text("Channels",style: TextStyle(fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold),),
                       Text("Stay updated on topics that matter to you. Find channels to follow below.",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                     ],
                   ),
                    SizedBox(height: 40,),
                    SizedBox(
                      height: 200,
                      width: double.infinity,
                      child: ListView.builder(
                          itemCount: channelnames.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)
                          {
                            return _buildchanneltile(channelImages[index], channelnames[index]);
                          }
                        ),
                    ),
                    SizedBox(height: 80,),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 70,
                left: 280,
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupertinoColors.systemGreen
                  ),
                  alignment: Alignment.center,
                  child: Icon(CupertinoIcons.camera_fill,color: Colors.black,),
                )),
            Positioned(
                bottom: 150,
                left: 295,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CupertinoColors.systemGrey
                  ),
                  alignment: Alignment.center,
                  child: Icon(Icons.edit,color: Colors.white,),
                ))
          ],
        )
    );
  }
  Widget _buildchanneltile(String image,String name)
  {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
     decoration: BoxDecoration(
       borderRadius: BorderRadius.circular(10),
       border: Border.all(color: CupertinoColors.systemGrey)
     ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(image: NetworkImage(image),
                  fit: BoxFit.cover,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Positioned(
                  bottom: 2,
                  left: 53,
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Icon(Icons.verified,color: CupertinoColors.systemBlue,size: 25,)))
            ],
          ),
          SizedBox(height: 10,),
          Text("$name",style: TextStyle(fontSize: 13,overflow: TextOverflow.ellipsis),),
          SizedBox(height: 10,),
          ElevatedButton(onPressed: (){

          }, child: Text("Follow",style: TextStyle(fontSize: 13),),
           style: ElevatedButton.styleFrom(
             backgroundColor: CupertinoColors.systemGreen.withOpacity(0.2),
           ),
          )
        ],
      ),
    );
  }
}
class Viewstatus extends StatefulWidget {
 String name;
 String image;
  Viewstatus({super.key,required this.name,required this.image});

  @override
  State<Viewstatus> createState() => _ViewstatusState();
}

class _ViewstatusState extends State<Viewstatus> {
  double _value=0.0;
  Timer? _timer;
  @override
  void initState()
  {
    super.initState();
    _startProgressTimer();
  }
  void _startProgressTimer() {
    _timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      setState(() {
        if (_value < 1.0) {
          _value += 0.05; // Increment progress value (adjust as needed)
        } else {
          _timer?.cancel();
          Navigator.pop(context);// Stop the timer once progress is complete
        }
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading: Icon(Icons.arrow_back,color: CupertinoColors.systemGrey,size: 19,),
          middle:  Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: CupertinoColors.systemGrey,width: 1),
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.3nll6HPob5YHuCr8a68YeAHaHa?w=199&h=199&c=7&r=0&o=5&pid=1.7'),
                    width: 40,
                    height: 40,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: 12,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Zara",style: TextStyle(fontSize: 15,color: Colors.white),),
                  Text("8:18 AM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),)
                ],
              ),

            ],
          ),
        ),
        child:Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: LinearProgressIndicator(
                value: _value, // 80% of the status has been viewed
                 // Unfilled portion color
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white), // Filled portion color
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: (){
                  _timer?.cancel();
                  Navigator.pop(context);
                },
                child: Center(
                  child:  Stack(
                    children: [
                      Positioned(
                        bottom: 12,
                        left: 30,
                        child: Text("Good Morning! 😊",style: TextStyle(fontSize: 30),)),
                      Positioned(
                        child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.u11r6J4vDbIU3GQhWmoMUAAAAA?rs=1&pid=ImgDetMain'),
                              width: MediaQuery.of(context).size.width*200,
                              height: MediaQuery.of(context).size.height*200,
                            ),
                      ),
              
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
      );
  }
}

class Communities extends StatefulWidget {
  const Communities({super.key});

  @override
  State<Communities> createState() => _CommunitiesState();
}

class _CommunitiesState extends State<Communities> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Communities",style: TextStyle(fontSize: 20,color: Colors.white),),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 15,),
                  Icon(CupertinoIcons.camera),
                  SizedBox(width: 15,),
                  Icon(Icons.more_vert),
                  SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
                  ClipRRect(
                    child: Image(image: AssetImage('assets/com.jpg'),
                    width: 200,
                      height: 200,
                    ),
                  ),
                   SizedBox(height: 20,),
                   Text("Stay connected with a Community",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                   SizedBox(height: 10,),
                   Text("Communities bring members together in topic-based groups,and make it easy to get admin announcements."
                       "Any community you're added to will appear here.",
                      style: TextStyle(fontSize: 13,color: Colors.white70,),
                     textAlign: TextAlign.center,
                      ),
              SizedBox(height: 10,),
              TextButton(onPressed: (){

              }, child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("See example communities",style: TextStyle(color: CupertinoColors.systemGreen),),
                  Icon(CupertinoIcons.right_chevron,color: CupertinoColors.systemGreen,size: 12,),
                ],
              )),
              SizedBox(height: 30,),
              ElevatedButton(onPressed: (){}, 
                   style: ElevatedButton.styleFrom(
                              backgroundColor: CupertinoColors.systemGreen
                       ),
                child: Padding(
                padding:  EdgeInsets.symmetric(vertical: 8.0,horizontal: 30.0),
                child: Text("Start your community",style: TextStyle(color: Colors.black,),
              )),
              ),

            ],
          ),
        ));
  }
}
class call extends StatefulWidget {
  const call({super.key});

  @override
  State<call> createState() => _callState();
}

class _callState extends State<call> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Call",style: TextStyle(fontSize: 20,color: Colors.white),),
              Row(
                children: [
                  SizedBox(width: 10,),
                  Icon(Icons.document_scanner_rounded),
                  SizedBox(width: 15,),
                  Icon(CupertinoIcons.camera),
                  SizedBox(width: 15,),
                  Icon(Icons.call),
                  SizedBox(width: 15,),
                  Icon(Icons.more_vert),
                  SizedBox(width: 15,),
                ],
              ),
            ],
          ),
        ),
        child:Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 60,),
                  Text("Favorites",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        margin: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGreen,
                          borderRadius: BorderRadius.circular(50)
                        ),
                        alignment: Alignment.center,
                        child: Icon(CupertinoIcons.heart_fill,color: Colors.black,),
                      ),
                      SizedBox(width: 10,),
                      Text("Add favorite")

                    ],
                  ),
                  SizedBox(height: 10,),
                  Text("Recent",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.3nll6HPob5YHuCr8a68YeAHaHa?w=199&h=199&c=7&r=0&o=5&pid=1.7'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        SizedBox(
                          width: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Milo",style: TextStyle(fontSize: 15,color: Colors.red),),
                              Row(
                                children: [
                                  Icon(Icons.call_missed,color: Colors.red,size: 15,),
                                  SizedBox(width: 5,),
                                  Text("8:18 AM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Icon(Icons.missed_video_call,color: Colors.white,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.u2pHicA6N4-fKwyR4lRNawHaHa?w=206&h=189&c=7&r=0&o=5&pid=1.7'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        SizedBox(
                          width: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Luna",style: TextStyle(fontSize: 15,),),
                              Row(
                                children: [
                                  Icon(Icons.call_made,color: CupertinoColors.systemGreen,size: 15,),
                                  SizedBox(width: 5,),
                                  Text("8:00 PM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.video_camera,color: Colors.white,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.YnWxqTr1i0c9uMSoYeWZRgHaHK?w=208&h=202&c=7&r=0&o=5&pid=1.7'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        SizedBox(
                          width: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("kai",style: TextStyle(fontSize: 15,),),
                              Row(
                                children: [
                                  Icon(Icons.call_made,color: CupertinoColors.systemGreen,size: 15,),
                                  SizedBox(width: 5,),
                                  Text("September 8, 8:18 AM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.video_camera,color: Colors.white,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: NetworkImage('https://cdn.statusqueen.com/dpimages/thumbnail/whatsapp%20dp%20image6-601.jpg'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        SizedBox(
                          width: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Nova",style: TextStyle(fontSize: 15,),),
                              Row(
                                children: [
                                  Icon(Icons.call_received,color: CupertinoColors.systemGreen,size: 15,),
                                  SizedBox(width: 5,),
                                  Text("August 17,8:00 PM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Icon(CupertinoIcons.video_camera,color: Colors.white,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: (){

                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image(image: NetworkImage('https://th.bing.com/th/id/OIP.1lmceMdItiLJ6SRmk69QhQHaHt?w=162&h=180&c=7&r=0&o=5&pid=1.7'),
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 12,),
                        SizedBox(
                          width: 230,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Ezra",style: TextStyle(fontSize: 15,color: Colors.red),),
                              Row(
                                children: [
                                  Icon(Icons.call_missed,color: Colors.red,size: 15,),
                                  SizedBox(width: 5,),
                                  Text("8:18 AM",style: TextStyle(fontSize: 12,color: CupertinoColors.systemGrey),),
                                ],
                              ),

                            ],
                          ),
                        ),
                        Icon(Icons.missed_video_call,color: Colors.white,),
                      ],
                    ),
                  ),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.lock,color: CupertinoColors.systemGrey,size: 11,),
                      SizedBox(width: 3,),
                      Text("Your personal calls are ",style: TextStyle(fontSize: 11,color: CupertinoColors.systemGrey),),
                      Text("end-to-end encrypted",style: TextStyle(fontSize: 11,color: CupertinoColors.systemGreen),)
                    ],
                  ),
                  SizedBox(height: 135,)
                ],
              ),
            ),
            Positioned(
                bottom: 0,
                left: 280,
                child: Container(
                  width: 60,
                   height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: CupertinoColors.systemGreen
                    ),
                    alignment: Alignment.center,
                    child: Icon(Icons.add_call,color: Colors.black,),
            ))
          ],
        ),
       );
  }
}

