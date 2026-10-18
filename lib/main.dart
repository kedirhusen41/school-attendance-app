import 'package:flutter/material.dart';

void main() {
  runApp(const SchoolApp());
}

class SchoolApp extends StatelessWidget {
  const SchoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School & IT App',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        useMaterial3: true,
      ),
      home: const DashboardScreen(),
    );
  }
}

// ----------------------------------------------------
// 1. DASHBOARD SCREEN
// ----------------------------------------------------
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portal Barnoota fi Attendance'),
        centerTitle: true,
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _buildCard(
              context,
              title: 'Attendance',
              icon: Icons.assignment_turned_in,
              color: Colors.blue,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AttendanceScreen()),
              ),
            ),
            _buildCard(
              context,
              title: 'IT Short Notes',
              icon: Icons.menu_book,
              color: Colors.green,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ITNotesScreen()),
              ),
            ),
            _buildCard(
              context,
              title: 'IT Quizzes',
              icon: Icons.quiz,
              color: Colors.orange,
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ITQuizScreen()),
              ),
            ),
            _buildCard(
              context,
              title: 'Profile',
              icon: Icons.person,
              color: Colors.purple,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Fuulli Profile qophii irra jira.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCard(BuildContext context,
      {required String title,
      required IconData icon,
      required Color color,
      required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Ink(
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color, width: 1.5),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 48, color: color),
            const SizedBox(height: 12),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ----------------------------------------------------
// 2. ATTENDANCE SCREEN
// ----------------------------------------------------
class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<Map<String, dynamic>> _members = [
    {'name': 'Caalaa Asefa', 'role': 'Barsiisaa', 'status': 'Present'},
    {'name': 'Boontuu Dera', 'role': 'Hojjettuu Bulchiinsaa', 'status': 'Absent'},
    {'name': 'Gadaa Tolosa', 'role': 'Barataa (Kutaa 9)', 'status': 'Present'},
    {'name': 'Lensa Qana\'aa', 'role': 'Barataa (Kutaa 10)', 'status': 'Present'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Galmee Attendance'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: _members.length,
        itemBuilder: (context, index) {
          final item = _members[index];
          final isPresent = item['status'] == 'Present';

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: isPresent ? Colors.green : Colors.red,
                child: Icon(
                  isPresent ? Icons.check : Icons.close,
                  color: Colors.white,
                ),
              ),
              title: Text(item['name'], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(item['role']),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: isPresent ? Colors.green.shade100 : Colors.red.shade100,
                ),
                onPressed: () {
                  setState(() {
                    _members[index]['status'] = isPresent ? 'Absent' : 'Present';
                  });
                },
                child: Text(
                  item['status'],
                  style: TextStyle(color: isPresent ? Colors.green.shade900 : Colors.red.shade900),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ----------------------------------------------------
// 3. IT SHORT NOTES SCREEN (KUTAA 9-12)
// ----------------------------------------------------
class ITNotesScreen extends StatelessWidget {
  const ITNotesScreen({super.key});

  final Map<int, List<Map<String, String>>> notesData = const {
    9: [
      {
        'title': '1. Intro to Computers',
        'content': 'Computer is an electronic device that accepts data, processes it, and gives output.'
      },
      {
        'title': '2. Computer Hardware',
        'content': 'Hardware refers to physical components: CPU, RAM, Hard Disk, Keyboard, Monitor.'
      },
    ],
    10: [
      {
        'title': '1. Computer Software',
        'content': 'Software is a set of instructions. Main types: System Software (OS) & Application Software.'
      },
      {
        'title': '2. Computer Networks',
        'content': 'LAN (Local Area Network), WAN (Wide Area Network), and MAN (Metropolitan Area Network).'
      },
    ],
    11: [
      {
        'title': '1. Information Systems',
        'content': 'Components: People, Hardware, Software, Data, and Network used to manage information.'
      },
      {
        'title': '2. Database Basics',
        'content': 'Database is an organized collection of data. SQL is used to query databases.'
      },
    ],
    12: [
      {
        'title': '1. Programming Basics',
        'content': 'Algorithms, Flowcharts, and High-Level Languages like Python, Dart, and Java.'
      },
      {
        'title': '2. Cyber Security & Ethics',
        'content': 'Protecting systems from digital attacks, malware, phishing, and unauthorized access.'
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('IT Short Notes'),
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          bottom: const TabBar(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white70,
            tabs: [
              Tab(text: 'Kutaa 9'),
              Tab(text: 'Kutaa 10'),
              Tab(text: 'Kutaa 11'),
              Tab(text: 'Kutaa 12'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildNotesList(notesData[9]!),
            _buildNotesList(notesData[10]!),
            _buildNotesList(notesData[11]!),
            _buildNotesList(notesData[12]!),
          ],
        ),
      ),
    );
  }

  Widget _buildNotesList(List<Map<String, String>> notes) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: notes.length,
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ExpansionTile(
            title: Text(
              notes[index]['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  notes[index]['content']!,
                  style: const TextStyle(fontSize: 15, height: 1.4),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

// ----------------------------------------------------
// 4. IT QUIZ SCREEN
// ----------------------------------------------------
class ITQuizScreen extends StatefulWidget {
  const ITQuizScreen({super.key});

  @override
  State<ITQuizScreen> createState() => _ITQuizScreenState();
}

class _ITQuizScreenState extends State<ITQuizScreen> {
  int _score = 0;
  int _currentQuestionIndex = 0;

  final List<Map<String, dynamic>> _questions = const [
    {
      'question': 'Which component is known as the brain of the computer?',
      'options': ['RAM', 'CPU', 'Hard Disk', 'Monitor'],
      'answer': 1,
    },
    {
      'question': 'Which network covers a small geographical area like a school?',
      'options': ['WAN', 'MAN', 'LAN', 'PAN'],
      'answer': 2,
    },
    {
      'question': 'What does SQL stand for?',
      'options': [
        'Structured Query Language',
        'Simple Quality Language',
        'System Quick Logic',
        'Server Query List'
      ],
      'answer': 0,
    },
  ];

  void _answerQuestion(int selectedIndex) {
    if (selectedIndex == _questions[_currentQuestionIndex]['answer']) {
      _score++;
    }

    setState(() {
      _currentQuestionIndex++;
    });
  }

  void _resetQuiz() {
    setState(() {
      _score = 0;
      _currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IT Quiz'),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _currentQuestionIndex < _questions.length
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Gaaffii ${_currentQuestionIndex + 1}/${_questions.length}',
                    style: const TextStyle(fontSize: 18, color: Colors.grey),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    _questions[_currentQuestionIndex]['question'],
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  ...(_questions[_currentQuestionIndex]['options'] as List<String>)
                      .asMap()
                      .entries
                      .map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () => _answerQuestion(entry.key),
                        child: Text(entry.value, style: const TextStyle(fontSize: 16)),
                      ),
                    );
                  }),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.emoji_events, size: 80, color: Colors.orange),
                    const SizedBox(height: 16),
                    const Text(
                      'Xumurtaniittu!',
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Qabxii keessan: $_score / ${_questions.length}',
                      style: const TextStyle(fontSize: 18),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: _resetQuiz,
                      child: const Text('Irra Deebi\'ii Yaali'),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
