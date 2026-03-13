import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  _LandingScreenState createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  String selectedLanguage = 'Vietnam';

  final List<Map<String, String>> languages = [
    {'name': 'Vietnam', 'image': 'assets/images/vietnam.png', 'flag': '🇻🇳'},
    {'name': 'Indonesian', 'image': 'assets/images/indonesia.png', 'flag': '🇮🇩'},
    {'name': 'Thailand', 'image': 'assets/images/thailand.png', 'flag': '🇹🇭'},
    {'name': 'Bangladesh', 'image': 'assets/images/bangladesh.png', 'flag': '🇧🇩'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // 1. Logo & App Name
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/GovEase.png',
                    width: 32,
                    height: 32,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'GovEase',
                    style: GoogleFonts.manrope(
                      fontSize: 24,
                      fontWeight: FontWeight.w800,
                      color: const Color(0xFF111827),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // 2. Titles
              Text(
                'Choose your language',
                style: GoogleFonts.manrope(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFF111827),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Choose the language you'd like to use.",
                style: GoogleFonts.inter(
                  fontSize: 16,
                  color: Color(0xFF565d6d),
                ),
              ),
              const SizedBox(height: 40),

              // 3. The 2x2 Grid
              Expanded(
                child: GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.9,
                  ),
                  itemCount: languages.length,
                  itemBuilder: (context, index) {
                    final lang = languages[index];
                    final isSelected = selectedLanguage == lang['name'];

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedLanguage = lang['name']!;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: isSelected ? const Color(0xFF1D3A8A) : Colors.grey.shade300,
                            width: isSelected ? 2.0 : 1.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade100,
                                border: Border.all(color: Colors.grey.shade200, width: 1),
                              ),
                              alignment: Alignment.center,
                              child: ClipOval(
                                child: Image.asset(
                                  lang['image']!,
                                  width: 45,
                                  height: 45,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              lang['name']!,
                              style: GoogleFonts.inter(
                                fontSize: 18,
                                fontWeight: isSelected ? FontWeight.bold : FontWeight.w600,
                                color: isSelected ? const Color(0xFF183883) : const Color(0xFF374151),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),

              // 4. Help Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.help_outline, size: 18, color: Color(0xFF183883)),
                  const SizedBox(width: 8),
                  Text(
                    "Can't find your language?",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF183883),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                  const Icon(Icons.chevron_right, size: 18, color: Color(0xFF183883)),
                ],
              ),
              const SizedBox(height: 30),

              // 5. Continue Button & Footer
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF183883),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  onPressed: () {
                    print("User selected: $selectedLanguage");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Continue',
                        style: GoogleFonts.inter(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Icon(Icons.arrow_forward, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'You can change this setting anytime in the App Settings.',
                textAlign: TextAlign.center,
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontStyle: FontStyle.italic,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}