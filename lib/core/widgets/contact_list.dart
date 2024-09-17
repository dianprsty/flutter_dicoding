import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/core/extensions.dart';
import 'package:submission_flutter_pemula/model/contact_model.dart';

class ContactList extends StatefulWidget {
  final List<ContactModel> displayedList;
  final Function onSearch;
  final Function onDelete;
  final Function onEdit;
  const ContactList({
    super.key,
    required this.displayedList,
    required this.onSearch,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _searchController,
            onChanged: (value) {
              widget.onSearch(value);
            },
            decoration: InputDecoration(
              hintText: "Cari kontak",
              labelText: "Cari kontak",
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              floatingLabelBehavior: FloatingLabelBehavior.never,
            ),
          ),
          16.0.verticalSpace,
          widget.displayedList.isEmpty
              ? const Text("Tidak ada kontak")
              : Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemCount: widget.displayedList.length,
                    itemBuilder: (context, index) {
                      ContactModel contact = widget.displayedList[index];
                      String initial =
                          contact.eachWordFirstLetterUpperCase(contact.name);
                      return ListTile(
                        contentPadding: index == widget.displayedList.length - 1
                            ? const EdgeInsets.only(bottom: 60)
                            : EdgeInsets.zero,
                        dense: true,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        title: Text(
                          contact.name,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 14),
                        ),
                        subtitle: Text(contact.number,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(fontSize: 13)),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.shade800,
                          child: Text(
                            initial,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            GestureDetector(
                              onTap: () {
                                widget.onEdit(contact);
                              },
                              child: Icon(
                                Icons.drive_file_rename_outline_rounded,
                                size: 18,
                                color: Colors.green.shade400,
                              ),
                            ),
                            16.0.horizontalSpace,
                            GestureDetector(
                              onTap: () {
                                widget.onDelete(contact);
                              },
                              child: Icon(
                                Icons.delete,
                                size: 18,
                                color: Colors.red.shade400,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
