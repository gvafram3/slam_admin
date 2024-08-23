import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:slam_admin/widgets/custom_button.dart';

class StudentSearchFragment extends StatefulWidget {
  const StudentSearchFragment({super.key});

  @override
  State<StudentSearchFragment> createState() => _TrackStudentsFragmentState();
}

class _TrackStudentsFragmentState extends State<StudentSearchFragment> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const Text(
            //   'Student Search',
            //   textAlign: TextAlign.start,
            //   style: TextStyle(fontWeight: FontWeight.w600),
            // ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.0026),
                      Column(
                        children: [
                          Container(
                            height: size.height * 0.42,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: _buildDragAndDropCard(context),
                                ),
                                SizedBox(
                                    width: size.width *
                                        0.02), // Gap between widgets
                                Expanded(
                                  flex: 1,
                                  child: _buildSearchCard(context),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                              height: size.height *
                                  0.02), // Gap between row and column
                          _buildStudentsFoundCard(),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 11),
                Expanded(flex: 1, child: _buildStudentDataCard()),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDragAndDropCard(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const Text(
            'Drag and Drop an image here to find student',
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: size.height * 0.026),
          DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(11),
            dashPattern: const [6, 3],
            color: Colors.blue,
            strokeWidth: 2,
            child: Container(
              height: size.height * 0.16,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.grey[200],
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Center(
                child: Icon(Icons.upload_file, size: 46),
              ),
            ),
          ),
          SizedBox(height: size.height * 0.018),
          const Text(
            'or',
            style: TextStyle(fontSize: 14),
          ),
          SizedBox(height: size.height * 0.018),
          Container(
            width: 88,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color.fromARGB(255, 24, 115, 190),
                  Color.fromARGB(255, 32, 89, 137),
                  Color.fromARGB(255, 13, 60, 98),
                ],
              ),
              borderRadius: BorderRadius.circular(11),
            ),
            height: 45,
            child: const Center(
              child: Text(
                'Select file',
                style: TextStyle(color: Colors.white, fontSize: 11),
              ),
            ),
          ),
          // const CustomButton(text: 'Select file'),
        ],
      ),
    );
  }

  Widget _buildSearchCard(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Title
          const Text(
            'Looking for a student?',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          // Space between title and subtext
          SizedBox(height: size.height * 0.02),
          // Subtext
          const Text(
            textAlign: TextAlign.center,
            'Search for a student by name, reference number, or index number.',
            style: TextStyle(fontSize: 11),
          ),
          // Space between subtext and search field
          SizedBox(height: size.height * 0.03),
          // Search Field
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              fillColor: Colors.grey[100],
              filled: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
                borderSide: BorderSide.none,
              ),
              hintText: 'Search',
              hintStyle: const TextStyle(fontSize: 14),
            ),
          ),
          // Space between search field and button
          SizedBox(height: size.height * 0.03),
          // Search Button
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: 78,
              height: 45,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 24, 115, 190),
                    Color.fromARGB(255, 32, 89, 137),
                    Color.fromARGB(255, 13, 60, 98),
                  ],
                ),
                borderRadius: BorderRadius.circular(11),
              ),
              child: const Center(
                child: Text(
                  'Search',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStudentsFoundCard() {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student(s) Found',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                Column(
                  children: [
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'Chris Aggay', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                  ],
                ),
                const SizedBox(width: 18),
                Column(
                  children: [
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'Chris Aggay', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                    const SizedBox(height: 6),
                    _buildStudentStatus(
                        'John Doe', 'BSc. Computer Science', true, context),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentDataCard() {
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(11),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Student Data',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(11),
                      child: Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          border: Border.all(width: 3, color: Colors.black),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(11),
                          child: Image.asset(
                            'assets/images/visca.jpg',
                            width: 120,
                            height: 120,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Name: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        Text(
                          'John Agyin',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Course: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        Text(
                          'BSc. Computer Science',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Residential Status: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 11),
                        ),
                        Text(
                          'Non-Resident',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _buildStudentDetailsCard('Reference No.', '2345653'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
                _buildStudentDetailsCard('Hostel', 'Adom Bi Heights'),
                const SizedBox(height: 6),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStudentDetailsCard(String key, String value) {
    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 5, 62, 109),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 36,
              width: 42,
              decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(6)),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$key: $value',
            style: const TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }

  Widget _buildStudentStatus(
      String name, String course, bool online, BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.23,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(11),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/visca.jpg'),
              radius: 22,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          Text(
                            online ? 'online' : 'offline',
                            style: const TextStyle(fontSize: 10),
                          ),
                          const SizedBox(width: 4),
                          CircleAvatar(
                            radius: 3,
                            backgroundColor: online ? Colors.green : Colors.red,
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  Text(
                    course,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 10),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
