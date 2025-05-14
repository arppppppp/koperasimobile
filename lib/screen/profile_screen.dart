import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController emailController = TextEditingController(text: 'user@contoh.com');
  final TextEditingController alamatController = TextEditingController(text: 'Jl. Contoh No.123');
  final TextEditingController telpController = TextEditingController(text: '08123456789');

  bool isEditingEmail = false;
  bool isEditingAlamat = false;
  bool isEditingTelp = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // AppBar Custom
            Container(
              color: Colors.yellow[700],
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  InkWell(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Profile',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Foto Profil
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, size: 50, color: Colors.white),
                ),
                Positioned(
                  bottom: 4,
                  child: CircleAvatar(
                    radius: 15,
                    backgroundColor: Colors.yellow[700],
                    child: const Icon(Icons.camera_alt, size: 16, color: Colors.black),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Kartu Data Profil
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Nama : Ujang Pucung'),
                    const Divider(),
                    const Text('NIP : 1234567890'),
                    const Divider(),
                    const Text('Jenis Kelamin : Laki-laki'),
                    const Divider(),

                    _buildEditableField(
                      label: 'Email',
                      controller: emailController,
                      isEditing: isEditingEmail,
                      onEdit: () => setState(() => isEditingEmail = !isEditingEmail),
                    ),
                    const Divider(),

                    _buildEditableField(
                      label: 'Alamat',
                      controller: alamatController,
                      isEditing: isEditingAlamat,
                      onEdit: () => setState(() => isEditingAlamat = !isEditingAlamat),
                    ),
                    const Divider(),

                    _buildEditableField(
                      label: 'No Telp',
                      controller: telpController,
                      isEditing: isEditingTelp,
                      onEdit: () => setState(() => isEditingTelp = !isEditingTelp),
                    ),
                    const Divider(),

                    const Text('Tanggal Daftar : 01 Januari 2024'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEditableField({
    required String label,
    required TextEditingController controller,
    required bool isEditing,
    required VoidCallback onEdit,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: isEditing
              ? TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    labelText: label,
                    isDense: true,
                    contentPadding: const EdgeInsets.symmetric(vertical: 4),
                  ),
                )
              : Text('$label : ${controller.text}'),
        ),
        IconButton(
          icon: Icon(isEditing ? Icons.check : Icons.edit, size: 18),
          onPressed: onEdit,
          color: Colors.grey[700],
        ),
      ],
    );
  }
}
