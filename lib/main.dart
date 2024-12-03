import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 231, 231, 231),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 231, 231, 231),
        elevation: 0,
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/ava_tg.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Good Evening!', style: TextStyle(color: Colors.grey)),
                Text('Dan Smith', style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            width: 40.0, // Ширина контейнера
            height: 40.0, // Высота контейнера
            decoration: BoxDecoration(
              shape: BoxShape.circle, // Делаем контейнер круглым
              border: Border.all(
                color: Colors.grey, // Цвет обводки
                width: 1.0, // Толщина обводки
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.search, color: Colors.black),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10), // Отступ между кнопками
          Container(
            width: 40.0, 
            height: 40.0, 
            decoration: BoxDecoration(
              shape: BoxShape.circle, 
              border: Border.all(
                color: Colors.grey, 
                width: 1.0, 
              ),
            ),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Weekly Tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('18 Tasks Pending'),
            SizedBox(height: 20),
            Row(
              children: [
                Flexible(
                  child: TaskCard(
                    title: 'Create a Landing Page',
                    category: 'UI/UX Design',
                    priority: 'High',
                    date: 'Mon, 12 July 2022',
                    membersCount: '3+',
  
                  ),
                ),
                SizedBox(width: 10),
                Flexible(
                  child: TaskCard(
                    title: 'Develop a Website',
                    category: 'Development',
                    priority: 'Low',
                    date: 'Mon, 30 July 2022',
                    membersCount: '2+',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Today’s Tasks',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TaskCard(
              title: 'Design 2 App Screens',
              category: 'Crypto Wallet App',
              date: 'Mon, 10 July 2022',
              membersCount: '1+',
              isCompleted: true,
            ),
            TaskCard(
              title: 'Design Homepage',
              category: 'Water Company Website',
              date: '',
              membersCount: '1+',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.folder),
            label: 'Projects',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Messages',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
          ),
        ],
      ),
    );
  }
}

class TaskCard extends StatelessWidget {
  final String title;
  final String category;
  final String date;
  final String priority;
  final String membersCount;
  final bool isCompleted;

  TaskCard({
    required this.title,
    required this.category,
    required this.date,
    this.priority = '',
    this.membersCount = '1+',
    this.isCompleted = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white, 
      elevation: null,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (category.isNotEmpty && priority.isNotEmpty)
                // color_text = null
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: category == 'Development'
                          ? Colors.orange.withOpacity(0.2)
                          : Colors.purple.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(category, style: TextStyle(fontSize: 12, color: category == 'Development'
                          ? Colors.orange
                          : Colors.purple,
                          )),
                  ),
                if (priority.isNotEmpty && category.isNotEmpty)
                  Spacer(flex: 1,),
                  
                // Spacer(flex: 1,),
                if (priority.isNotEmpty && category.isNotEmpty)
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: priority == 'High'
                          ? Colors.red.withOpacity(0.2)
                          : Colors.green.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(priority, style: TextStyle(fontSize: 12, color: priority == 'High'
                          ? Colors.red
                          : Colors.green,
                          )),
                  ),
                
                // if (priority.isEmpty)
                //   if (isCompleted)
                //     Icon(Icons.check_circle, color: Colors.blue),

              ],
            ),

            // if (priority.isEmpty)
            //       if (isCompleted)
            //         Icon(Icons.check_circle, color: Colors.blue),
            
            SizedBox(height: 10),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                decoration: isCompleted == true ? TextDecoration.lineThrough : null
              ),
              softWrap: true,  // Allow text to wrap if needed
              maxLines: 2,  // Limit to 2 lines
              overflow: TextOverflow.ellipsis,  // Ellipsis on overflow
            ),
            if (priority.isEmpty)
              Text(
                category,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),

            if (priority.isEmpty)
              Divider( // Черта
                color: Colors.grey, // Цвет черты
                thickness: 0.5, // Толщина черты
              ),
                
            SizedBox(height: 10),
            Row(
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundImage:
                      AssetImage('assets/images/member_avatar.png'),  // Use valid image
                ),
                SizedBox(width: 10),
                Text(membersCount, style: TextStyle(fontSize: 12)),
              ],
            ),
            SizedBox(height: 10),
            if (date.isNotEmpty)
              Row(
                children: [
                  Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                  SizedBox(width: 5),
                  Text(date, style: TextStyle(fontSize: 12)),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////NEXT///////////////////////TEMPLATE
////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Popular Menu',
//       theme: ThemeData(
//         primarySwatch: Colors.pink,
//         fontFamily: 'Roboto', // Optional: to match the font styling
//       ),
//       home: PopularMenuScreen(),
//     );
//   }
// }

// class PopularMenuScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[100],
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 0,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios_new, color: Colors.pink),
//           onPressed: () {},
//         ),
//         title: Text(
//           'Popular Menu',
//           style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             // Search Bar
//             Container(
//               height: 50,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   SizedBox(width: 16),
//                   Icon(Icons.search, color: Colors.grey),
//                   Expanded(
//                     child: TextField(
//                       decoration: InputDecoration(
//                         hintText: "Search",
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(horizontal: 16),
//                       ),
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(Icons.filter_list, color: Colors.pink),
//                     onPressed: () {},
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 16),
//             // Menu List
//             Expanded(
//               child: ListView(
//                 children: [
//                   menuItem(
//                     'Original Salad',
//                     'Lovy Food',
//                     '\$8',
//                     'assets/images/salad.png', // Replace with local image path
//                   ),
//                   menuItem(
//                     'Fresh Salad',
//                     'Cloudy Resto',
//                     '\$10',
//                     'assets/images/greensalad.png', // Replace with local image path
//                   ),
//                   menuItem(
//                     'Yummie Ice Cream',
//                     'Circlo Resto',
//                     '\$6',
//                     'assets/images/icecream.png', // Replace with local image path
//                   ),
//                   menuItem(
//                     'Vegan Special',
//                     'Haty Food',
//                     '\$11',
//                     'assets/images/salad_vegan.png', // Replace with local image path
//                   ),
//                   menuItem(
//                     'Mixed Pasta',
//                     'Recto Food',
//                     '\$13',
//                     'assets/images/pasta.png', // Replace with local image path
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 0,
//         selectedItemColor: Colors.pink,
//         unselectedItemColor: Colors.grey,
//         showSelectedLabels: true,
//         showUnselectedLabels: true,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.message),
//             label: 'Chat',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }

//   // Menu item builder widget
//   Widget menuItem(String title, String subtitle, String price, String imagePath) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 8),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(15),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 5),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(8),
//             child: Image.asset(
//               imagePath, // Replace with your local image path
//               width: 60,
//               height: 60,
//               fit: BoxFit.cover,
//             ),
//           ),
//           SizedBox(width: 16),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 4),
//                 Text(
//                   subtitle,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           Text(
//             price,
//             style: TextStyle(
//               fontSize: 16,
//               fontWeight: FontWeight.bold,
//               color: Colors.pink,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////NEXT///////////////////////TEMPLATE
////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////




// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: OrganizerProfile(),
//     );
//   }
// }

// class OrganizerProfile extends StatefulWidget {
//   @override
//   _OrganizerProfileState createState() => _OrganizerProfileState();
// }

// class _OrganizerProfileState extends State<OrganizerProfile> {
//   String selectedTab = 'About'; // Default selected tab is 'About'

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Organizer'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             // Define back button behavior here
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.more_vert),
//             onPressed: () {
//               // Define more options button behavior here
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CircleAvatar(
//               radius: 50,
//               backgroundImage: AssetImage('assets/images/ava.png'), // Path to image
//             ),
//             SizedBox(height: 16),
//             Text(
//               'Evgeny Shevelev',
//               style: TextStyle(
//                 fontSize: 24,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 _buildStatColumn('2,368', 'Followers'),
//                 _buildStatColumn('346', 'Following'),
//                 _buildStatColumn('13', 'Events'),
//               ],
//             ),
//             SizedBox(height: 16),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     // Define follow button behavior here
//                   },
//                   icon: Icon(Icons.person_add),
//                   label: Text('Follow'),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Colors.indigoAccent, // Цвет фона кнопки
//                     foregroundColor: Colors.white,
//                   ),
                 
                  
//                 ),
//                 OutlinedButton.icon(
//                   onPressed: () {
//                     // Define message button behavior here
//                   },
//                   icon: Icon(Icons.message),
//                   label: Text('Messages'),
//                   style: OutlinedButton.styleFrom(
//                     side: BorderSide(color: Colors.indigoAccent, width: 2), // Цвет и ширина обводки
//                     foregroundColor: Colors.indigoAccent, // Цвет текста и иконки
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             _buildTabSection(),
//             SizedBox(height: 16),
//             if (selectedTab == 'About') _buildAboutSection(),
//             if (selectedTab == 'Events') _buildEventSection(),
//             if (selectedTab == 'Reviews') _buildReviewSection(),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildStatColumn(String value, String label) {
//     return Column(
//       children: [
//         Text(
//           value,
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 4),
//         Text(label),
//       ],
//     );
//   }

//   Widget _buildTabSection() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildTabButton('About'),
//         _buildTabButton('Events'),
//         _buildTabButton('Reviews'),
//       ],
//     );
//   }

//   Widget _buildTabButton(String tabName) {
//     // return TextButton(
//     //   onPressed: () {
//     //     setState(() {
//     //       selectedTab = tabName;
//     //     });
//     //   },
//     //   child: Text(
//     //     tabName,
//     //     style: TextStyle(
//     //       color: selectedTab == tabName ? Colors.indigoAccent : Colors.black,
//     //     ),
//     //   ),
//     // );
//     return ElevatedButton.icon(
//       onPressed: () {
//           setState(() {
//           selectedTab = tabName;
//         });
//       },
//       // icon: Icon(Icons.person_add),
//       label: Text(
//         tabName,
//         style: TextStyle(
//           color: selectedTab == tabName ? Colors.white : Colors.indigoAccent,
//         ),
//       ),
//       style: ElevatedButton.styleFrom(
        
//         backgroundColor: selectedTab == tabName ? Colors.indigoAccent : Colors.white, // Цвет фона кнопки
//         foregroundColor: Colors.white,
//         side: BorderSide(color: Colors.indigoAccent, width: 2)
//       ),
    
      
//     );
//   }

//   Widget _buildAboutSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'About',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'Lorem ipsum dolor sit amet, consectetur adipiscing elit, '
//           'sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
//           'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
//         ),
//         TextButton(
//           onPressed: () {
//             // Define "Read more" behavior here
//           },
//           child: Text('Read more...'),
//         ),
//       ],
//     );
//   }

//   Widget _buildEventSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Events',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text('Event 1: Description of event...'),
//         Text('Event 2: Description of event...'),
//         // Add more events here as needed
//       ],
//     );
//   }

//   Widget _buildReviewSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Reviews',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text('Review 1: User feedback...'),
//         Text('Review 2: User feedback...'),
//         // Add more reviews here as needed
//       ],
//     );
//   }
// }








////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////








// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: EWalletScreen(),
//     );
//   }
// }

// class EWalletScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.white,
//         leading: Icon(Icons.menu, color: Colors.black),
//         actions: [
//           Icon(Icons.search, color: Colors.black),
//           SizedBox(width: 10),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'My E-Wallet',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 20),
//             // E-Wallet card
//             Container(
//               padding: EdgeInsets.all(25),
//               decoration: BoxDecoration(
//                 color: Colors.black,
//                 borderRadius: BorderRadius.circular(50),
//                 image: DecorationImage(image: AssetImage('assets/images/card_back.jpg'),
//                 fit: BoxFit.cover,)
                
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         'Evgeny Shevelev',
//                         style: TextStyle(color: Colors.white, fontSize: 18),
//                       ),
//                       Row(
//                         children: [
//                           // Image.asset(
//                           //   'assets/images/pay_logo.png', // Replace with actual image path
//                           //   width: 30,
//                           //   height: 30,
//                           // ),
//                           SizedBox(width: 20),
//                           Image.asset(
//                             'assets/images/pay_logo.png', // Replace with actual image path
//                             width: 140,
//                             height: 40,
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                    Text(
//                     '**** **** **** 3629',
//                     style: TextStyle(color: Colors.white, fontSize: 18),
//                   ),
//                   SizedBox(height: 20),
//                   Text(
//                     'Your balance',
//                     style: TextStyle(color: Colors.white54, fontSize: 14),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                        Text(
//                         '\$9,379',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 28,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       ElevatedButton(
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.white,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: Text(
//                           'Top Up',
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       ),
//                     ],
//                   ),
                 
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Transaction History',
//                   style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   'See All',
//                   style: TextStyle(color: Colors.blue, fontSize: 16),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             // Transaction List
//             Expanded(
//               child: ListView(
//                 children: [
//                   buildTransactionItem(
//                     'assets/images/chair.jpg', // Replace with actual image path
//                     'Lawson Chair',
//                     '\$120',
//                     'Dec 15, 2024  |  10:00 AM',
//                     'orders'
//                   ),
//                   buildTransactionItem(
//                     'assets/images/wallet.png', // Replace with actual image path
//                     'Top Up Wallet',
//                     '\$400',
//                     'Dec 14, 2024  |  16:42 PM',
//                     'top up'
//                   ),
//                   buildTransactionItem(
//                     'assets/images/reflector.jpg', // Replace with actual image path
//                     'Parabolic Reflector',
//                     '\$170',
//                     'Dec 14, 2024  |  11:39 AM',
//                     'orders'
//                   ),
//                   buildTransactionItem(
//                     'assets/images/tabble.jpg', // Replace with actual image path
//                     'Mini Wooden Table',
//                     '\$165',
//                     'Dec 13, 2024  |  14:46 PM',
//                     'orders'
//                   ),
//                   buildTransactionItem(
//                     'assets/images/wallet.png', // Replace with actual image path
//                     'Top Up Wallet',
//                     '\$300',
//                     'Dec 12, 2024  |  09:27 AM',
//                     'top up'
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: 2, // Индекс выбранного элемента
//         selectedItemColor: Colors.black, // Цвет выбранного элемента
//         unselectedItemColor: Colors.grey, 
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.account_balance_wallet),
//             label: 'Wallet',
            
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
         
//         ],
//       ),
//     );
//   }

//   Widget buildTransactionItem(
//     String imagePath,
//     String title,
//     String amount,
//     String dateTime,
//     String action,
//   ) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10),
//       child: Row(
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(200),
//             child: Image.asset(
//               imagePath,
//               width: 50,
//               height: 50,
//               fit: BoxFit.fill,
//             ),
//           ),
//           SizedBox(width: 10),
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   title,
//                   style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 5),
//                 Text(
//                   dateTime,
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               ],
//             ),
//           ),
//           Column(
//             children: [
//               Text(
//               amount,
//               style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start, // Выравнивание по горизонтали
//               children: [
//                 Text(
//                   action,
//                   style: TextStyle(fontSize: 13.0), // Настройка стиля текста
//                 ),
//                 Icon( action == 'orders' 
//                   ? Icons.arrow_outward_sharp 
//                   : Icons.arrow_downward,
//                   size: 20.0,
//                   color: action == 'top up' ? Colors.green : Colors.red,
//                   ), // Иконка
//                 SizedBox(width: 8.0), // Промежуток между иконкой и текстом
//               ],
//             )
//             ],
//           ),
          
//         ],
//       ),
//     );
//   }
// }



