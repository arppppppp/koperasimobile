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

class PinjamanContent extends StatelessWidget {
  const PinjamanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User loan summary card
          const UserLoanSummaryCard(),
          
          // Section divider
          const SectionDivider(title: 'Riwayat Pinjaman'),
          
          // Loan history items
          const LoanHistoryItem(
            remainingAmount: '1.100.000',
            paymentAmount: '100.000',
            paymentDate: '20 Oktober 2024',
            remainingMonths: 11,
            isCompleted: false,
          ),
          
          const SizedBox(height: 16),
          
          const LoanHistoryItem(
            remainingAmount: '0',
            paymentAmount: '200.000',
            paymentDate: '20 Oktober 2024',
            remainingMonths: 0,
            isCompleted: true,
          ),
          
          const SizedBox(height: 16),
          
          // Total loan summary card
          const TotalLoanSummaryCard(
            totalAmount: '1.000.000',
            duration: '10 Bulan',
          ),
          
          // Extra space for bottom navigation bar
          const SizedBox(height: 24),
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
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
          
          // Total loan section
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Text(
                  'Total Pinjaman',
                  style: TextStyle(
                    color: Color(0xFF3E2723),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Text(
                  'Rp. 1.200.000',
                  style: TextStyle(
                    color: Color(0xFF3E2723),
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
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
                  'Sisa Pinjaman (Terkini)',
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
                    'Rp. 1.100.000',
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

  const LoanHistoryItem({
    super.key, 
    required this.remainingAmount, 
    required this.paymentAmount,
    required this.paymentDate,
    required this.remainingMonths,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
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
                    : const Color(0xFFFFB84D),
                  fontSize: 12,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
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
                        : const Color(0xFFFFB84D),
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

  const TotalLoanSummaryCard({
    super.key, 
    required this.totalAmount, 
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFAF3E0),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFDC16).withOpacity(0.3)),
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
              color: const Color(0xFFFFDC16).withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.account_balance,
                size: 30,
                color: Color(0xFF4E342E),
              ),
            ),
          ),
          
          const SizedBox(width: 16),
          
          // Loan summary
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Total Meminjam',
                  style: TextStyle(
                    color: Color(0xFF1A1A1A),
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
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
                      'Waktu Pembayaran: $duration',
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