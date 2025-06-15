import 'package:flutter/material.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  _HelpCenterScreenState createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Help topics data
  static const List<Map<String, dynamic>> _helpTopics = [
    {
      'emoji': '🎫',
      'title': 'Booking & Tickets',
      'subtitle':
          'How to book tickets, cancel bookings, and manage reservations',
      'articles': 12
    },
    {
      'emoji': '💳',
      'title': 'Payment Issues',
      'subtitle': 'Payment methods, refunds, and transaction problems',
      'articles': 8
    },
    {
      'emoji': '🚌',
      'title': 'Trip Information',
      'subtitle': 'Bus schedules, delays, route changes, and trip updates',
      'articles': 15
    },
    {
      'emoji': '📱',
      'title': 'App Usage',
      'subtitle': 'How to use the app, features, and troubleshooting',
      'articles': 10
    },
    {
      'emoji': '👤',
      'title': 'Account & Profile',
      'subtitle': 'Account settings, profile management, and security',
      'articles': 6
    },
    {
      'emoji': '🎒',
      'title': 'Luggage & Check-in',
      'subtitle': 'Luggage policies, check-in process, and restrictions',
      'articles': 5
    },
    {
      'emoji': '📞',
      'title': 'Contact Support',
      'subtitle': 'Get in touch with our customer support team',
      'articles': 3
    },
    {
      'emoji': '❓',
      'title': 'General Questions',
      'subtitle': 'Frequently asked questions and general information',
      'articles': 20
    },
  ];

  List<Map<String, dynamic>> get _filteredTopics {
    if (_searchQuery.isEmpty) return _helpTopics;
    return _helpTopics.where((topic) {
      final query = _searchQuery.toLowerCase();
      return topic['title'].toLowerCase().contains(query) ||
          topic['subtitle'].toLowerCase().contains(query);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Color(0xFFF3F4F6)),
        child: SafeArea(
          child: Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 448),
              height: 650,
              color: Colors.white,
              child: Column(
                children: [
                  _buildStatusBar(),
                  _buildHeader(),
                  Expanded(child: _buildContent()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusBar() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('9:41',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500)),
          Row(
            children: [
              Row(
                children: List.generate(
                    4,
                    (i) => Container(
                          width: 4,
                          height: 12,
                          margin: const EdgeInsets.only(right: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(i < 3 ? 1 : 0.7),
                            borderRadius: BorderRadius.circular(2),
                          ),
                        )),
              ),
              const SizedBox(width: 4),
              const Icon(Icons.wifi, color: Colors.black, size: 16),
              const SizedBox(width: 4),
              Container(
                width: 24,
                height: 12,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          border:
              Border(bottom: BorderSide(color: Color(0xFFF3F4F6), width: 1))),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back,
                  color: Color(0xFF374151), size: 24)),
          const SizedBox(width: 16),
          const Text('Help Center',
              style: TextStyle(
                  color: Color(0xFF111827),
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildContent() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _buildSearchBar(),
          const SizedBox(height: 24),
          Expanded(child: _buildTopicsList()),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return TextField(
      controller: _searchController,
      onChanged: (value) => setState(() => _searchQuery = value),
      decoration: InputDecoration(
        hintText: 'Search',
        prefixIcon: const Padding(
          padding: EdgeInsets.all(12),
          child: Icon(Icons.search, color: Color(0xFF9CA3AF), size: 20),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFE5E7EB))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Color(0xFFF97316))),
        filled: true,
        fillColor: const Color(0xFFF9FAFB),
        contentPadding: const EdgeInsets.symmetric(horizontal: 40, vertical: 8),
      ),
    );
  }

  Widget _buildTopicsList() {
    final topics = _filteredTopics;
    return ListView.builder(
      itemCount: topics.length,
      itemBuilder: (context, index) => _buildHelpTopicItem(topics[index]),
    );
  }

  Widget _buildHelpTopicItem(Map<String, dynamic> topic) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _handleTopicTap(topic),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  margin: const EdgeInsets.only(right: 12),
                  decoration: BoxDecoration(
                      color: const Color(0xFFF3F4F6),
                      borderRadius: BorderRadius.circular(12)),
                  child: Center(
                      child: Text(topic['emoji'],
                          style: const TextStyle(fontSize: 20, height: 1.0))),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(topic['title'],
                          style: const TextStyle(
                              color: Color(0xFF111827),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.25)),
                      const SizedBox(height: 4),
                      Text(topic['subtitle'],
                          style: const TextStyle(
                              color: Color(0xFF6B7280),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 1.33)),
                      const SizedBox(height: 4),
                      Text('${topic['articles']} articles',
                          style: const TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 11,
                              fontWeight: FontWeight.w400,
                              height: 1.45)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right,
                    color: Color(0xFF9CA3AF), size: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleTopicTap(Map<String, dynamic> topic) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(topic['emoji'], style: const TextStyle(fontSize: 24)),
                const SizedBox(width: 12),
                Expanded(
                    child: Text(topic['title'],
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600))),
              ],
            ),
            const SizedBox(height: 12),
            Text(topic['subtitle'],
                style: const TextStyle(color: Color(0xFF6B7280), fontSize: 14)),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Opening ${topic['title']} articles...'),
                      backgroundColor: const Color(0xFFF97316),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  padding: EdgeInsets.zero,
                ),
                child: Ink(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                        colors: [Color(0xFFF7960F), Color(0xFFFF8C00)]),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                      child: Text('View Articles (${topic['articles']})',
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500))),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
