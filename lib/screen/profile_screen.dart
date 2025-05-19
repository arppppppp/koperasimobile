import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final emailController = TextEditingController(text: 'user@contoh.com');
  final alamatController = TextEditingController(text: 'Jl. Contoh No.123');
  final telpController   = TextEditingController(text: '08123456789');

  bool isEditing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          children: [
            // ---------------- APP BAR ----------------
            Container(
              color: const Color(0xFFFFDC16),
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
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ---------------- FOTO PROFIL ----------------
            Stack(
              clipBehavior: Clip.none,
              children: [
                InkWell(
                  onTap: () => Navigator.pop(context),
                  borderRadius: BorderRadius.circular(50),
                  child: const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                ),
                // ikon kamera di pojok kanan‑bawah
                Positioned(
                  right: -2,
                  bottom: -2,
                  child: CircleAvatar(
                    radius: 18,
                    backgroundColor: const Color(0xFFFFDC16),
                    child: const Icon(Icons.camera_alt,
                        size: 18, color: Colors.black),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // ---------------- BADAN YANG BISA SCROLL ----------------
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 24),
                child: _profileCard(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ---------------- WIDGET KARTU PROFIL ----------------
  Widget _profileCard(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER + TOMBOL EDIT / CLOSE
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Data Profil',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              IconButton(
                icon: Icon(isEditing ? Icons.close : Icons.edit,
                    color: Colors.grey[700]),
                onPressed: () => setState(() => isEditing = !isEditing),
              )
            ],
          ),
          const Divider(),

          _staticText('Nama', 'Ujang Pedro'),
          _staticText('NIP', '123456789'),
          _staticText('Jenis Kelamin', 'Laki-laki'),
          const Divider(),

          _editableField(
              label: 'Email', controller: emailController, enabled: isEditing),
          const Divider(),

          _editableField(
              label: 'Alamat', controller: alamatController, enabled: isEditing),
          const Divider(),

          _editableField(
              label: 'No Telp', controller: telpController, enabled: isEditing),
          const Divider(),

          _staticText('Tanggal Daftar', '01 Januari 2024'),

          // ---------- TOMBOL KONFIRMASI ----------
          if (isEditing)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFFDC16),
                      foregroundColor: Colors.black),
                  onPressed: () {
                    // TODO: simpan ke backend
                    setState(() => isEditing = false);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Perubahan profil berhasil disimpan')));
                  },
                  child: const Text('Konfirmasi Perubahan'),
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ---------------- UTILITAS ----------------
  Widget _editableField(
      {required String label,
      required TextEditingController controller,
      required bool enabled}) {
    return enabled
        ? TextField(
            controller: controller,
            decoration: InputDecoration(labelText: label, isDense: true),
          )
        : _staticText(label, controller.text);
  }

  // ••• LABEL–VALUE RAPI DUA KOLOM •••
  Widget _staticText(String label, String value) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 110, // lebar kolom label (atur sesuai kebutuhan)
              child: Text(label,
                  style: const TextStyle(fontWeight: FontWeight.w500)),
            ),
            const Text(' : '),
            Expanded(
              child: Text(value,
                  style: const TextStyle(fontWeight: FontWeight.w400)),
            ),
          ],
        ),
      );
}
