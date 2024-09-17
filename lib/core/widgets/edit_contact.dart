import 'package:flutter/material.dart';
import 'package:submission_flutter_pemula/core/extensions.dart';
import 'package:submission_flutter_pemula/core/styles.dart';
import 'package:submission_flutter_pemula/core/widgets/custom_button.dart';
import 'package:submission_flutter_pemula/core/widgets/custom_text_form_field.dart';
import 'package:submission_flutter_pemula/model/contact_model.dart';

class EditContact extends StatefulWidget {
  final Function editContact;
  final ContactModel contact;
  const EditContact({
    super.key,
    required this.editContact,
    required this.contact,
  });

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    setState(() {
      _nameController.text = widget.contact.name;
      _numberController.text = widget.contact.number;
    });
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.black,
              ),
              width: double.infinity,
              child: Text(
                'Edit Kontak',
                style: CustomTextStyle.modalTitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            16.0.verticalSpace,
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    label: "Nama",
                    controller: _nameController,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nama tidak boleh kosong";
                      }
                      return null;
                    },
                  ),
                  16.0.verticalSpace,
                  CustomTextFormField(
                    label: "Nomer Telepon",
                    controller: _numberController,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Nomor telepon tidak boleh kosong";
                      }
                      return null;
                    },
                    keyboardType: const TextInputType.numberWithOptions(
                      decimal: false,
                      signed: true,
                    ),
                  ),
                ],
              ),
            ),
            40.0.verticalSpace,
            Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      backgroundColor: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Batal',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                  8.0.horizontalSpace,
                  Expanded(
                    child: CustomButton(
                      onPressed: () {
                        if (!_formKey.currentState!.validate()) return;
                        ContactModel contact = widget.contact;
                        contact.setName(_nameController.text);
                        contact.setNumber(_numberController.text);

                        widget.editContact(contact);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Simpan',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
