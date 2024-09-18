# tripbudgeter

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.







Row(
              children: [
                card(Colors.green, "Total Budget", "\$100"),
                card(Colors.orange, "Trip expenses", "\$200"),
                card(Colors.indigo, "Remaining Budget", "\$400")
              ],
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  seccard("planning a trip ?"),
                  seccard("new expense")
],           ),
            ),