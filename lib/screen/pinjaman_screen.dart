import 'package:flutter/material.dart';

class PinjamanScreen extends StatelessWidget {
  const PinjamanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFDC16),
        elevation: 0,
        title: const Text(
          'Pinjaman',
          style: TextStyle(
            color: Color(0xFF4E342E),
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
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

class _PinjamanContentState extends State<PinjamanContent>
    with SingleTickerProviderStateMixin {
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
              Tab(icon: Icon(Icons.account_balance), text: 'Reguler'),
              Tab(icon: Icon(Icons.store), text: 'Usaha'),
              Tab(icon: Icon(Icons.shopping_cart), text: 'Barang'),
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

// Update the LoanHistoryItem class to include a detail dialog
class LoanHistoryItem extends StatelessWidget {
  final String remainingAmount;
  final String paymentAmount;
  final String paymentDate;
  final int remainingMonths;
  final bool isCompleted;
  final String loanType;
  final String? itemName;

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
      child: Column(
        children: [
          // Header section
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color:
                  isCompleted ? Colors.green.shade50 : const Color(0xFFFFF9C4),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              border: Border(
                bottom: BorderSide(
                  color:
                      isCompleted
                          ? Colors.green.shade200
                          : const Color(0xFFFFDC16).withOpacity(0.5),
                ),
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color:
                        isCompleted
                            ? Colors.green.withOpacity(0.2)
                            : const Color(0xFFFFDC16).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isCompleted
                        ? Icons.check_circle
                        : getIconForLoanType(loanType),
                    color: isCompleted ? Colors.green : const Color(0xFF4E342E),
                    size: 16,
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pinjaman $loanType',
                      style: const TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (itemName != null)
                      Text(
                        itemName!,
                        style: const TextStyle(
                          color: Color(0xFF4E342E),
                          fontSize: 12,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color:
                        isCompleted
                            ? Colors.green.withOpacity(0.1)
                            : Colors.orange.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                    border: Border.all(
                      color: isCompleted ? Colors.green : Color(0xFFEF5350),
                      width: 1,
                    ),
                  ),

                  child: Text(
                    isCompleted ? 'Selesai' : 'Belum Lunas',
                    style: TextStyle(
                      color: isCompleted ? Colors.green : Color(0xFFEF5350),
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loan details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Remaining amount row
                Row(
                  children: [
                    const Text(
                      'Sisa Pinjaman',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Rp. $remainingAmount',
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Payment amount row
                Row(
                  children: [
                    const Text(
                      'Cicilan per Bulan',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Rp. $paymentAmount',
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Last payment date row
                Row(
                  children: [
                    const Text(
                      'Tanggal Pembayaran',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      paymentDate,
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Remaining months row
                Row(
                  children: [
                    const Text(
                      'Sisa Tenor',
                      style: TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '$remainingMonths Bulan',
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),

                if (!isCompleted) ...[
                  const SizedBox(height: 16),

                  // Progress bar
                  Column(
                    children: [
                      LinearProgressIndicator(
                        value:
                            1 -
                            (remainingMonths /
                                12), // Assuming 12 months total tenor
                        backgroundColor: Colors.grey.shade200,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          const Color(0xFFFFDC16),
                        ),
                        minHeight: 8,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Progres: ${(100 - (remainingMonths / 12 * 100)).round()}%',
                            style: const TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          const Text(
                            '100%',
                            style: TextStyle(
                              color: Color(0xFF3E2723),
                              fontSize: 12,
                              fontFamily: 'Poppins',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ],
            ),
          ),

          // Buttons row
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {
                      // Show the detail dialog when the button is pressed
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return LoanDetailDialog(
                            loanType: loanType,
                            remainingAmount: remainingAmount,
                            paymentAmount: paymentAmount,
                            paymentDate: paymentDate,
                            remainingMonths: remainingMonths,
                            isCompleted: isCompleted,
                            itemName: itemName,
                          );
                        },
                      );
                    },
                    style: OutlinedButton.styleFrom(
                      foregroundColor: const Color(0xFF4E342E),
                      side: const BorderSide(color: Color(0xFFFFDC16)),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Detail',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
                if (!isCompleted) ...[const SizedBox(width: 12)],
              ],
            ),
          ),
        ],
      ),
    );
  }

  IconData getIconForLoanType(String type) {
    switch (type) {
      case 'Reguler':
        return Icons.account_balance;
      case 'Usaha':
        return Icons.store;
      case 'Barang':
        return Icons.shopping_cart;
      default:
        return Icons.monetization_on;
    }
  }
}

// New Dialog class for loan details
class LoanDetailDialog extends StatelessWidget {
  final String loanType;
  final String remainingAmount;
  final String paymentAmount;
  final String paymentDate;
  final int remainingMonths;
  final bool isCompleted;
  final String? itemName;

  const LoanDetailDialog({
    super.key,
    required this.loanType,
    required this.remainingAmount,
    required this.paymentAmount,
    required this.paymentDate,
    required this.remainingMonths,
    required this.isCompleted,
    this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    // Calculate total duration and progress
    final totalMonths =
        remainingMonths +
        (12 - remainingMonths); // Assuming 12 months total for simplicity
    final progress = (totalMonths - remainingMonths) / totalMonths;

    // Calculate next payment date (simple example)
    final currentDate = DateTime.now();
    final nextPaymentDate = DateTime(
      currentDate.year,
      currentDate.month + 1,
      20,
    );
    final formattedNextPayment =
        "${nextPaymentDate.day} ${getMonthName(nextPaymentDate.month)} ${nextPaymentDate.year}";

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with close button
            Row(
              children: [
                Icon(
                  getIconForLoanType(loanType),
                  color: const Color(0xFF4E342E),
                  size: 24,
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Detail Pinjaman $loanType',
                      style: const TextStyle(
                        color: Color(0xFF4E342E),
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    if (itemName != null)
                      Text(
                        itemName!,
                        style: const TextStyle(
                          color: Color(0xFF4E342E),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                  ],
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF4E342E)),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Status indicator
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color:
                    isCompleted
                        ? Colors.green.withOpacity(0.1)
                        : const Color(0xFFFFF9C4),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: isCompleted ? Colors.green : const Color(0xFFFFDC16),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    isCompleted ? Icons.check_circle : Icons.timelapse,
                    color: isCompleted ? Colors.green : const Color(0xFF4E342E),
                    size: 18,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isCompleted ? 'Lunas' : 'Sedang Berjalan',
                    style: TextStyle(
                      color:
                          isCompleted ? Colors.green : const Color(0xFF4E342E),
                      fontSize: 14,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Detailed information
            const Text(
              'Informasi Pinjaman',
              style: TextStyle(
                color: Color(0xFF4E342E),
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
              ),
            ),

            const SizedBox(height: 16),

            // Details table
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildDetailRow(
                    'Total Pinjaman',
                    'Rp. ${(int.parse(remainingAmount.replaceAll('.', '')) + int.parse(paymentAmount.replaceAll('.', '')) * (totalMonths - remainingMonths)).toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.')}',
                    false,
                  ),
                  _buildDetailRow(
                    'Sisa Pinjaman',
                    'Rp. $remainingAmount',
                    false,
                  ),
                  _buildDetailRow(
                    'Cicilan per Bulan',
                    'Rp. $paymentAmount',
                    false,
                  ),
                  _buildDetailRow('Total Tenor', '$totalMonths Bulan', false),
                  _buildDetailRow(
                    'Sisa Tenor',
                    '$remainingMonths Bulan',
                    false,
                  ),
                  _buildDetailRow('Tanggal Pembayaran', paymentDate, false),
                  _buildDetailRow(
                    'Pembayaran Selanjutnya',
                    formattedNextPayment,
                    true,
                  ),
                ],
              ),
            ),

            if (!isCompleted) ...[
              const SizedBox(height: 24),

              // Payment progress
              const Text(
                'Progres Pembayaran',
                style: TextStyle(
                  color: Color(0xFF4E342E),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),

              const SizedBox(height: 12),

              Column(
                children: [
                  LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey.shade200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      const Color(0xFFFFDC16),
                    ),
                    minHeight: 10,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Progres: ${(progress * 100).round()}%',
                        style: const TextStyle(
                          color: Color(0xFF3E2723),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        '${totalMonths - remainingMonths}/$totalMonths Cicilan',
                        style: const TextStyle(
                          color: Color(0xFF3E2723),
                          fontSize: 14,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],

            const SizedBox(height: 24),

            // Action buttons
            Row(
              children: [
                if (!isCompleted)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Close dialog and navigate to payment screen (would be implemented separately)
                        Navigator.of(context).pop();
                        // Additional navigation logic would go here
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFFFDC16),
                        foregroundColor: const Color(0xFF4E342E),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Bayar Cicilan',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ),
                if (!isCompleted) const SizedBox(width: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String label, String value, bool isLast) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border:
            isLast
                ? null
                : Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Color(0xFF3E2723),
              fontSize: 14,
              fontFamily: 'Poppins',
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              color: Color(0xFF3E2723),
              fontSize: 14,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  IconData getIconForLoanType(String type) {
    switch (type) {
      case 'Reguler':
        return Icons.account_balance;
      case 'Usaha':
        return Icons.store;
      case 'Barang':
        return Icons.shopping_cart;
      default:
        return Icons.monetization_on;
    }
  }

  String getMonthName(int month) {
    const months = [
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember',
    ];
    return months[month - 1];
  }
}

class RegulerLoanContent extends StatelessWidget {
  const RegulerLoanContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
            paymentAmount: '00.000',
            paymentDate: '20 Oktober 2024',
            remainingMonths: 0,
            isCompleted: true,
            loanType: 'Reguler',
          ),
          
          const SizedBox(height: 16),
          
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
                    color: const Color(0xFFFFDC16).withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.store,
                    color: Color(0xFF4E342E),
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
              color: const Color(0xFFFFF9C4),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFFFDC16).withOpacity(0.5)),
            ),
            child: const Row(
              children: [
                Icon(Icons.info_outline, color: Color(0xFF4E342E)),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Pinjaman khusus untuk pengembangan usaha dengan suku bunga 0.5% per bulan, tenor hingga 36 bulan',
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              color: const Color(0xFFFFF9C4),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              border: Border.all(
                color: const Color(0xFFFFDC16).withOpacity(0.5),
              ),
            ),
            child: Center(
              child: Icon(imageIcon, size: 48, color: const Color(0xFF4E342E)),
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
                    color: Color(0xFF4E342E),
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
                      backgroundColor: const Color(0xFFFFDC16),
                      foregroundColor: const Color(0xFF4E342E),
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
                              color: Color(0xFFFFDC16),
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
                              color: Color(0xFFFFDC16),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFDC16),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: const Text(
                    'Rp. 8.000.000',
                    style: TextStyle(
                      color: Color(0xFF4E342E),
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
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF4E342E),
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: Container(height: 1, color: Colors.grey.shade300)),
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
  final String? itemName;

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
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECB3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFFFDC16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                Icons.info_outline,
                color: Color(0xFF4E342E),
                size: 18,
              ),
              const SizedBox(width: 8),
              Text(
                'Info Pinjaman $loanType',
                style: const TextStyle(
                  color: Color(0xFF4E342E),
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          if (itemName != null) ...[
            const SizedBox(height: 8),
            Text(
              itemName!,
              style: const TextStyle(
                color: Color(0xFF4E342E),
                fontSize: 14,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],

          const SizedBox(height: 12),

          // Total amount row
          Row(
            children: [
              const Text(
                'Total Pinjaman',
                style: TextStyle(
                  color: Color(0xFF3E2723),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Text(
                'Rp. $totalAmount',
                style: const TextStyle(
                  color: Color(0xFF3E2723),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Duration row
          Row(
            children: [
              const Text(
                'Tenor',
                style: TextStyle(
                  color: Color(0xFF3E2723),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Text(
                duration,
                style: const TextStyle(
                  color: Color(0xFF3E2723),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),

          const SizedBox(height: 8),

          // Interest rate row
          Row(
            children: [
              const Text(
                'Bunga',
                style: TextStyle(
                  color: Color(0xFF3E2723),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                ),
              ),
              const Spacer(),
              Text(
                interestRate,
                style: const TextStyle(
                  color: Color(0xFF3E2723),
                  fontSize: 14,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
