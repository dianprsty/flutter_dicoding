import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/core/widgets/add_contact.dart';
import 'package:submission_flutter_pemula/core/widgets/contact_list.dart';
import 'package:submission_flutter_pemula/core/widgets/edit_contact.dart';
import 'package:submission_flutter_pemula/model/contact_model.dart';
import 'package:submission_flutter_pemula/screen/login_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ContactModel> contactList = [
    ContactModel(id: 1, name: "Dian Prasetyo", number: "08123456789"),
    ContactModel(
        id: 2,
        name: "Grizzly Pradipta Singhasana Enshito",
        number: "08123498759"),
    ContactModel(id: 3, name: "Mokhamad Susmana", number: "081234657400"),
    ContactModel(id: 3, name: "Alexander Graham Bell", number: "0812346432234"),
  ];
  List<ContactModel> displayedList = [];

  @override
  void initState() {
    displayedList = contactList;
    super.initState();
  }

  void _searchHandler(value) {
    setState(() {
      displayedList = contactList
          .where((contact) =>
              contact.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  void _handleEdit(ContactModel contact) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return EditContact(
          editContact: (ContactModel contact) {
            setState(() {});
          },
          contact: contact,
        );
      },
    );
  }

  void _handleDelete(ContactModel contact) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Hapus Kontak",
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Apakah anda yakin ingin menghapus ${contact.name} dari kontak anda?",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    contactList.remove(contact);
                    displayedList.remove(contact);
                  });
                  Navigator.pop(context);
                },
                child: const Text("Ya"),
              ),
            ],
          );
        });
  }

  void _handleLogout() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            title: const Text(
              "Keluar",
              textAlign: TextAlign.center,
            ),
            content: const Text(
              "Apakah anda yakin ingin keluar aplikasi?",
              textAlign: TextAlign.center,
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Tidak"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text("Ya"),
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Contact App"),
        centerTitle: true,
        backgroundColor: Colors.black,
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        actions: [
          IconButton(
            onPressed: _handleLogout,
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return AddContact(
                addContact: (ContactModel contact) {
                  setState(() {
                    contactList.add(contact);
                    displayedList = contactList;
                  });
                },
              );
            },
          );
        },
        backgroundColor: Colors.black,
        shape: const CircleBorder(),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Center(
        child: ContactList(
          displayedList: displayedList,
          onSearch: _searchHandler,
          onDelete: _handleDelete,
          onEdit: _handleEdit,
        ),
      ),
    );
  }
}
