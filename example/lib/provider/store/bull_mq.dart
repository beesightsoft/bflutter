/*
 * Developed by Nhan Cao on 12/26/19 4:45 PM.
 * Last modified 12/26/19 4:45 PM.
 */

import 'package:bflutter_poc/provider/store/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

import 'local/repo/queue_repo.dart';

class BullMQ {
  BullMQ._private();
  static final BullMQ instance = BullMQ._private();

  /// @nhancv 12/26/2019: If this flag = true, the next schedule run in 0 second delay
  bool pushHasChanged = false;

  /// @nhancv 12/26/2019: Auto to start queue with delay 5 seconds later
  void start({delayInSecond = 0}) async {
    await Future.delayed(Duration(seconds: delayInSecond));
    await _queueProcessing();
    start(delayInSecond: this.pushHasChanged ? 0 : 5);
  }

  // @nhancv 12/26/2019: Processing
  Future<void> _queueProcessing() async {
    Store store = DefaultStore.instance;
    if (store == null) return;
    List<TaskModel> queue = await store.getAllTaskInQueue();
    if (queue.length > 0) {
      debugPrint('Total task in queue: ${queue.length}');
      for (TaskModel task in queue) {
        debugPrint('Task is processing: ${task.id}');
        await store.removeTaskModel(task.id);
        debugPrint('Task has completed: ${task.id}');
      }
    }
  }
}
