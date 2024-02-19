/// Schema supports:
// - enum definition
// - late type name - required field definition
// - type? name - optional field definition
// - abstract class - service definition where we define:
//    - ResponseModel endpointName(RequestModel) - endpoint definition (void = no response)
//    - Generic types (IOSServer, IOSClient, AndroidServer, AndroidClient, DartServer, DartClient)
//      control where we need clients and servers

class DartGroupEntry {
  late String name;
  late GroupEntryType type;
  late List<DartGroupEntry> entries;
}

enum GroupEntryType { group, test }

class ListDartTestsResponse {
  late DartGroupEntry group;
}

enum RunDartTestResponseResult {
  success,
  skipped,
  failure,
}

class RunDartTestRequest {
  late String name;
}

class RunDartTestResponse {
  late RunDartTestResponseResult result;
  String? details;
}

abstract class PatrolAppService<IOSClient, AndroidClient, DartServer> {
  ListDartTestsResponse listDartTests();
  RunDartTestResponse runDartTest(RunDartTestRequest request);
}

class ConfigureRequest {
  late int findTimeoutMillis;
}

class OpenAppRequest {
  late String appId;
}

class OpenQuickSettingsRequest {}

class AndroidSelector {
  String? className;
  bool? isCheckable;
  bool? isChecked;
  bool? isClickable;
  bool? isEnabled;
  bool? isFocusable;
  bool? isFocused;
  bool? isLongClickable;
  bool? isScrollable;
  bool? isSelected;
  String? applicationPackage;
  String? contentDescription;
  String? contentDescriptionStartsWith;
  String? contentDescriptionContains;
  String? text;
  String? textStartsWith;
  String? textContains;
  String? resourceName;
  int? instance;
}

class IOSSelector {
  int? instance;
  String? elementType;
  String? identifier;
  String? label;
  String? labelStartsWith;
  String? labelContains;
  String? title;
  String? titleStartsWith;
  String? titleContains;
  bool? hasFocus;
  bool? isEnabled;
  bool? isSelected;
  String? placeholderValue;
  String? placeholderValueStartsWith;
  String? placeholderValueContains;
}

class GetNativeViewsRequest {
  late AndroidSelector androidSelector;
  late IOSSelector iosSelector;
  late String appId;
}

class GetNativeUITreeRequest {
  List<String>? iosInstalledApps;
}

class GetNativeUITreeRespone {
  late List<IOSNativeView> iOSroots;
  late List<AndroidNativeView> androidRoots;
}

class AndroidNativeView {
  String? resourceName;
  String? text;
  String? className;
  String? contentDescription;
  String? applicationPackage;
  late int childCount;
  late bool isCheckable;
  late bool isChecked;
  late bool isClickable;
  late bool isEnabled;
  late bool isFocusable;
  late bool isFocused;
  late bool isLongClickable;
  late bool isScrollable;
  late bool isSelected;
  late Rectangle visibleBounds;
  late Point2D visibleCenter;
  late List<AndroidNativeView> children;
}

class IOSNativeView {
  late List<IOSNativeView> children;
  //TODO enum ?
  late String elementType;
  late String identifier;
  late String label;
  late String title;
  late bool hasFocus;
  late bool isEnabled;
  late bool isSelected;
  late Rectangle frame;
  String? placeholderValue;
  //TODO value
  //TODO we can get other properties from XCUIElement in next request
  // exists, isHittable,normalizedSliderPosition, accessibilityLabel, accessbilityHint, accessibilityValue, isAccessibilityElement etc..;
}

class Rectangle {
  late double minX;
  late double minY;
  late double maxX;
  late double maxY;
}

class Point2D {
  late double x;
  late double y;
}

class GetNativeViewsResponse {
  late List<IOSNativeView> iosNativeViews;
  late List<AndroidNativeView> androidNativeViews;
}

class TapRequest {
  late AndroidSelector androidSelector;
  late IOSSelector iosSelector;
  late String appId;
  int? timeoutMillis;
}

class TapAtRequest {
  late double x;
  late double y;
  late String appId;
}

enum KeyboardBehavior {
  showAndDismiss,
  alternative,
}

class EnterTextRequest {
  late String data;
  late String appId;
  int? index;
  AndroidSelector? androidSelector;
  IOSSelector? iosSelector;
  late KeyboardBehavior keyboardBehavior;
  int? timeoutMillis;
}

class SwipeRequest {
  late String appId;
  late double startX;
  late double startY;
  late double endX;
  late double endY;
  late int steps;
}

class WaitUntilVisibleRequest {
  late AndroidSelector androidSelector;
  late IOSSelector iosSelector;
  late String appId;
  int? timeoutMillis;
}

class DarkModeRequest {
  late String appId;
}

class Notification {
  String? appName;
  late String title;
  late String content;
  String? raw;
}

class GetNotificationsResponse {
  late List<Notification> notifications;
}

class GetNotificationsRequest {}

class TapOnNotificationRequest {
  int? index;
  AndroidSelector? androidSelector;
  IOSSelector? iosSelector;
  int? timeoutMillis;
}

class PermissionDialogVisibleResponse {
  late bool visible;
}

class PermissionDialogVisibleRequest {
  late int timeoutMillis;
}

enum HandlePermissionRequestCode {
  whileUsing,
  onlyThisTime,
  denied,
}

class HandlePermissionRequest {
  late HandlePermissionRequestCode code;
}

enum SetLocationAccuracyRequestLocationAccuracy {
  coarse,
  fine,
}

class SetLocationAccuracyRequest {
  late SetLocationAccuracyRequestLocationAccuracy locationAccuracy;
}

abstract class NativeAutomator<IOSServer, AndroidServer, DartClient> {
  void initialize();
  void configure(ConfigureRequest request);

// general
  void pressHome();
  void pressBack();
  void pressRecentApps();
  void doublePressRecentApps();
  void openApp(OpenAppRequest request);
  void openQuickSettings(OpenQuickSettingsRequest request);

// general UI interaction
  GetNativeUITreeRespone getNativeUITree(GetNativeUITreeRequest request);
  GetNativeViewsResponse getNativeViews(GetNativeViewsRequest request);
  void tap(TapRequest request);
  void doubleTap(TapRequest request);
  void tapAt(TapAtRequest request);
  void enterText(EnterTextRequest request);
  void swipe(SwipeRequest request);
  void waitUntilVisible(WaitUntilVisibleRequest request);

// services
  void enableAirplaneMode();
  void disableAirplaneMode();
  void enableWiFi();
  void disableWiFi();
  void enableCellular();
  void disableCellular();
  void enableBluetooth();
  void disableBluetooth();
  void enableDarkMode(DarkModeRequest request);
  void disableDarkMode(DarkModeRequest request);

// notifications
  void openNotifications();
  void closeNotifications();
  void closeHeadsUpNotification();
  GetNotificationsResponse getNotifications(GetNotificationsRequest request);
  void tapOnNotification(TapOnNotificationRequest request);

// permissions
  PermissionDialogVisibleResponse isPermissionDialogVisible(
      PermissionDialogVisibleRequest request);
  void handlePermissionDialog(HandlePermissionRequest request);
  void setLocationAccuracy(SetLocationAccuracyRequest request);

// other
  void debug();

// TODO(bartekpacia): Move this RPC into a new PatrolNativeTestService service because it doesn't fit here
  void markPatrolAppServiceReady();
}
