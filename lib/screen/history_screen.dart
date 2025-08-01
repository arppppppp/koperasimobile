import 'package:flutter/material.dart';
import 'homepage.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  
  // Filter options
  final List<String> _filterOptions = ['Semua', '1 Minggu', '1 Bulan', '3 Bulan'];
  String _selectedFilter = 'Semua';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Header
            _buildHeader(),
            
            // Filter & Search Section
            _buildFilterSection(),
            
            // Tab Bar
            Container(
              color: Colors.white,
              child: TabBar(
                controller: _tabController,
                labelColor: const Color(0xFF4E342E),
                unselectedLabelColor: Colors.grey,
                indicatorColor: const Color(0xFFFFDC16),
                indicatorWeight: 3,
                tabs: const [
                  Tab(text: 'Simpanan'),
                  Tab(text: 'Pinjaman'),
                ],
              ),
            ),
            
            // Tab Bar View
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Simpanan History
                  _buildSimpananHistory(),
                  
                  // Pinjaman History
                  _buildPinjamanHistory(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFFFFDC16),
      child: Row(
        children: [
          // Back Button
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const KoperasiApp()),
              );
            },
            child: Container(
              width: 36,
              height: 36,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Color(0xFF4E342E)),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const KoperasiApp()),
                        );
                      },
                      splashRadius: 24,
                    ),
            ),
          ),
          const SizedBox(width: 16),
          
          // Title
          const Text(
            'Riwayat Transaksi',
            style: TextStyle(
              color: Color(0xFF4E342E),
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      color: Colors.white,
      child: Column(
        children: [
          // Search Bar
          TextField(
            decoration: InputDecoration(
              hintText: 'Cari transaksi...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(vertical: 0),
              filled: true,
              fillColor: const Color(0xFFF5F5F5),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: const BorderSide(color: Color(0xFFFFDC16)),
              ),
            ),
          ),
          const SizedBox(height: 12),
          
          // Filter Options
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: _filterOptions.map((filter) {
                bool isSelected = _selectedFilter == filter;
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedFilter = filter;
                    });
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFFFDC16) : Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: isSelected ? const Color(0xFFFFDC16) : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      filter,
                      style: TextStyle(
                        color: isSelected ? const Color(0xFF4E342E) : Colors.grey,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSimpananHistory() {
    // Sample data for Simpanan transactions
    final List<Map<String, dynamic>> transactions = [
      {
        'date': '19 Mei 2025',
        'time': '10:30',
        'type': 'Simpanan Pokok',
        'amount': '+ Rp 100.000',
        'status': 'success',
        'description': 'Setoran rutin bulanan'
      },
      {
        'date': '15 Mei 2025',
        'time': '14:45',
        'type': 'Simpanan Sukarela',
        'amount': '+ Rp 500.000',
        'status': 'success',
        'description': 'Setoran tambahan'
      },
      {
        'date': '10 Mei 2025',
        'time': '09:15',
        'type': 'Simpanan Wajib',
        'amount': '+ Rp 200.000',
        'status': 'success',
        'description': 'Setoran rutin bulanan'
      },
      {
        'date': '05 Mei 2025',
        'time': '16:20',
        'type': 'Simpanan Sukarela',
        'amount': '- Rp 300.000',
        'status': 'warning',
        'description': 'Penarikan dana'
      },
      {
        'date': '28 Apr 2025',
        'time': '11:00',
        'type': 'Simpanan Wajib',
        'amount': '+ Rp 200.000',
        'status': 'success',
        'description': 'Setoran rutin bulanan'
      },
    ];

    return transactions.isEmpty
        ? _buildEmptyState('Tidak ada riwayat simpanan')
        : ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _buildTransactionCard(
                date: transaction['date'],
                time: transaction['time'],
                type: transaction['type'],
                amount: transaction['amount'],
                status: transaction['status'],
                description: transaction['description'],
              );
            },
          );
  }

  Widget _buildPinjamanHistory() {
    // Sample data for Pinjaman transactions
    final List<Map<String, dynamic>> transactions = [
      {
        'date': '17 Mei 2025',
        'time': '13:45',
        'type': 'Angsuran',
        'amount': 'Rp 2.000.000',
        'status': 'success',
        'description': 'Pembayaran angsuran bulan Mei'
      },
      {
        'date': '17 Apr 2025',
        'time': '14:30',
        'type': 'Angsuran',
        'amount': 'Rp 2.000.000',
        'status': 'success',
        'description': 'Pembayaran angsuran bulan April'
      },
      {
        'date': '15 Mar 2025',
        'time': '10:15',
        'type': 'Angsuran',
        'amount': 'Rp 2.000.000',
        'status': 'success',
        'description': 'Pembayaran angsuran bulan Maret'
      },
      {
        'date': '01 Mar 2025',
        'time': '09:00',
        'type': 'Pencairan',
        'amount': 'Rp 20.000.000',
        'status': 'info',
        'description': 'Pencairan pinjaman baru'
      },
    ];

    return transactions.isEmpty
        ? _buildEmptyState('Tidak ada riwayat pinjaman')
        : ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              final transaction = transactions[index];
              return _buildTransactionCard(
                date: transaction['date'],
                time: transaction['time'],
                type: transaction['type'],
                amount: transaction['amount'],
                status: transaction['status'],
                description: transaction['description'],
              );
            },
          );
  }

  Widget _buildTransactionCard({
    required String date,
    required String time,
    required String type,
    required String amount,
    required String status,
    required String description,
  }) {
    // Define colors based on status
    Color statusColor;
    IconData statusIcon;
    
    switch (status) {
      case 'success':
        statusColor = Colors.green;
        statusIcon = Icons.check_circle;
        break;
      case 'warning':
        statusColor = Colors.orange;
        statusIcon = Icons.warning_amber_rounded;
        break;
      case 'error':
        statusColor = Colors.red;
        statusIcon = Icons.error;
        break;
      case 'info':
        statusColor = Colors.blue;
        statusIcon = Icons.info;
        break;
      default:
        statusColor = Colors.grey;
        statusIcon = Icons.help;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status icon
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(statusIcon, color: statusColor, size: 24),
            ),
            const SizedBox(width: 12),
            
            // Transaction details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        type,
                        style: const TextStyle(
                          color: Color(0xFF4E342E),
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        amount,
                        style: TextStyle(
                          color: amount.contains('+') ? Colors.green : const Color(0xFF4E342E),
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: const TextStyle(
                      color: Colors.black87,
                      fontSize: 14,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        date,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.access_time, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        time,
                        style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
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
    );
  }

  Widget _buildEmptyState(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: 80,
            color: Colors.grey.shade400,
          ),
          const SizedBox(height: 16),
          Text(
            message,
            style: TextStyle(
              color: Colors.grey.shade600,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Transaksi Anda akan muncul di sini',
            style: TextStyle(
              color: Colors.grey.shade500,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}