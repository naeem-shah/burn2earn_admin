import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
        children: [
          Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://www.mockofun.com/wp-content/uploads/2019/12/circle-profile-pic.jpg",
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 4,
                    right: 2,
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.blue,
                      ),
                      padding: const EdgeInsets.all(4),
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 36,
          ),
          Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Full Name",
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Can't be empty";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Email",
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Can't be empty";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: const BorderSide(width: 1)),
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Can't be empty";
                  }
                  return null;
                },
                items: ["Male", "Female", "Others"]
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (String? value) {},
                hint: const Text("Select Gander"),
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Date of Birth",
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Can't be empty";
                  }
                  return null;
                },
                textInputAction: TextInputAction.next,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  hintText: "Language",
                  filled: true,
                  fillColor: Colors.white,
                ),
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Can't be empty";
                  }
                  return null;
                },
                textInputAction: TextInputAction.done,
              ),
            ],
          ),

          const SizedBox(height: 32,),

          SizedBox(
            width: MediaQuery.sizeOf(context).width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                fixedSize: const Size(double.infinity, 47),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                foregroundColor: Colors.white,
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
              onPressed: () {
              },
              child: const Text("Update Profile"),
            ),
          )
        ],
      ),
    );
  }
}
