import 'package:flutter/material.dart';
import 'homepage.dart';

class PinjamanScreen extends StatelessWidget {
  const PinjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC16),
        elevation: 0,
        title: const Text(
          'Pinjaman',
          style: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
            fontFamily: 'Poppins',
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
      body: const PinjamanContent(),
    );
  }
}

class PinjamanContent extends StatefulWidget {
  const PinjamanContent({super.key});

  @override
  State<PinjamanContent> createState() => _PinjamanContentState();
}

class _PinjamanContentState extends State<PinjamanContent> with SingleTickerProviderStateMixin {
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
    return Column(
      children: [
        // User loan summary card
        const UserLoanSummaryCard(),
        
        // Loan Types Tab Bar
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: const Color(0xFFFFDC16),
            indicatorWeight: 3,
            labelColor: const Color(0xFF4E342E),
            unselectedLabelColor: Colors.grey,
            labelStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
            tabs: const [
              Tab(
                icon: Icon(Icons.account_balance),
                text: 'Reguler',
              ),
              Tab(
                icon: Icon(Icons.store),
                text: 'Usaha',
              ),
              Tab(
                icon: Icon(Icons.shopping_cart),
                text: 'Barang',
              ),
            ],
          ),
        ),
        
        // Tab content
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: const [
              // Reguler loan tab
              RegulerLoanContent(),
              
              // Usaha loan tab
              UsahaLoanContent(),
              
              // Barang loan tab
              BarangLoanContent(),
            ],
          ),
        ),
      ],
    );
  }
}

class RegulerLoanContent extends StatelessWidget {
  const RegulerLoanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDC16).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.account_balance,
                    color: Color(0xFF4E342E),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pinjaman Reguler',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Cicilan tetap, bunga rendah',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Info card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF4E342E)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Pinjaman reguler dengan suku bunga tetap 0.8% per bulan, tenor hingga 24 bulan',
                    style: TextStyle(
                      color: Color(0xFF4E342E),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Section divider
          const SectionDivider(title: 'Riwayat Pinjaman Reguler'),
          
          // Loan history items
          const LoanHistoryItem(
            remainingAmount: '1.100.000',
            paymentAmount: '100.000',
            paymentDate: '20 Oktober 2024',
            remainingMonths: 11,
            isCompleted: false,
            loanType: 'Reguler',
          ),
          
          const SizedBox(height: 16),
          
          const LoanHistoryItem(
            remainingAmount: '0',
            paymentAmount: '200.000',
            paymentDate: '20 Oktober 2024',
            remainingMonths: 0,
            isCompleted: true,
            loanType: 'Reguler',
          ),
          
          const SizedBox(height: 16),
          
          // Total loan summary card
          const TotalLoanSummaryCard(
            totalAmount: '1.000.000',
            duration: '10 Bulan',
            loanType: 'Reguler',
            interestRate: '0.8% per bulan',
          ),
          
          // Apply for new loan button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFDC16),
                foregroundColor: const Color(0xFF4E342E),
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Ajukan Pinjaman Baru',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          
          // Extra space for bottom navigation bar
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class UsahaLoanContent extends StatelessWidget {
  const UsahaLoanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF43A047).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.store,
                    color: Color.fromARGB(255, 255, 255, 255),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pinjaman Usaha',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Untuk pengembangan usaha anggota',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Info card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.green.shade200),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF2E7D32)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Pinjaman khusus untuk pengembangan usaha dengan suku bunga 0.5% per bulan, tenor hingga 36 bulan',
                    style: TextStyle(
                      color: Color(0xFF2E7D32),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Section divider
          const SectionDivider(title: 'Riwayat Pinjaman Usaha'),
          
          // Loan history item
          const LoanHistoryItem(
            remainingAmount: '4.500.000',
            paymentAmount: '500.000',
            paymentDate: '15 Oktober 2024',
            remainingMonths: 9,
            isCompleted: false,
            loanType: 'Usaha',
          ),
          
          const SizedBox(height: 16),
          
          // Total loan summary card
          const TotalLoanSummaryCard(
            totalAmount: '5.000.000',
            duration: '10 Bulan',
            loanType: 'Usaha',
            interestRate: '0.5% per bulan',
          ),
          
          // Apply for new loan button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF43A047),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Ajukan Pinjaman Usaha',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          
          // Extra space for bottom navigation bar
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class BarangLoanContent extends StatelessWidget {
  const BarangLoanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E88E5).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.shopping_cart,
                    color: Color(0xFF1565C0),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pinjaman Barang',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Kredit barang kebutuhan',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Info card
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.blue.shade200),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF1565C0)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Cicilan pembelian barang elektronik, furnitur, dan kebutuhan lainnya dengan tenor hingga 12 bulan',
                    style: TextStyle(
                      color: Color(0xFF1565C0),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          // Section divider
          const SectionDivider(title: 'Riwayat Pinjaman Barang'),
          
          // Loan history item
          const LoanHistoryItem(
            remainingAmount: '2.400.000',
            paymentAmount: '300.000',
            paymentDate: '5 Oktober 2024',
            remainingMonths: 8,
            isCompleted: false,
            loanType: 'Barang',
            itemName: 'Laptop Acer Aspire 3',
          ),
          
          const SizedBox(height: 16),
          
          // Total loan summary card
          const TotalLoanSummaryCard(
            totalAmount: '2.700.000',
            duration: '9 Bulan',
            loanType: 'Barang',
            interestRate: '1% per bulan',
            itemName: 'Laptop Acer Aspire 3',
          ),
          
          // Available items section
          const SectionDivider(title: 'Barang Tersedia'),
          
          // Available items grid
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 0.8,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              children: const [
                AvailableItemCard(
                  name: 'Laptop',
                  price: 'Rp 6.000.000',
                  imageIcon: Icons.laptop_mac,
                ),
                AvailableItemCard(
                  name: 'Smartphone',
                  price: 'Rp 3.500.000',
                  imageIcon: Icons.smartphone,
                ),
                AvailableItemCard(
                  name: 'Kulkas',
                  price: 'Rp 2.500.000',
                  imageIcon: Icons.kitchen,
                ),
                AvailableItemCard(
                  name: 'AC',
                  price: 'Rp 4.000.000',
                  imageIcon: Icons.ac_unit,
                ),
              ],
            ),
          ),
          
          // Apply for new loan button
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1E88E5),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Ajukan Kredit Barang',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          
          // Extra space for bottom navigation bar
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}

class AvailableItemCard extends StatelessWidget {
  final String name;
  final String price;
  final IconData imageIcon;
  
  const AvailableItemCard({
    super.key,
    required this.name,
    required this.price,
    required this.imageIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Item image
          Container(
            height: 100,
            decoration: BoxDecoration(
              color: const Color(0xFFE3F2FD),
              borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
              border: Border.all(color: Colors.blue.shade100),
            ),
            child: Center(
              child: Icon(
                imageIcon,
                size: 48,
                color: const Color(0xFF1565C0),
              ),
            ),
          ),
          
          // Item details
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 4),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF1565C0),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1E88E5),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      textStyle: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                      ),
                    ),
                    child: const Text('Ajukan'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserLoanSummaryCard extends StatelessWidget {
  const UserLoanSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFCCCCCC)),
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
          // User info section
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                // User avatar
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0x66FFDC16),
                    shape: BoxShape.circle,
                  ),
                  child: const Center(
                    child: Icon(
                      Icons.person,
                      color: Color(0xFF4E342E),
                      size: 30,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // User details
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Ujang Pedro',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Pinjaman',
                      style: TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 16,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          const Divider(height: 1, thickness: 1, color: Color(0xFFCCCCCC)),
          
          // NIP section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  'NIP',
                  style: TextStyle(
                    color: Color(0xFF3E2723),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  '123456789',
                  style: TextStyle(
                    color: Color(0xFF3E2723),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1, thickness: 1, color: Color(0xFFCCCCCC)),
          
          // Loan summary section with different types
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              children: [
                const Row(
                  children: [
                    Text(
                      'Total Semua Pinjaman',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Spacer(),
                    Text(
                      'Rp. 8.000.000',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
                
                const SizedBox(height: 12),
                
                // Loan types breakdown
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      // Reguler loan
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFFFFDC16),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Pinjaman Reguler',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Rp. 1.100.000',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Usaha loan
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF43A047),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Pinjaman Usaha',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Rp. 4.500.000',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 8),
                      
                      // Barang loan
                      Row(
                        children: [
                          Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: Color(0xFF1E88E5),
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'Pinjaman Barang',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'Rp. 2.400.000',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          const Divider(height: 1, thickness: 1, color: Color(0xFFCCCCCC)),
          
          // Remaining loan section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                const Text(
                  'Sisa Pinjaman (Total)',
                  style: TextStyle(
                    color: Color(0xFF3E2723),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF0F0),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    'Rp. 8.000.000',
                    style: TextStyle(
                      color: Color(0xFFE53935),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SectionDivider extends StatelessWidget {
  final String title;
  
  const SectionDivider({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: const Color(0xFFEEEEEE),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF4E342E),
          fontSize: 16,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class LoanHistoryItem extends StatelessWidget {
  final String remainingAmount;
  final String paymentAmount;
  final String paymentDate;
  final int remainingMonths;
  final bool isCompleted;
  final String loanType;
  final String? itemName;  // Optional for barang loans

  const LoanHistoryItem({
    super.key, 
    required this.remainingAmount, 
    required this.paymentAmount,
    required this.paymentDate,
    required this.remainingMonths,
    required this.isCompleted,
    required this.loanType,
    this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    // Set color based on loan type
    Color statusColor;
    Color circleColor;
    IconData typeIcon;
    
    switch (loanType) {
      case 'Usaha':
        statusColor = isCompleted ? const Color(0xFF4CAF50) : const Color.fromARGB(255, 255, 1, 1);
        circleColor = const Color.fromARGB(255, 255, 1, 1);
        typeIcon = Icons.store;
        break;
      case 'Barang':
        statusColor = isCompleted ? const Color(0xFF4CAF50) : const Color.fromARGB(255, 255, 1, 1);
        circleColor = const Color.fromARGB(255, 255, 1, 1);
        typeIcon = Icons.shopping_cart;
        break;
      case 'Reguler':
      default:
        statusColor = isCompleted ? const Color(0xFF4CAF50) : const Color.fromARGB(255, 255, 1, 1);
        circleColor = const Color.fromARGB(255, 255, 1, 1);
        typeIcon = Icons.account_balance;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Status indicator
          Positioned(
            top: 12,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: isCompleted 
                  ? const Color(0xFFE8F5E9) 
                  : const Color(0xFFFFF0F0),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                isCompleted ? 'Lunas' : 'Belum',
                style: TextStyle(
                  color: isCompleted 
                    ? const Color(0xFF4CAF50) 
                    : statusColor,
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          
          // Loan type indicator
          Positioned(
            top: 40,
            right: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: loanType == 'Reguler' 
                  ? const Color(0xFFFFF9C4) 
                  : loanType == 'Usaha' 
                    ? const Color(0xFFE8F5E9) 
                    : const Color(0xFFE3F2FD),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: loanType == 'Reguler' 
                    ? const Color(0xFFFFDC16) 
                    : loanType == 'Usaha' 
                      ? const Color(0xFF43A047) 
                      : const Color(0xFF1E88E5),
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Icon(
                    typeIcon,
                    size: 12,
                    color: loanType == 'Reguler' 
                      ? const Color(0xFF4E342E) 
                      : loanType == 'Usaha' 
                        ? const Color(0xFF2E7D32) 
                        : const Color(0xFF1565C0),
                  ),
                  const SizedBox(width: 4),
                  Text(
                    loanType,
                    style: TextStyle(
                      color: loanType == 'Reguler' 
                        ? const Color(0xFF4E342E) 
                        : loanType == 'Usaha' 
                          ? const Color(0xFF2E7D32) 
                          : const Color(0xFF1565C0),
                      fontSize: 10,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          // Main content
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Months indicator
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFEF),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isCompleted
                        ? const Color(0xFF4CAF50)
                        : circleColor,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          remainingMonths.toString(),
                          style: const TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 18,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          'Bulan',
                          style: TextStyle(
                            color: Color(0xFF1A1A1A),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(width: 16),
                
                // Payment details
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (itemName != null) ...[
                        Row(
                          children: [
                            const Icon(
                              Icons.shopping_basket,
                              size: 16,
                              color: Color(0xFF1565C0),
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: Text(
                                itemName!,
                                style: const TextStyle(
                                  color: Color(0xFF1565C0),
                                  fontSize: 14,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                      ],
                      Row(
                        children: [
                          const Icon(
                            Icons.account_balance_wallet,
                            size: 16,
                            color: Color(0xFF3E2723),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Sisa: Rp. $remainingAmount',
                            style: const TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.payment,
                            size: 16,
                            color: Color(0xFF3E2723),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Bayar: Rp. $paymentAmount',
                            style: const TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            size: 16,
                            color: Color(0xFF3E2723),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            paymentDate,
                            style: const TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TotalLoanSummaryCard extends StatelessWidget {
  final String totalAmount;
  final String duration;
  final String loanType;
  final String interestRate;
  final String? itemName;  // Optional for barang loans

  const TotalLoanSummaryCard({
    super.key, 
    required this.totalAmount, 
    required this.duration,
    required this.loanType,
    required this.interestRate,
    this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    // Set color based on loan type
    Color backgroundColor;
    Color iconColor;
    Color borderColor;
    IconData typeIcon;
    
    switch (loanType) {
      case 'Usaha':
        backgroundColor = const Color(0xFFE8F5E9);
        iconColor = const Color(0xFF2E7D32);
        borderColor = const Color(0xFF43A047).withOpacity(0.3);
        typeIcon = Icons.store;
        break;
      case 'Barang':
        backgroundColor = const Color(0xFFE3F2FD);
        iconColor = const Color(0xFF1565C0);
        borderColor = const Color(0xFF1E88E5).withOpacity(0.3);
        typeIcon = Icons.shopping_cart;
        break;
      case 'Reguler':
      default:
        backgroundColor = const Color(0xFFFAF3E0);
        iconColor = const Color(0xFF4E342E);
        borderColor = const Color(0xFFFFDC16).withOpacity(0.3);
        typeIcon = Icons.account_balance;
        break;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Loan icon
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: loanType == 'Reguler' 
                ? const Color(0xFFFFDC16).withOpacity(0.2)
                : loanType == 'Usaha'
                  ? const Color(0xFF43A047).withOpacity(0.2)
                  : const Color(0xFF1E88E5).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Icon(
                typeIcon,
                size: 30,
                color: iconColor,
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Loan summary
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Total Pinjaman $loanType',
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (itemName != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    itemName!,
                    style: const TextStyle(
                      color: Color(0xFF1565C0),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 4),
                Text(
                  'Rp. $totalAmount',
                  style: const TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 18,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(
                      Icons.access_time,
                      size: 16,
                      color: Color(0xFF3E2723),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Waktu: $duration',
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Icon(
                      Icons.percent,
                      size: 16,
                      color: Color(0xFF3E2723),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Bunga: $interestRate',
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}