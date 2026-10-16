import 'package:flutter/material.dart';
import 'package:hub_api/hub_api.dart';

typedef OnCommand = void Function(CapabilityCommand command);

class CapabilityCard extends StatelessWidget {
  const CapabilityCard({
    super.key,
    required this.capability,
    required this.busy,
    required this.enabled,
    required this.onCommand,
    required this.onEditOptions,
  });

  final Capability capability;
  final bool busy;
  final bool enabled;
  final OnCommand onCommand;

  final VoidCallback onEditOptions;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: switch (capability) {
          SelectorCapability c => _SelectorCard(
              capability: c,
              busy: busy,
              enabled: enabled,
              onCommand: onCommand,
              onEditOptions: onEditOptions,
            ),
          GaugeCapability c => _GaugeCard(capability: c),
          ToggleCapability c =>
            _ToggleCard(capability: c, busy: busy, enabled: enabled, onCommand: onCommand),
          SliderCapability c =>
            _SliderCard(capability: c, busy: busy, enabled: enabled, onCommand: onCommand),
        },
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.title, this.busy = false, this.trailing});

  final String title;
  final bool busy;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Text(title, style: Theme.of(context).textTheme.titleMedium)),
        if (busy)
          const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2))
        else if (trailing != null)
          trailing!,
      ],
    );
  }
}

class _SelectorCard extends StatelessWidget {
  const _SelectorCard({
    required this.capability,
    required this.busy,
    required this.enabled,
    required this.onCommand,
    required this.onEditOptions,
  });

  final SelectorCapability capability;
  final bool busy;
  final bool enabled;
  final OnCommand onCommand;
  final VoidCallback onEditOptions;

  @override
  Widget build(BuildContext context) {
    final selected = capability.selectedId;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Header(
          title: capability.title,
          busy: busy,
          trailing: IconButton(
            tooltip: 'Настроить входы',
            icon: const Icon(Icons.tune),
            onPressed: onEditOptions,
          ),
        ),
        const SizedBox(height: 12),
        SegmentedButton<String>(
          segments: [
            for (final o in capability.visibleOptions)
              ButtonSegment(value: o.id, label: Text(o.title)),
          ],
          selected: selected == null ? <String>{} : {selected},
          emptySelectionAllowed: true,
          showSelectedIcon: false,
          onSelectionChanged: enabled
              ? (ids) {
                  if (ids.isNotEmpty) onCommand(SelectOption(ids.first));
                }
              : null,
        ),
      ],
    );
  }
}

class _GaugeCard extends StatelessWidget {
  const _GaugeCard({required this.capability});

  final GaugeCapability capability;

  @override
  Widget build(BuildContext context) {
    final c = capability;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Header(
          title: c.title,
          trailing: Text('${c.value.round()}${c.unit}',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        const SizedBox(height: 12),
        LinearProgressIndicator(
          value: c.fraction,
          minHeight: 8,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}

class _ToggleCard extends StatelessWidget {
  const _ToggleCard({
    required this.capability,
    required this.busy,
    required this.enabled,
    required this.onCommand,
  });

  final ToggleCapability capability;
  final bool busy;
  final bool enabled;
  final OnCommand onCommand;

  @override
  Widget build(BuildContext context) {
    return _Header(
      title: capability.title,
      busy: busy,
      trailing: Switch(
        value: capability.isOn,
        onChanged: enabled ? (v) => onCommand(SetToggle(v)) : null,
      ),
    );
  }
}

class _SliderCard extends StatefulWidget {
  const _SliderCard({
    required this.capability,
    required this.busy,
    required this.enabled,
    required this.onCommand,
  });

  final SliderCapability capability;
  final bool busy;
  final bool enabled;
  final OnCommand onCommand;

  @override
  State<_SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<_SliderCard> {
  double? _dragValue;

  @override
  void didUpdateWidget(_SliderCard old) {
    super.didUpdateWidget(old);
    if (old.busy && !widget.busy) _dragValue = null;
  }

  @override
  Widget build(BuildContext context) {
    final c = widget.capability;
    final value = (_dragValue ?? c.value).clamp(c.min, c.max).toDouble();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _Header(title: c.title, busy: widget.busy, trailing: Text('${value.round()}')),
        Slider(
          value: value,
          min: c.min,
          max: c.max,
          divisions: c.divisions,
          onChanged: widget.enabled ? (v) => setState(() => _dragValue = v) : null,
          onChangeEnd: widget.enabled ? (v) => widget.onCommand(SetValue(v)) : null,
        ),
      ],
    );
  }
}
