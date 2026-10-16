sealed class Capability {
  const Capability({required this.id, required this.title});

  final String id;
  final String title;
}

final class CapabilityOption {
  const CapabilityOption({required this.id, required this.title, this.hidden = false});

  final String id;
  final String title;
  final bool hidden;
}

final class SelectorCapability extends Capability {
  const SelectorCapability({
    required super.id,
    required super.title,
    required this.options,
    required this.selectedId,
  });

  final List<CapabilityOption> options;
  final String? selectedId;

  List<CapabilityOption> get visibleOptions => [
        for (final o in options)
          if (!o.hidden || o.id == selectedId) o,
      ];
}

final class GaugeCapability extends Capability {
  const GaugeCapability({
    required super.id,
    required super.title,
    required this.value,
    required this.min,
    required this.max,
    this.unit = '',
  });

  final double value;
  final double min;
  final double max;
  final String unit;

  double get fraction => ((value - min) / (max - min)).clamp(0.0, 1.0);
}

final class ToggleCapability extends Capability {
  const ToggleCapability({required super.id, required super.title, required this.isOn});

  final bool isOn;
}

final class SliderCapability extends Capability {
  const SliderCapability({
    required super.id,
    required super.title,
    required this.value,
    required this.min,
    required this.max,
    this.step,
  });

  final double value;
  final double min;
  final double max;
  final double? step;

  int? get divisions => step == null ? null : ((max - min) / step!).round();
}
