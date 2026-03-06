import 'dart:io';
import 'package:appwrite/appwrite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mandi/core/constants/environment.dart';
import 'package:mandi/core/models/app_error.dart';
import 'package:mandi/core/services/client_service.dart';
import 'package:mandi/core/services/user_service.dart';
import 'package:mandi/core/utils/logger.dart';
import 'package:image/image.dart' as img;
import 'package:permission_handler/permission_handler.dart' as ph;

class ImageService {
  final ImagePicker _picker = ImagePicker();
  final ClientService _clientService;
  final UserService _userService;

  ImageService({
    required ClientService clientService,
    required UserService userService,
  })  : _clientService = clientService,
        _userService = userService {
    Logger.init(runtimeType.toString());
  }

  Future<File?> pickImage({ImageSource source = ImageSource.gallery}) async {
    try {
      Logger.info(runtimeType.toString(), 'Picking image from $source...');
      final hasPermission = await _checkAndRequestPhotosPermission();

      if (!hasPermission) {
        return null;
      }
      final XFile? pickedFile = await _picker.pickImage(source: source);

      if (pickedFile == null) {
        Logger.info(runtimeType.toString(), 'Image pick canceled');
        return null;
      }

      final File imageFile = File(pickedFile.path);

      Logger.success(runtimeType.toString(), 'Image picked: ${imageFile.path}');
      return imageFile;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error picking image: $e');
      rethrow;
    }
  }

  Future<File> compressImage(File imageFile) async {
    try {
      Logger.info(runtimeType.toString(), 'Compressing image...');

      final bytes = await imageFile.readAsBytes();
      final image = img.decodeImage(bytes);

      if (image == null) {
        throw Exception('Could not decode image');
      }

      final resized = img.copyResize(
        image,
        width: image.width > 800 ? 800 : null,
        height: image.height > 800 ? 800 : null,
      );

      final compressedBytes = img.encodeJpg(resized, quality: 85);
      await imageFile.writeAsBytes(compressedBytes);

      Logger.success(
        runtimeType.toString(),
        'Image compressed: ${compressedBytes.length} bytes',
      );

      return imageFile;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error compressing image: $e');
      rethrow;
    }
  }

  Future<String> uploadAvatar(File imageFile, String userId) async {
    try {
      Logger.info(runtimeType.toString(), 'Uploading avatar to Appwrite...');

      final storage = Storage(_clientService.client);
      final fileId = 'avatar_$userId';

      final file = await storage.createFile(
        bucketId: Environment.bucketID,
        fileId: fileId,
        file: InputFile.fromPath(
          path: imageFile.path,
          filename: '${userId}_avatar.jpg',
        ),
        permissions: [
          Permission.read(Role.any()),
          Permission.update(Role.user(userId)),
          Permission.delete(Role.user(userId)),
        ],
      );

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final url =
          '${_clientService.client.endPoint}/storage/buckets/${Environment.bucketID}/files/${file.$id}/view?project=${Environment.appwriteProjectId}&v=$timestamp';

      Logger.success(runtimeType.toString(), 'Avatar uploaded: $url');

      return url;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error uploading avatar: $e');
      rethrow;
    }
  }


  Future<void> deleteAvatar(String userId) async {
    try {
      Logger.info(runtimeType.toString(), 'Deleting old avatar...');

      final storage = Storage(_clientService.client);
      final fileId = 'avatar_$userId';

      await storage.deleteFile(
        bucketId: Environment.bucketID,
        fileId: fileId,
      );

      Logger.success(runtimeType.toString(), 'Old avatar deleted: $fileId');
    } on AppwriteException catch (e) {
      if (e.code == 404) {
        Logger.info(runtimeType.toString(), 'No old avatar to delete (404)');
        return;
      }

      if (e.code == 401 || e.code == 403) {
        Logger.error(
          runtimeType.toString(),
          '⚠️ No permission to delete! Error: ${e.message}',
        );
        return;
      }

      Logger.error(runtimeType.toString(), 'Delete error: ${e.code} - ${e.message}');
      rethrow;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error deleting avatar: $e');
      rethrow;
    }
  }

  Future<String?> pickAndUploadAvatar({
    ImageSource source = ImageSource.gallery,
  }) async {
    try {
      final imageFile = await pickImage(source: source);
      if (imageFile == null) return null;

      final compressedFile = await compressImage(imageFile);

      await deleteAvatar(_userService.userId!);

      final avatarUrl = await uploadAvatar(compressedFile, _userService.userId!);

      return avatarUrl;
    } catch (e) {
      Logger.error(runtimeType.toString(), 'Error in pickAndUploadAvatar: $e');
      rethrow;
    }
  }

  Future<bool> _checkAndRequestPhotosPermission() async {
    try {
      Logger.info(runtimeType.toString(), 'Checking photos permission...');

      ph.Permission permission = ph.Permission.photos;

      ph.PermissionStatus status = await permission.status;

      Logger.info(runtimeType.toString(), 'Current permission status: $status');

      if (status.isGranted || status.isLimited) {
        return true;
      }

      if (status.isPermanentlyDenied) {
        throw AppError.permissionPermanentlyDenied(
          details: 'photos',
        );
      }

      Logger.info(runtimeType.toString(), 'Requesting photos permission...');
      status = await permission.request();

      Logger.info(runtimeType.toString(), 'Permission request result: $status');

      if (status.isGranted || status.isLimited) {
        return true;
      }

      if (status.isPermanentlyDenied) {
        throw AppError.permissionPermanentlyDenied(
          details: 'photos',
        );
      }

      throw AppError.permissionDenied(
        details: 'photos',
      );
    } catch (e) {
      if (e is AppError) rethrow;

      Logger.error(runtimeType.toString(), 'Error checking permission: $e');
      rethrow;
    }
  }
}
