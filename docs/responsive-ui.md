# Responsive UI decisions

The application serves two very different surfaces: compact mobile screens used for everyday family actions and wider browser layouts used for administration and review. The UI adapts from available constraints instead of assuming one fixed device size.

## Layout strategy

- Small widths use a single-column flow, large touch targets, and bottom navigation where it improves reachability.
- Wider layouts increase content width, preserve readable line lengths, and place related actions beside the primary content.
- The same feature components are reused across breakpoints; only composition and spacing change.
- Dialogs and forms remain usable with a keyboard on the Web target.
- Child screens prioritize a small number of visible actions, clear feedback, and predictable back navigation.

The public sample in [`responsive_layout_example.dart`](../samples/responsive_layout_example.dart) shows the core pattern with `LayoutBuilder`. It is intentionally independent of the private application code.

## Interaction details

The UI uses explicit labels, semantic button roles, sufficient contrast, and feedback for actions that change balances or goals. Loading and empty states are treated as part of the design rather than as exceptional screens. On the Web target, responsive behavior is checked at intermediate widths as well as phone and desktop sizes.

## Visual system

The product uses a dark, friendly visual language with colorful feature cards, soft surfaces, and game-like feedback. The visual treatment changes emphasis between parent and child modes while keeping navigation and data meaning consistent.
