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

  void _showSourceModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Allows the modal to take up more screen height
      backgroundColor: Colors.transparent, // Makes the top corners strictly follow our Container decoration
      builder: (BuildContext context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.85, // Takes up 85% of screen
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Drag Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // 2. LIVE REFERENCE Header
              Row(
                children: [
                  const Icon(Icons.circle, color: Color(0xFF1D3A8A), size: 8),
                  const SizedBox(width: 8),
                  Text(
                    'LIVE REFERENCE',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w900,
                      color: const Color(0xFF1D3A8A),
                      letterSpacing: 0.5,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    'Document ID: HCDA-74-104B',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // 3. Document Title & Badge
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade50,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(Icons.security, color: Color(0xFF1D3A8A)),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Official Source\nDocument',
                          style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.verified, color: Colors.blue, size: 14),
                            const SizedBox(width: 4),
                            Text(
                              'VERIFIED AUTHENTICITY',
                              style: GoogleFonts.inter(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blue.shade200),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      'SEC. 104-B',
                      style: GoogleFonts.inter(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue.shade700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // 4. Info Box (Last Updated & Authority)
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 18, color: Colors.grey.shade600),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('LAST UPDATED', style: GoogleFonts.inter(fontSize: 10, color: Colors.grey.shade500, fontWeight: FontWeight.bold)),
                              Text('Oct 24, 2023', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(width: 1, height: 30, color: Colors.grey.shade300),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Row(
                        children: [
                          Icon(Icons.gavel, size: 18, color: Colors.grey.shade600),
                          const SizedBox(width: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('AUTHORITY', style: GoogleFonts.inter(fontSize: 10, color: Colors.grey.shade500, fontWeight: FontWeight.bold)),
                              Text('Covid 19 Lockdown', style: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 5. Document Content
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'Pursuant to the Regulatory Framework established under the Housing and Community Development Act of 1974, all participating agencies are mandated to maintain clear disclosure protocols.',
                      style: GoogleFonts.inter(fontSize: 15, color: Colors.grey.shade800, height: 1.5),
                    ),
                    const SizedBox(height: 16),
                    // Blockquote
                    Container(
                      padding: const EdgeInsets.only(left: 16),
                      decoration: const BoxDecoration(
                        border: Border(left: BorderSide(color: Colors.blue, width: 3)),
                      ),
                      child: Text(
                        '"No individual shall be subject to discrimination based on the provisions set forth in Section 8.4 regarding familial status or disability in the allocation of community credits."',
                        style: GoogleFonts.inter(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.grey.shade600, height: 1.5),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'This verification ensures that the guidance provided in this consultation aligns with current legislative mandates. Failure to comply with these specific subsections may result in administrative review by the oversight committee.',
                      style: GoogleFonts.inter(fontSize: 15, color: Colors.grey.shade800, height: 1.5),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Text(
                          'View Full Act in National Register',
                          style: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.bold, color: const Color(0xFF1D3A8A)),
                        ),
                        const SizedBox(width: 4),
                        const Icon(Icons.open_in_new, size: 14, color: Color(0xFF1D3A8A)),
                      ],
                    ),
                  ],
                ),
              ),

              // 6. Action Buttons
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        side: BorderSide(color: Colors.grey.shade300),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.description_outlined, color: Colors.black),
                      label: Text('Download PDF', style: GoogleFonts.inter(color: Colors.black, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF1D3A8A),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Close', style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold)),

                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
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
                  _buildUserBubble("Kalo mau ke apotek dari sini lewat mana ya?", "10:15 AM"),
                  _buildAIBubble(
                    [
                      "Keluar rumah, langsung belok kiri aja",
                      "Jalan lurus terus ngelewatin dua blok",
                      "Nah, apoteknya persis di sebelahnya warung kelontong"
                    ],
                    "10:16 AM",
                    "Liat Sumbernya",
                    Icons.link, () => _showSourceModal(context),
                  ),
                  _buildUserBubble("Sekarang lagi buka nggak tuh?", "10:17 AM"),
                  _buildAIBubble(
                    [
                      "Buka kok, hari ini buka sampe jam 8 malem",
                      "Sekarang kan baru jam 10:17 pagi",
                      "Masih santai kok waktunya kalo mau ke sana sekarang"
                    ],
                    "10:17 AM",
                    "Liat Sumbernya",
                    Icons.link, () => _showSourceModal(context),
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
                radius: 18,
                backgroundColor: Color(0xFFFFFFFF), // Placeholder color
                child: Image(image: AssetImage('assets/images/GovEase.png'), fit: BoxFit.contain),
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
                'GovEase Assistant',
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

  Widget _buildAIBubble(List<String> bullets, String time, String buttonText, IconData buttonIcon, VoidCallback onButtonTap) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.only(bottom: 24, right: 40),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFFEFF6FF),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: Radius.circular(4),
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
                  'SARAN ASISTEN',
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
            )).toList(),
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
                onPressed: onButtonTap, // <--- Now it uses the passed function!
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