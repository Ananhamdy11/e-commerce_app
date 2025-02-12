import 'package:flutter/material.dart';

class UserCommentsListView extends StatelessWidget {
  const UserCommentsListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          key: ValueKey(index),
          title: const Text('User Name'),
          subtitle: const Text('Comment'),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider();
      },
    );
  }
}
