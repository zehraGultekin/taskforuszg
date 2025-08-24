import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taskforuszehra/features/permission/data/models/permisson_model.dart';

final timeProvider = StateProvider<String>((ref) => "Gün");
final selectedPermissionType = StateProvider<String>((ref) => "Yıllık İzin");

final permissionRequestProvider =
    StateNotifierProvider<PermissionRequest, List<PermissionModel>>((ref) {
      return PermissionRequest();
    });

class PermissionRequest extends StateNotifier<List<PermissionModel>> {
  PermissionRequest() : super([]);

  void addPermission(PermissionModel permission) {
    final newList = state;
    newList.add(permission);
    state = newList;
  }
}
