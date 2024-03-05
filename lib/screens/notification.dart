import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView(
        children: [
          NotificationItem(
            title: 'New Arrivals',
            description: 'Check out the latest arrivals in our store!',
            date: DateTime.now(),
          ),
          NotificationItem(
            title: 'Sale Alert',
            description: 'Don\'t miss our exclusive sale this weekend!',
            date: DateTime.now().subtract(Duration(days: 1)),
          ),
          // Add more NotificationItem widgets for each notification
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final String description;
  final DateTime date;

  const NotificationItem({
    required this.title,
    required this.description,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(description),
          SizedBox(height: 8),
          Text(
            '${_getTimeAgo()} ago',
            style: TextStyle(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  String _getTimeAgo() {
    Duration difference = DateTime.now().difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} ${difference.inDays == 1 ? 'day' : 'days'}';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} ${difference.inHours == 1 ? 'hour' : 'hours'}';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} ${difference.inMinutes == 1 ? 'minute' : 'minutes'}';
    } else {
      return 'Just now';
    }
  }
}
