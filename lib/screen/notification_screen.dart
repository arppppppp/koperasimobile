import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'homepage.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildAppBar(context),
            Expanded(
              child: _buildNotificationList(),
            ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFFFDC16),
      elevation: 0,
      toolbarHeight: 69,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: Color(0xFF4E342E)),
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const KoperasiApp()),
          );
        },
        splashRadius: 24,
      ),
      title: const Text(
        'Notifikasi',
        style: TextStyle(
          color: Color(0xFF4E342E),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget _buildNotificationList() {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildDateHeader('Hari Ini'),
        ...todayNotifications.map((notification) => 
          NotificationCard(notification: notification)),
        _buildDateHeader('Kemarin'),
        ...yesterdayNotifications.map((notification) => 
          NotificationCard(notification: notification)),
        const SizedBox(height: 16),
        const Center(
          child: Text(
            'v 1.0.0',
            style: TextStyle(
              color: Color(0xFF3E2723),
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildDateHeader(String date) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Text(
        date,
        style: const TextStyle(
          color: Color(0xFF4E342E),
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel notification;

  const NotificationCard({super.key, required this.notification});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFFF8E1), // latar kuning pucat, lebih jelas dari putih
        borderRadius: BorderRadius.circular(12),
    border: Border.all(
      color: const Color(0xFFFFECB3), // border lembut
      width: 1,
    ),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.08), // bayangan sedikit lebih gelap
        blurRadius: 6,
        offset: const Offset(0, 3),
      ),
    ],
  ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNotificationIcon(),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          notification.title,
                          style: const TextStyle(
                            color: Color(0xFF4E342E),
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          notification.time,
                          style: TextStyle(
                            color: const Color(0xFF3E2723).withOpacity(0.6),
                            fontSize: 10,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      notification.message,
                      style: const TextStyle(
                        color: Color(0xFF3E2723),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (notification.hasAction) ...[
                      const SizedBox(height: 12),
                      Row(
                      ),
                    ],
                    if (!notification.isRead) ...[
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          width: 8,
                          height: 8,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFFDC16),
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon() {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFFFDC16).withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(
        notification.type == NotificationType.payment
            ? Icons.payment
            : notification.type == NotificationType.savings
                ? Icons.savings
                : Icons.notifications,
        color: const Color(0xFF4E342E),
        size: 20,
      ),
    );
  }
}

// Enums
enum NotificationType { payment, savings, info }

// Model for notification data
class NotificationModel {
  final String title;
  final String message;
  final String time;
  final bool isRead;
  final NotificationType type;
  final bool hasAction;

  const NotificationModel({
    required this.title,
    required this.message,
    required this.time,
    this.isRead = true,
    required this.type,
    this.hasAction = false,
  });
}

// Sample notification data
final List<NotificationModel> todayNotifications = [
  const NotificationModel(
    title: 'Pembayaran Pinjaman',
    message: 'Anda berhasil melakukan pembayaran pinjaman sebesar Rp. 100.000',
    time: '07:00',
    isRead: false,
    type: NotificationType.payment,
    hasAction: true,
  ),
  const NotificationModel(
    title: 'Simpanan Sukarela',
    message: 'Anda berhasil menyimpan uang sukarela sebesar Rp. 200.000',
    time: '07:30',
    type: NotificationType.savings,
  ),
];

final List<NotificationModel> yesterdayNotifications = [
  const NotificationModel(
    title: 'Info Koperasi',
    message: 'Rapat anggota tahunan akan dilaksanakan pada tanggal 20 Mei 2025',
    time: '14:30',
    type: NotificationType.info,
    hasAction: true,
  ),
  const NotificationModel(
    title: 'Pinjaman Disetujui',
    message: 'Pengajuan pinjaman Anda sebesar Rp. 5.000.000 telah disetujui',
    time: '10:15',
    type: NotificationType.payment,
    hasAction: true,
  ),
];