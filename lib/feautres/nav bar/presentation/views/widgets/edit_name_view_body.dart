import 'package:ecommerce_app/core/helper/build_appbar.dart';
import 'package:ecommerce_app/core/helper/widgets/custom_evb.dart';
import 'package:ecommerce_app/core/helper/widgets/navigate_to.dart';
import 'package:ecommerce_app/feautres/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:ecommerce_app/feautres/nav%20bar/presentation/views/widgets/profile_view.dart';
import 'package:flutter/material.dart';

class EditNameViewBody extends StatelessWidget {
  const EditNameViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, 'Edit Name'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CustomTextField(
                label: 'Enter Name', keyboardType: TextInputType.name),
            const SizedBox(
              height: 20,
            ),
            CustomEVB(
                onTap: () {
                  navigatorTo(context, const ProfileView());
                },
                widget: const Text(
                  'Update ',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    );
  }
}
