import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("StudyFlow")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,👋",
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "Ready to continue learning Flutter?",
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Overall Progress",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Flutter Learning",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16A34A),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.35,
                      minHeight: 10,
                      backgroundColor: Colors.white,
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF16A34A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            //continue learning
            Text(
              "Continue Learning",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Flutter Basics",
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),

                  Text(
                    "Learn the fundamentals of Flutter development.",
                    style: TextStyle(fontSize: 14, color: Colors.green),
                  ),

                  SizedBox(height: 15),

                  Row(
                    children: [
                      Icon(Icons.menu_book_outlined, color: Color(0xFF16A34A)),

                      SizedBox(width: 8),

                      Text(
                        "Lesson 4 of 12",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Spacer(),

                      Text(
                        "33%",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16A34A),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),

                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),
                    child: LinearProgressIndicator(
                      value: 0.33,
                      minHeight: 8,
                      backgroundColor: Color(0xFFE5E7EB),
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF16A34A),
                      ),
                    ),
                  ),

                  SizedBox(height: 18),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        //later : laarn screen a jabe
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF16A34A),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 13),

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(12),
                        ),
                      ),
                      child: Text(
                        "Continue Learning",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            //today's goal
            Text(
              "Today's Goal",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Color(0xFFF0FDF4),
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: Color(0xFFBBF7D0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Color(0xFFDCFCE7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.flag_circle_outlined,
                          color: Color(0xFF16A34A),
                        ),
                      ),

                      SizedBox(width: 12),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Complete 4 Lessons",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          SizedBox(height: 4),

                          Text(
                            "2 of 4 completed",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 18),

                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(10),

                    child: LinearProgressIndicator(
                      value: 0.50,
                      minHeight: 9,

                      backgroundColor: Colors.white,

                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color(0xFF16A34A),
                      ),
                    ),
                  ),
                  SizedBox(height: 8),

                  Align(
                    alignment: Alignment.centerRight,

                    child: Text(
                      "50%",
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF16A34A),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            //recent activity
            Text(
              "Recent Activity",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),

                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  //activity 1
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Color(0xFFDCFCE7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.check, color: Color(0xFFDCFCE7)),
                      ),
                      SizedBox(width: 12),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Completed Stateless Widget",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),

                            SizedBox(height: 4),

                            Text(
                              "Today . 10:30 AM",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  Divider(height: 25),

                  //activity 2
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Color(0xFFDCFCE7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.menu_book_outlined,
                          color: Color(0xFFDCFCE7),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Started Stateful Widget",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),

                            Text(
                              "Today 11:50 AM",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(height: 25),

                  //activity 3
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),

                        decoration: BoxDecoration(
                          color: Color(0xFFDCFCE7),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.emoji_events_outlined,
                          color: Color(0xFFDCFCE7),
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Complete Flutter Basics",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),

                            Text(
                              "Yesterday 9:50 AM",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            //quick access
            Text(
              "Quick Access",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: _quickAccessCard(
                    icon: Icons.menu_book_outlined,
                    title: "Learn",
                  ),
                ),

                SizedBox(height: 12),
                Expanded(
                  child: _quickAccessCard(
                    icon: Icons.route_outlined,
                    title: "Roadmap",
                  ),
                ),
              ],
            ),

            SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _quickAccessCard(
                    icon: Icons.code_outlined,
                    title: "Project",
                  ),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: _quickAccessCard(
                    icon: Icons.person_outlined,
                    title: "Profile",
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  //quick access card
  Widget _quickAccessCard({required IconData icon, required String title}) {
    return Container(padding: EdgeInsets.symmetric(vertical: 18),

    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),

      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 7,
          offset: Offset(0, 3),
        ),
      ],
    ),
    
    child: Column(
      children: [
        Icon(
          icon, size: 30,
          color:  Color(0xFF16A34A),
        ),

        SizedBox(height: 8,),


        Text(title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),)
        
      ],
    ),
    );
  }
}
