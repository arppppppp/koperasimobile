import 'package:flutter/material.dart';
import 'homepage.dart';

class SimpananScreen extends StatefulWidget {
  const SimpananScreen({super.key});

  @override
  State<SimpananScreen> createState() => _SimpananScreenState();
}

class _SimpananScreenState extends State<SimpananScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC16),
        toolbarHeight: 56, 
        elevation: 0,
        title: const Text(
          'Simpanan',
          style: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xFF4E342E)),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const KoperasiApp()),
            );
          },
        ),
      ),
      body: Column(
        children: [
          // User profile card
          _buildProfileCard(),
          
          // Tab Bar
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: TabBar(
              controller: _tabController,
              labelColor: const Color(0xFF4E342E),
              unselectedLabelColor: Colors.black54,
              indicatorColor: const Color(0xFFFFDC16),
              indicatorWeight: 3,
              indicatorSize: TabBarIndicatorSize.tab,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: 'Poppins',
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Poppins',
              ),
              tabs: const [
                Tab(text: 'Pokok'),
                Tab(text: 'Wajib'),
                Tab(text: 'Sukarela'),
              ],
            ),
          ),
          
          // Tab content
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildSimpananPokokContent(),
                _buildSimpananWajibContent(),
                _buildSimpananSukarelaContent(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Profile card similar to HomePage
  Widget _buildProfileCard() {
    return Card(
      margin: const EdgeInsets.all(16),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(color: const Color(0xFFCCCCCC).withOpacity(0.5)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User name
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Row(
                children: [
                  Icon(Icons.person, size: 20, color: Color(0xFF3E2723)),
                  SizedBox(width: 8),
                  Text(
                    'Ujang Pedro',
                    style: TextStyle(
                      color: Color(0xFF3E2723),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            
            // NIP Information
            const Row(
              children: [
                Text(
                  'NIP : ',
                  style: TextStyle(
                    color: Color(0xFF4E342E),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  '123456789',
                  style: TextStyle(
                    color: Color(0xFF4E342E),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Simpanan Pokok Content
  Widget _buildSimpananPokokContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSimpananCard(
            'Simpanan Pokok',
            'Rp. 500.000',
            const Color(0xFFFFD600),
            'Total simpanan pokok yang telah dibayarkan',
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Informasi Simpanan Pokok'),
          const SizedBox(height: 16),
          const Text(
            'Simpanan pokok merupakan sejumlah uang yang wajib dibayarkan oleh anggota kepada koperasi pada saat menjadi anggota. Simpanan pokok tidak dapat diambil kembali selama yang bersangkutan masih menjadi anggota koperasi.',
            style: TextStyle(
              color: Color(0xFF4E342E),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Riwayat Setoran'),
          const SizedBox(height: 16),
          _buildHistoryList(),
        ],
      ),
    );
  }

  // Simpanan Wajib Content
  Widget _buildSimpananWajibContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSimpananCard(
            'Simpanan Wajib',
            'Rp. 200.000',
            const Color(0xFFFFD600),
            'Total simpanan wajib yang telah dibayarkan',
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Informasi Simpanan Wajib'),
          const SizedBox(height: 16),
          const Text(
            'Simpanan wajib adalah sejumlah simpanan tertentu yang dibayarkan oleh anggota kepada koperasi setiap bulan atau sesuai periode pembayaran yang ditentukan. Simpanan wajib tidak dapat diambil kembali selama yang bersangkutan masih menjadi anggota.',
            style: TextStyle(
              color: Color(0xFF4E342E),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Riwayat Setoran'),
          const SizedBox(height: 16),
          _buildHistoryList(),
        ],
      ),
    );
  }

  // Simpanan Sukarela Content
  Widget _buildSimpananSukarelaContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSimpananCard(
            'Simpanan Sukarela',
            'Rp. 200.000',
            const Color(0xFFFFD600),
            'Total simpanan sukarela yang telah dibayarkan',
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 24),
          _buildSectionHeader('Informasi Simpanan Sukarela'),
          const SizedBox(height: 16),
          const Text(
            'Simpanan sukarela adalah simpanan yang besarnya tidak ditentukan, tetapi bergantung kepada kemampuan anggota. Simpanan sukarela dapat disetorkan dan diambil kapan saja sesuai ketentuan koperasi.',
            style: TextStyle(
              color: Color(0xFF4E342E),
              fontSize: 14,
              height: 1.5,
            ),
          ),
          const SizedBox(height: 24),
          _buildSectionHeader('Riwayat Transaksi'),
          const SizedBox(height: 16),
          _buildHistoryList(),
        ],
      ),
    );
  }

  // Simpanan Card
  Widget _buildSimpananCard(String title, String amount, Color borderColor, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 2),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.account_balance_wallet, size: 20, color: Colors.black),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            amount,
            style: const TextStyle(
              color: Colors.black, // ✅ Jadi warna hitam
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  // Section Header
  Widget _buildSectionHeader(String title) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFEEEEEE),
        borderRadius: BorderRadius.circular(8),
      ),
      alignment: Alignment.centerLeft,
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF4E342E),
          fontSize: 16,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  // History List
  Widget _buildHistoryList() {
    return Column(
      children: [
        _buildHistoryItem(
          'Setoran',
          'Rp. 100.000',
          '12 Mei 2025',
          const Color(0xFF4CAF50),
        ),
        _buildHistoryItem(
          'Setoran',
          'Rp. 100.000',
          '12 April 2025',
          const Color(0xFF4CAF50),
        ),
        _buildHistoryItem(
          'Setoran',
          'Rp. 100.000',
          '12 Maret 2025',
          const Color(0xFF4CAF50),
        ),
      ],
    );
  }

  // History Item
  Widget _buildHistoryItem(String type, String amount, String date, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.arrow_upward,
              color: color,
              size: 20,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  type,
                  style: const TextStyle(
                    color: Color(0xFF4E342E),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}