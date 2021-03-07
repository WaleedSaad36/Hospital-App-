// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// acceptHeaderKey
  internal static let acceptHeaderKey = L10n.tr("Localizable", "acceptHeaderKey")
  /// application/json
  internal static let acceptHeaderValue = L10n.tr("Localizable", "acceptHeaderValue")
  /// Accept-Language
  internal static let acceptLanguageHeaderKey = L10n.tr("Localizable", "acceptLanguageHeaderKey")
  /// en
  internal static let acceptLanguageHeaderValue = L10n.tr("Localizable", "acceptLanguageHeaderValue")
  /// Age
  internal static let ageTitleAlertAction = L10n.tr("Localizable", "ageTitleAlertAction")
  /// application/json
  internal static let applicationJsonHeaderValue = L10n.tr("Localizable", "applicationJsonHeaderValue")
  /// Authorization
  internal static let authorizationHeaderKey = L10n.tr("Localizable", "authorizationHeaderKey")
  /// Camera
  internal static let cameraTitleAlertAction = L10n.tr("Localizable", "cameraTitleAlertAction")
  /// Cancel
  internal static let cancelTitleAlertAction = L10n.tr("Localizable", "cancelTitleAlertAction")
  /// X-CSRF-TOKEN
  internal static let categoryTokenHeaderKey = L10n.tr("Localizable", "categoryTokenHeaderKey")
  /// 76A7SdHtnY2ft6RBeZ4pYDkhxaNNeRFURm4tIJVP
  internal static let categoryTokenHeaderValue = L10n.tr("Localizable", "categoryTokenHeaderValue")
  /// Content-Type
  internal static let contentTypeHeaderKey = L10n.tr("Localizable", "contentTypeHeaderKey")
  /// FavoritesAppointmentsTViewCell
  internal static let dataCell = L10n.tr("Localizable", "DataCell")
  /// Email
  internal static let emailTitleAlertAction = L10n.tr("Localizable", "emailTitleAlertAction")
  /// IDEA EG HOSPITAL THE BEST CHOICE
  internal static let homeLabel = L10n.tr("Localizable", "homeLabel")
  /// HOME NURSE
  internal static let homenurseLabel = L10n.tr("Localizable", "hOMENURSELabel")
  /// HomeVC
  internal static let homeVC = L10n.tr("Localizable", "homeVC")
  /// Human Medicine
  internal static let humanMedicineLabel = L10n.tr("Localizable", "humanMedicineLabel")
  /// Main
  internal static let mainStoryboard = L10n.tr("Localizable", "mainStoryboard")
  /// MainTabBarController
  internal static let mainTabBarController = L10n.tr("Localizable", "mainTabBarController")
  /// MRI
  internal static let mriLabel = L10n.tr("Localizable", "mRILabel")
  /// MyAppointmentsVC
  internal static let myAppointmentsVC = L10n.tr("Localizable", "myAppointmentsVC")
  /// Name
  internal static let nameTitleAlertAction = L10n.tr("Localizable", "nameTitleAlertAction")
  /// No Data Found
  internal static let noDataFoundLabel = L10n.tr("Localizable", "noDataFoundLabel")
  /// No
  internal static let noTitleAlertAction = L10n.tr("Localizable", "noTitleAlertAction")
  /// email
  internal static let parametersKeyemail = L10n.tr("Localizable", "parametersKeyemail")
  /// message
  internal static let parametersKeymessage = L10n.tr("Localizable", "parametersKeymessage")
  /// mobile
  internal static let parametersKeymobile = L10n.tr("Localizable", "parametersKeymobile")
  /// name
  internal static let parametersKeyname = L10n.tr("Localizable", "parametersKeyname")
  /// password
  internal static let parametersKeypassword = L10n.tr("Localizable", "parametersKeypassword")
  /// Password
  internal static let passwordTitleAlertAction = L10n.tr("Localizable", "passwordTitleAlertAction")
  /// Photo Album
  internal static let photoAlbumTitleAlertAction = L10n.tr("Localizable", "photoAlbumTitleAlertAction")
  /// SearchVC
  internal static let searchVC = L10n.tr("Localizable", "searchVC")
  /// Success
  internal static let successTitleAlertAction = L10n.tr("Localizable", "successTitleAlertAction")
  /// Veterinary
  internal static let veterinaryLabel = L10n.tr("Localizable", "veterinaryLabel")
  /// Yes
  internal static let yesTitleAlertAction = L10n.tr("Localizable", "yesTitleAlertAction")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
