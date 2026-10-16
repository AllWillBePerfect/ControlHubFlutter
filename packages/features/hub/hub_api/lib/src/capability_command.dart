sealed class CapabilityCommand {
  const CapabilityCommand();
}

final class SelectOption extends CapabilityCommand {
  const SelectOption(this.optionId);
  final String optionId;
}

final class SetToggle extends CapabilityCommand {
  const SetToggle(this.isOn);
  final bool isOn;
}

final class SetValue extends CapabilityCommand {
  const SetValue(this.value);
  final double value;
}
