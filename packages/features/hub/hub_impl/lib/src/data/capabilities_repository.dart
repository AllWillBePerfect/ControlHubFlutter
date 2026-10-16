import 'package:core/utils/result.dart';
import 'package:hub_api/hub_api.dart';
import 'package:sources_api/sources_api.dart';

abstract class CapabilitiesRepository {
  Future<Result<List<Capability>>> getCapabilities(Source source);

  Future<Result<Capability>> execute(
    Source source,
    String capabilityId,
    CapabilityCommand command,
  );

  Future<Result<Capability>> updateOption(
    Source source,
    String capabilityId,
    String optionId, {
    String? title,
    bool? hidden,
  });
}
