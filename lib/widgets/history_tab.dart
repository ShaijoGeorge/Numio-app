import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

class HistoryTab extends StatelessWidget {
  final List<String> history;
  final VoidCallback onClearHistory;

  const HistoryTab({
    Key? key,
    required this.history,
    required this.onClearHistory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                AppConstants.history,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              TextButton(
                onPressed: onClearHistory,
                child: Text(AppConstants.clearAll),
              ),
            ],
          ),
        ),
        Expanded(
          child: history.isEmpty
              ? Center(
                  child: Text(
                    AppConstants.noCalculations,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey[400],
                    ),
                  ),
                )
              : ListView.builder(
                  itemCount: history.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        history[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'monospace',
                        ),
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}