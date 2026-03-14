import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TranslationScreen extends StatefulWidget {
  final String selectedLanguage; // Passed from the previous screen

  const TranslationScreen({super.key, this.selectedLanguage = 'Vietnam'});

  @override
  _TranslationScreenState createState() => _TranslationScreenState();
}

class _TranslationScreenState extends State<TranslationScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _isTyping = false;

  @override
  void initState() {
    super.initState();
    // Listen to text changes to swap the Mic icon to a Send icon
    _textController.addListener(() {
      setState(() {
        _isTyping = _textController.text.isNotEmpty;
      });
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                children: [
                  Center(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Text(
                        'TODAY',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey.shade700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Hardcoded messages matching your mockup
                  _buildUserBubble("How do I get to the pharmacy from here?", "10:15 AM"),
                  _buildAIBubble(
                    [
                      "Turn left out of your front door",
                      "Walk straight for two blocks",
                      "The pharmacy is next to the grocery store"
                    ],
                    "10:16 AM",
                    "Here are the sources",
                    Icons.volume_up,
                  ),
                  _buildUserBubble("Is it open right now?", "10:17 AM"),
                  _buildAIBubble(
                    [
                      "Yes, it is open until 8:00 PM today",
                      "It is currently 10:17 AM",
                      "You have plenty of time to go"
                    ],
                    "10:17 AM",
                    "Play Audio Response",
                    Icons.volume_up,
                  ),
                ],
              ),
            ),
            // The upgraded input area
            _buildBottomInputArea(),
          ],
        ),
      ),
    );
  }

  // --- UI HELPER WIDGETS ---

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 1,
      shadowColor: Colors.grey.shade100,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        onPressed: () => Navigator.pop(context),
      ),
      title: Row(
        children: [
          // Profile Pic Stack
          Stack(
            children: [
              const CircleAvatar(
                radius: 20,
                backgroundColor: Color(0xFF1D3A8A), // Placeholder color
                child: Icon(Icons.smart_toy, color: Colors.white),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'AI Helper',
                style: GoogleFonts.inter(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                'Active Now',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.blue.shade50,
            radius: 20,
            child: IconButton(
              icon: const Icon(Icons.phone, color: Colors.blue, size: 20),
              onPressed: () {},
            ),
          ),
        )
      ],
    );
  }

  Widget _buildUserBubble(String text, String time) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16, left: 50),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(4), // Pointy edge
          ),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              text,
              style: GoogleFonts.inter(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: const Color(0xFF161A1D),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  time,
                  style: GoogleFonts.inter(fontSize: 10, color: Colors.grey.shade600, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.done_all, size: 14, color: Colors.blue),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAIBubble(List<String> bullets, String time, String buttonText, IconData buttonIcon) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24, right: 40),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFF6FF), // Light blue from mockup
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(4), // Pointy edge
            bottomRight: Radius.circular(16),
          ),
          border: Border.all(color: Colors.blue.shade200),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.volume_up, color: Color(0xFF1D3A8A), size: 18),
                const SizedBox(width: 8),
                Text(
                  'ASSISTANT SUGGESTION',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w900,
                    color: const Color(0xFF1D3A8A),
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Bullets
            ...bullets.map((bullet) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 6.0, right: 8.0),
                    child: Icon(Icons.circle, size: 8, color: Color(0xFF1D3A8A)),
                  ),
                  Expanded(
                    child: Text(
                      bullet,
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF111827),
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            )),
            const SizedBox(height: 4),

            // Action Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF1D3A8A),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  // Trigger Audio or open Sources Modal
                },
                icon: Icon(buttonIcon, color: Colors.white, size: 20),
                label: Text(
                  buttonText,
                  style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 14),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              time,
              style: GoogleFonts.inter(fontSize: 10, color: Colors.black87, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  // --- THE NEW INPUT AREA ---
  Widget _buildBottomInputArea() {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          // Text Input Field
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      maxLines: 4,
                      minLines: 1,
                      decoration: const InputDecoration(
                        hintText: "Type or speak...",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.attach_file, color: Colors.grey),
                    onPressed: () {}, // Optional attachment
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Dynamic Send / Mic Button
          GestureDetector(
            onTap: () {
              if (_isTyping) {
                // Send Text to Backend
                print("Sending text: ${_textController.text}");
                _textController.clear();
              } else {
                // Trigger Voice-to-Text recording
                print("Started recording voice...");
              }
            },
            child: CircleAvatar(
              radius: 25,
              backgroundColor: const Color(0xFF1D3A8A),
              child: Icon(
                _isTyping ? Icons.send : Icons.mic,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}