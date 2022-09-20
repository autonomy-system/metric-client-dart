class DeviceConfig {
  String? deviceId;
  String? platform;
  String? version;
  bool? internalBuild;

  DeviceConfig({
    this.deviceId,
    this.platform,
    this.version,
    this.internalBuild,
  });

  DeviceConfig.fromJson(Map<String, dynamic> json) {
    deviceId = json['device_id'];
    platform = json['platform'];
    version = json['version'];
    internalBuild = json['internal_build'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['device_id'] = deviceId;
    data['platform'] = platform;
    data['version'] = version;
    data['internal_build'] = internalBuild;
    return data;
  }
}
