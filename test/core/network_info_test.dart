
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:traders/core/platform/network_info.dart';

class MocDataConnectionChecker extends Mock implements DataConnectionChecker{}

void main() {
  NetworkInfoImpl? networkInfoImpl;
  MocDataConnectionChecker? mocDataConnectionChecker;

  setUp(() {
    mocDataConnectionChecker = MocDataConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(connectionChecker: mocDataConnectionChecker!);
  });

  test("Should call DataConnection Checker", () async{
    when(mocDataConnectionChecker!.hasConnection)
        .thenAnswer((_) async =>   true);
    final result = await networkInfoImpl!.isConnected;
    verify(mocDataConnectionChecker!.hasConnection);
    expect(result, true);
  });
}
