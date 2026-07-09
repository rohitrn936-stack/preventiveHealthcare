import 'package:flutter/material.dart';

void main() {
  runApp(const ShishuCareApp());
}

class ShishuCareApp extends StatelessWidget {
  const ShishuCareApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shishu Care AI',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFDFBF7),
        primaryColor: const Color(0xFFB85C38),
      ),
      home: const RoleSelectionPage(),
    );
  }
}

// --- COLOR PALETTE STYLING CONSTANTS ---
const Color kPrimaryBrown = Color(0xFFB85C38);
const Color kLightBg = Color(0xFFFDFBF7);
const Color kCardBg = Color(0xFFC46A45);
const Color kFormFill = Color(0xFFEAD5C3);

// --- MAIN ONBOARDING ILLUSTRATION ---
Widget _buildHeaderIllustration() {
  return Column(
    children: [
      const SizedBox(height: 40),
      const Text(
        'Welcome to',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.black87),
      ),
      const Text(
        'Shishu Care Ai',
        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: kPrimaryBrown, fontFamily: 'Serif'),
      ),
      const SizedBox(height: 20),
      Center(
        child: Container(
          height: 140,
          width: 140,
          decoration: const BoxDecoration(
            color: kFormFill,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.face_retouching_natural, size: 80, color: kPrimaryBrown),
        ),
      ),
      const SizedBox(height: 20),
    ],
  );
}

// --- 1. ROLE SELECTION PAGE ---
class RoleSelectionPage extends StatefulWidget {
  const RoleSelectionPage({super.key});

  @override
  State<RoleSelectionPage> createState() => _RoleSelectionPageState();
}

class _RoleSelectionPageState extends State<RoleSelectionPage> {
  String _selectedRole = 'Parent';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderIllustration(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: kPrimaryBrown,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Who are you?', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 20),
                  _buildRoleOption('Parent'),
                  _buildRoleOption('Doctor'),
                  _buildRoleOption('Social Worker'),
                  const SizedBox(height: 40),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 2),
                        fixedSize: const Size(160, 44),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                        elevation: 0,
                      ),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SignUpPage())),
                      child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())),
                      child: const Text('Already have an account? Sign in', style: TextStyle(color: Colors.white70, fontWeight: FontWeight.bold)),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleOption(String label) {
    bool isSelected = _selectedRole == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedRole = label),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(
              isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
              color: const Color(0xFFFFF2CC),
              size: 28,
            ),
            const SizedBox(width: 16),
            Text(label, style: const TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400)),
          ],
        ),
      ),
    );
  }
}

// --- 2. SIGN UP PAGE ---
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderIllustration(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 35),
              decoration: const BoxDecoration(
                color: kPrimaryBrown,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sign Up', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 20),
                  _buildInputField('Name'),
                  _buildInputField('Email'),
                  _buildInputField('Password', obscure: true),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 2),
                        fixedSize: const Size(160, 44),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const VerificationPage())),
                      child: const Text('Next', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage())),
                      child: const Text('Already have an account? Sign in', style: TextStyle(color: Colors.white70)),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 6),
          TextField(
            obscureText: obscure,
            decoration: InputDecoration(
              filled: true,
              fillColor: kFormFill,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

// --- 3. LOGIN PAGE ---
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderIllustration(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: const BoxDecoration(
                color: kPrimaryBrown,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Log in', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 20),
                  _buildInputField('Email'),
                  _buildInputField('Password', obscure: true),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFE78855),
                        fixedSize: const Size(160, 44),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const DashboardHost()), (route) => false),
                      child: const Text('Login', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Forgot Password?', style: TextStyle(color: Color(0xFFFFF2CC))),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildInputField(String label, {bool obscure = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(color: Colors.white, fontSize: 16)),
          const SizedBox(height: 6),
          TextField(
            obscureText: obscure,
            decoration: InputDecoration(
              filled: true,
              fillColor: kFormFill,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(24), borderSide: BorderSide.none),
            ),
          ),
        ],
      ),
    );
  }
}

// --- 4. ACCOUNT VERIFICATION PAGE ---
class VerificationPage extends StatelessWidget {
  const VerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildHeaderIllustration(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: kPrimaryBrown,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Account\nVerification', style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white, height: 1.2)),
                  const SizedBox(height: 16),
                  const Text('Please enter the 4 digit code sent to Your Email', style: TextStyle(color: Colors.white70, fontSize: 15)),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(4, (index) => _buildOtpBox()),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text('Resend Code', style: TextStyle(color: Colors.white70, decoration: TextDecoration.underline)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(color: Colors.white, width: 2),
                        fixedSize: const Size(160, 44),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                      ),
                      onPressed: () => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const DashboardHost()), (route) => false),
                      child: const Text('Verify', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildOtpBox() {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(color: kFormFill, borderRadius: BorderRadius.circular(16)),
      child: const TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        decoration: InputDecoration(counterText: '', border: InputBorder.none),
      ),
    );
  }
}

// --- 5. MAIN NAVIGATION CONTAINER (HOST) ---
class DashboardHost extends StatelessWidget {
  const DashboardHost({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DashboardTabsController(),
    );
  }
}

class DashboardTabsController extends StatefulWidget {
  const DashboardTabsController({super.key});

  @override
  State<DashboardTabsController> createState() => _DashboardTabsControllerState();
}

class _DashboardTabsControllerState extends State<DashboardTabsController> {
  int _currentIndex = 2; // Set directly to Services Tab for quicker testing/presentation

  final List<Widget> _tabs = [
    const HomeTab(),
    const VaccinationTab(),
    const ServicesTab(),
    const ChildInfoTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBrown,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: const Text('Shishu Care Ai', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24, fontFamily: 'Serif')),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white, size: 28),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const NotificationPage())),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: _tabs[_currentIndex],
      bottomNavigationBar: Container(
        color: kPrimaryBrown,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),
          backgroundColor: kPrimaryBrown,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white60,
          selectedFontSize: 12,
          unselectedFontSize: 11,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.health_and_safety_outlined), label: 'Vaccination'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Services'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart_outlined), label: 'Child Info'),
          ],
        ),
      ),
    );
  }
}

// --- TAB 1: HOME PANEL ---
class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  bool _showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const CircleAvatar(radius: 50, backgroundColor: Colors.black12, child: Icon(Icons.person, size: 60, color: Colors.black54)),
          const SizedBox(height: 16),
          const Text('Parent name', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          const SizedBox(height: 24),
          const Text('Child name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(30),
            width: double.infinity,
            height: 180,
            decoration: BoxDecoration(border: Border.all(color: Colors.black, width: 2), borderRadius: BorderRadius.circular(4)),
            child: const Center(child: Text('Child info', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
          ),
          const SizedBox(height: 16),
          GestureDetector(
            onTap: () => setState(() => _showDropdown = !_showDropdown),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(border: Border.all(color: Colors.black), borderRadius: BorderRadius.circular(24)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Child name', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(_showDropdown ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          if (_showDropdown)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const Text('various childs', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            )
        ],
      ),
    );
  }
}

// --- TAB 2: VACCINATION PANEL ---
class VaccinationTab extends StatelessWidget {
  const VaccinationTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(24)),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.white24))),
              child: const Row(
                children: [
                  Icon(Icons.calendar_month, color: Colors.white, size: 36),
                  SizedBox(width: 16),
                  Text('vaccine chart', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const Expanded(
              child: Center(
                child: Text(
                  'vaccine chart\nfrom government',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// --- TAB 3: SERVICES PANEL (MAIN HEALTHCARE INDEX GRID) ---
class ServicesTab extends StatelessWidget {
  const ServicesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> healthcareDomains = [
      {
        'title': 'Growth',
        'icon': Icons.trending_up,
        'page': const GrowthSubPage(),
      },
      {
        'title': 'Developmental Delay',
        'icon': Icons.child_care,
        'page': const DevelopmentalDelaySubPage(),
      },
      {
        'title': 'Cognitive Development',
        'icon': Icons.psychology,
        'page': const GenericDetailView(
          title: 'Cognitive Development',
          content: 'Tracks core cognitive milestones including mental scaling, memory processing capability, dynamic early-stage problem solving, and adaptive situational awareness markers.',
        ),
      },
      {
        'title': 'Mental Health',
        'icon': Icons.sentiment_satisfied_alt,
        'page': const GenericDetailView(
          title: 'Mental Health',
          content: 'Tracks emotional baseline regulation indexes, early psychological adaptability signals, behavioral indicators, and social-emotional relationship structures.',
        ),
      },
    ];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.3,
        ),
        itemCount: healthcareDomains.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => healthcareDomains[index]['page'])),
            borderRadius: BorderRadius.circular(16),
            child: Container(
              decoration: BoxDecoration(
                color: kCardBg,
                borderRadius: BorderRadius.circular(16),
              ),
              padding: const EdgeInsets.all(12),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(healthcareDomains[index]['icon'], color: Colors.white, size: 32),
                  const SizedBox(height: 8),
                  Text(
                    healthcareDomains[index]['title'],
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- SUBDOMAIN: GROWTH SUB-PAGE (GRID VIEW SHAPE) ---
class GrowthSubPage extends StatelessWidget {
  const GrowthSubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> subdomains = [
      {'title': 'Stunting', 'desc': 'Impaired skeletal development tracking against standardized low height-for-age parameters.'},
      {'title': 'Underweight', 'desc': 'Traces body-mass deficiencies across specific dynamic weight-for-age metrics.'},
      {'title': 'Wasting', 'desc': 'Monitors critical weight loss trends indicating acute nutritional deficiencies.'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBrown,
        title: const Text('Growth Subdomains', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.2,
          ),
          itemCount: subdomains.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GenericDetailView(title: subdomains[index]['title']!, content: 'Displays tracking configurations, baseline calculations, historical trends, and targeted nutritional workflows regarding ${subdomains[index]['title']!.toLowerCase()}.'),
                ),
              ),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.analytics_outlined, color: Colors.white, size: 30),
                    const SizedBox(height: 8),
                    Text(
                      subdomains[index]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// --- SUBDOMAIN: DEVELOPMENTAL DELAY SUB-PAGE (GRID VIEW SHAPE) ---
class DevelopmentalDelaySubPage extends StatelessWidget {
  const DevelopmentalDelaySubPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> subdomains = [
      {'title': 'Fine Motor Development', 'desc': 'Precision dexterity indices, physical coordination, and early manipulation mechanics.'},
      {'title': 'Gross Motor Development', 'desc': 'Tracks core large-muscle kinetic trajectories, locomotion, and balance stability.'},
      {'title': 'Language Development', 'desc': 'Monitors speech articulation tracks, phonetic processing, and communicative milestones.'},
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBrown,
        title: const Text('Developmental Tracks', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: 1.1,
          ),
          itemCount: subdomains.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => GenericDetailView(title: subdomains[index]['title']!, content: 'Presents specialized multi-point validation checksheets and progressive interactive development tasks configured for ${subdomains[index]['title']!.toLowerCase()}.'),
                ),
              ),
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(16)),
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.accessibility_new, color: Colors.white, size: 30),
                    const SizedBox(height: 6),
                    Text(
                      subdomains[index]['title']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// --- UNIVERSAL TEXT PRESENTATION SCREEN VIEW ---
class GenericDetailView extends StatelessWidget {
  final String title;
  final String content;

  const GenericDetailView({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBrown,
        title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: kCardBg,
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title.toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Color(0xFFFFF2CC), fontSize: 18, fontWeight: FontWeight.w900, letterSpacing: 1.2),
              ),
              const SizedBox(height: 16),
              Text(
                content,
                textAlign: TextAlign.justify,
                style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- TAB 4: CHILD INFORMATION DETAIL PANEL ---
class ChildInfoTab extends StatelessWidget {
  const ChildInfoTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(color: kCardBg, borderRadius: BorderRadius.circular(24)),
        child: const Center(
          child: Text(
            'all the\ninformation\nabout the child ,\nany hazards etc\netc',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold, height: 1.4),
          ),
        ),
      ),
    );
  }
}

// --- 6. NOTIFICATION PAGE ---
class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryBrown,
        title: const Text('Notifications', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildNotificationItem('Upcoming Vaccination Alert', 'BCG Booster dose due next Tuesday.', '2 hrs ago', Icons.health_and_safety_outlined),
          _buildNotificationItem('Growth Tracking Update', 'New baseline update registered in cognitive analytics.', '1 day ago', Icons.bar_chart),
          _buildNotificationItem('System Check', 'Your profile details are complete.', '3 days ago', Icons.check_circle_outline),
        ],
      ),
    );
  }

  Widget _buildNotificationItem(String title, String subtitle, String time, IconData icon) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(backgroundColor: kFormFill, child: Icon(icon, color: kPrimaryBrown)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.black54)),
        trailing: Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
      ),
    );
  }
}