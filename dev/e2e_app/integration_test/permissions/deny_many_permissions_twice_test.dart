import 'package:permission_handler/permission_handler.dart';

import '../common.dart';

const _timeout = Duration(seconds: 5); // to avoid timeouts on CI

void main() {
  patrol('grants various permissions', ($) async {
    await createApp($);

    await $('Open permissions screen').scrollTo().tap();

    await _requestAndDenyCameraPermission($);
    await _requestAndDenyCameraPermission($);

    await _requestAndDenyMicrophonePermission($);
    await _requestAndDenyMicrophonePermission($);

    await _requestAndDenyContactsPermission($);
    await _requestAndDenyContactsPermission($);
  });
}

Future<void> _requestAndDenyCameraPermission(PatrolIntegrationTester $) async {
  if (!await Permission.camera.isGranted) {
    expect($(#camera).$(#statusText).text, 'Not granted');
    await $('Request camera permission').tap();
    if (await $.native.isPermissionDialogVisible(timeout: _timeout)) {
      await $.native.denyPermission();
      await $.pump();
    }
  }

  expect($(#camera).$(#statusText).text, 'Not granted');
}

Future<void> _requestAndDenyMicrophonePermission(
  PatrolIntegrationTester $,
) async {
  if (!await Permission.microphone.isGranted) {
    expect($(#microphone).$(#statusText).text, 'Not granted');
    await $('Request microphone permission').tap();
    if (await $.native.isPermissionDialogVisible(timeout: _timeout)) {
      await $.native.denyPermission();
      await $.pump();
    }
  }

  expect($(#microphone).$(#statusText).text, 'Not granted');
}

Future<void> _requestAndDenyContactsPermission(
  PatrolIntegrationTester $,
) async {
  if (!await Permission.contacts.isGranted) {
    expect($(#contacts).$(#statusText).text, 'Not granted');
    await $('Request contacts permission').tap();
    if (await $.native.isPermissionDialogVisible(timeout: _timeout)) {
      await $.native.denyPermission();
      await $.pump();
    }
  }

  expect($(#contacts).$(#statusText).text, 'Not granted');
}
