part of flutter_nearby_connections;

/// [SessionState] It identifies  peer's state and provides 3 states: [SessionState.notConnected], [SessionState.connecting], [SessionState.connected].
enum SessionState {
  /// peer is not invite.
  notConnected,

  /// peer has been invited and waited for connecting
  connecting,

  /// peer has received the invitation and has accepted. Then both peers can communicate with each other.
  connected
}

/// The class [Device] provides a peer information including [Device.deviceId], [Device.deviceName], [Device.state]
class Device {
  /// Peer ID
  String deviceId;

  /// Peer name
  String deviceName;

  /// Provide peer state
  /// See [SessionState]
  SessionState state = SessionState.notConnected;

  Map<String, dynamic>? discoveryInfo;

  Device({required this.deviceId, required this.deviceName, this.discoveryInfo, required int state}) {
    switch (state) {
      case 1:
        this.state = SessionState.connecting;
        break;
      case 2:
        this.state = SessionState.connected;
        break;
      default:
        this.state = SessionState.notConnected;
        break;
    }
  }

  factory Device.fromJson(Map<String, dynamic> map) {
    return Device(deviceId: map["deviceId"],
        deviceName: map["deviceName"],
        discoveryInfo: map["discoveryInfo"],
        state: map["state"]
    );
  }

  @override
  bool operator ==(Object? other) {
    return other is Device &&
        deviceId == other.deviceId;
  }

  @override
  int get hashCode => deviceId.hashCode;
}
