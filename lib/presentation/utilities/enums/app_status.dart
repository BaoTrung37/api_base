enum AppStatus {
  initial,
  inProgress,
  success,
  error,
}

// extension LoadingStatusFunction on LoadingStatus {
//   ButtonState get buttonState {
//     switch (this) {
//       case LoadingStatus.initial:
//       case LoadingStatus.success:
//       case LoadingStatus.error:
//         return ButtonState.normal;
//       case LoadingStatus.inProgress:
//         return ButtonState.loading;
//     }
//   }
// }
