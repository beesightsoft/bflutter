/*
 * Developed by Nhan Cao on 12/24/19 11:24 AM.
 * Last modified 12/24/19 11:18 AM.
 */
import 'package:bflutter_poc/provider/store/local/repo/preference_repo.dart';
import 'package:sqflite/sqlite_api.dart';

import 'migrate.dart';

class MigrateV1 implements Migrate {
  @override
  Future<void> create(Batch batch) async {
    await PreferenceRepo().create(batch);
  }

  @override
  Future<void> upgrade(Batch batch) async {
    // With the first version (v1) no need to upgrade anything
    // do nothing here
  }
}
