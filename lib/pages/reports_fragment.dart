import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../models/nessaege_card_model.dart';

class ReportsFragment extends StatefulWidget {
  const ReportsFragment({super.key});

  @override
  State<ReportsFragment> createState() => _ReportsFragmentState();
}

class _ReportsFragmentState extends State<ReportsFragment> {
  final List<Message> _messages = [];
  final TextEditingController _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // The Left Area
            Column(
              children: [
                // The Blue Container containing the report summary

                _buildReportSummaryContainer(context),

                SizedBox(height: size.height * 0.006),
                _buildReportsChatArea(context, 'John Agyin',
                    'Sexual Harassment', 'BSc. Computer Science'),
              ],
            ),

            // The right side
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildUnreadReportsCard(),
                  SizedBox(height: size.height * 0.004),
                  _buildReadReportsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReportSummaryContainer(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.all(24),
      width: size.width * 0.52,
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
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
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          const Text(
            'Message Category',
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          SizedBox(height: size.height * 0.038),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  const Text('Sexual Harassment',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: size.height * 0.004),
                  const Text('56',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  const Text('Theft',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: size.height * 0.004),
                  const Text('91',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  const Text('Violence',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: size.height * 0.004),
                  const Text('78',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                children: [
                  const Text('Health',
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                  SizedBox(height: size.height * 0.004),
                  const Text('80',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildReportsChatArea(
      BuildContext context, String name, String category, String course) {
    final size = MediaQuery.of(context).size;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('dd MMM, yyyy  HH:mm')
        .format(now); // Outputs date in the form : '06 May, 2024  19:57'
    return Card(
      elevation: 2,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        width: size.width * 0.52,
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Header with User Details and Report Info
            Row(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/visca.jpg'),
                  radius: 22,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(
                          fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      course,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Report Category',
                      overflow: TextOverflow.fade,
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      category,
                      overflow: TextOverflow.fade,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6.0),
              child: Divider(color: Colors.grey[200], thickness: 2),
            ),
            const SizedBox(height: 10),
            Center(
              child: Text(
                formattedDate,
                // '06 May, 2024  19:57',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ),
            const SizedBox(height: 10),
            // Chat Messages Area
            Container(
              height: size.height * 0.34,
              child: ListView.builder(
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  final isUser = message.sender == MessageSender.user;

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: isUser
                          ? MainAxisAlignment.end
                          : MainAxisAlignment.start,
                      children: [
                        if (!isUser) const SizedBox(width: 8),
                        Flexible(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 10),
                            margin: const EdgeInsets.symmetric(vertical: 5),
                            decoration: BoxDecoration(
                              color: Colors.grey[200],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(message.text),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            // Message Input Area
            Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300]!.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      child: TextField(
                        controller: _messageController,
                        decoration: const InputDecoration(
                          contentPadding: EdgeInsets.all(8),
                          hintText: 'Message',
                        ),
                        onSubmitted: (text) {
                          if (text.isNotEmpty) {
                            // Trigger your desired function when enter is pressed
                            setState(() {
                              _messages.add(Message(
                                  text: text, sender: MessageSender.user));
                              _messages.add(Message(
                                  text: 'Message from $name',
                                  sender: MessageSender
                                      .admin)); // Simulating admin's response
                              _messageController.clear();
                            });
                          }
                        },
                      )),
                ),
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    final text = _messageController.text;
                    if (text.isNotEmpty) {
                      setState(() {
                        _messages.add(
                            Message(text: text, sender: MessageSender.user));
                        _messages.add(Message(
                            text: 'Message from $name',
                            sender: MessageSender
                                .admin)); // Simulating admin's response
                        _messageController.clear();
                      });
                    }
                  },
                  child: Container(
                      width: 72,
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
                        borderRadius: BorderRadius.circular(12),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          'Send',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildUnreadReportsCard() {
  return Card(
    elevation: 2,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 300,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Unread Reports',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 1.6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Divider(color: Colors.grey[200], thickness: 2),
          ),
          const SizedBox(height: 2),
          _buildStudentStatus('John Doe', 'Sexual Harassment', 3),
          const SizedBox(height: 6),
          _buildStudentStatus('Chris Aggay', 'Violence', 1),
          const SizedBox(height: 6),
          _buildStudentStatus('John Doe', 'Health', null),
          const SizedBox(height: 6),
          _buildStudentStatus('John Doe', 'Theft', 2),
        ],
      ),
    ),
  );
}

Widget _buildReadReportsCard() {
  return Card(
    elevation: 2,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      width: 300,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Unread Reports',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 1.6),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6.0),
            child: Divider(color: Colors.grey[200], thickness: 2),
          ),
          const SizedBox(height: 2),
          _buildStudentStatus('John Doe', 'Sexual Harassment', null),
          const SizedBox(height: 6),
          _buildStudentStatus('Chris Aggay', 'Violence', null),
          const SizedBox(height: 6),
          _buildStudentStatus('John Doe', 'Health', null),
        ],
      ),
    ),
  );
}

Widget _buildStudentStatus(String name, String category, int? unreadMessages) {
  return Container(
    // width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 6),
    decoration: BoxDecoration(
        color: Colors.grey[100], borderRadius: BorderRadius.circular(12)),
    child: Padding(
      padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/visca.jpg'),
            radius: 22,
          ),
          const SizedBox(width: 6),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                overflow: TextOverflow.fade,
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 4),
              Text(
                'Category: $category',
                overflow: TextOverflow.fade,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ),
          const Spacer(),
          if (unreadMessages != null)
            CircleAvatar(
              radius: 7,
              backgroundColor: Colors.green,
              child: Center(
                child: Text(
                  unreadMessages.toString(),
                  style: const TextStyle(fontSize: 8),
                ),
              ),
            ),
        ],
      ),
    ),
  );
}
// }
