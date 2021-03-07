// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal static let backGroundpicture = ImageAsset(name: "BackGroundpicture")
  internal static let calendar = ImageAsset(name: "Calendar")
  internal static let calendar2 = ImageAsset(name: "Calendar2")
  internal static let cancel = ImageAsset(name: "Cancel")
  internal static let checkBox = ImageAsset(name: "CheckBox")
  internal static let chooseServices = ImageAsset(name: "Choose Services")
  internal static let dropDownArrow = ImageAsset(name: "DropDownArrow")
  internal static let emailIcon = ImageAsset(name: "EmailIcon")
  internal static let emptyHeart = ImageAsset(name: "EmptyHeart")
  internal static let emptyStar = ImageAsset(name: "EmptyStar")
  internal static let heartLogo = ImageAsset(name: "Heart Logo")
  internal static let heart = ImageAsset(name: "Heart")
  internal static let mobIcon = ImageAsset(name: "MobIcon")
  internal static let next = ImageAsset(name: "Next")
  internal static let next2 = ImageAsset(name: "Next2")
  internal static let rectangle = ImageAsset(name: "Rectangle")
  internal static let `right` = ImageAsset(name: "Right")
  internal static let rightRect = ImageAsset(name: "RightRect")
  internal static let search = ImageAsset(name: "Search")
  internal static let star = ImageAsset(name: "Star")
  internal static let tabHeart = ImageAsset(name: "Tab Heart")
  internal static let user = ImageAsset(name: "User")
  internal static let about = ImageAsset(name: "about")
  internal static let barsToolbarIPhoneCompactLight5Glyphs = ImageAsset(name: "Bars - Toolbar - iPhone - Compact - Light - 5 Glyphs")
  internal static let fees = ImageAsset(name: "Fees")
  internal static let group177 = ImageAsset(name: "Group 177")
  internal static let scan = ImageAsset(name: "Scan")
  internal static let arrowback = ImageAsset(name: "arrowback")
  internal static let arrowdown = ImageAsset(name: "arrowdown")
  internal static let background = ImageAsset(name: "background")
  internal static let calendaricon = ImageAsset(name: "calendaricon")
  internal static let clock = ImageAsset(name: "clock")
  internal static let doctoricon = ImageAsset(name: "doctoricon")
  internal static let favoriteicon = ImageAsset(name: "favoriteicon")
  internal static let findDoctorBack = ImageAsset(name: "findDoctorBack")
  internal static let heartBlack = ImageAsset(name: "heartBlack")
  internal static let iconBlue = ImageAsset(name: "iconBlue")
  internal static let lifeicon = ImageAsset(name: "lifeicon")
  internal static let location = ImageAsset(name: "location")
  internal static let logo = ImageAsset(name: "logo")
  internal static let naviBackground = ImageAsset(name: "naviBackground")
  internal static let pinSmall = ImageAsset(name: "pinSmall")
  internal static let searchicon = ImageAsset(name: "searchicon")
  internal static let settingsicon = ImageAsset(name: "settingsicon")
  internal static let specialisticon = ImageAsset(name: "specialisticon")
  internal static let tabBar = ImageAsset(name: "tabBar")
  internal static let back = ImageAsset(name: "back")
  internal static let backBtn = ImageAsset(name: "backBtn")
  internal static let backgroundPopUpAuth = ImageAsset(name: "backgroundPopUpAuth")
  internal static let care = ImageAsset(name: "care")
  internal static let clockBlue = ImageAsset(name: "clockBlue")
  internal static let contact = ImageAsset(name: "contact")
  internal static let doctor = ImageAsset(name: "doctor")
  internal static let favourite = ImageAsset(name: "favourite")
  internal static let feesBlue = ImageAsset(name: "feesBlue")
  internal static let heartblue = ImageAsset(name: "heartblue")
  internal static let icClose = ImageAsset(name: "icClose")
  internal static let icPin = ImageAsset(name: "icPin")
  internal static let life = ImageAsset(name: "life")
  internal static let lifeBlue = ImageAsset(name: "lifeBlue")
  internal static let lineBlue = ImageAsset(name: "lineBlue")
  internal static let linelabel = ImageAsset(name: "linelabel")
  internal static let lock = ImageAsset(name: "lock")
  internal static let login = ImageAsset(name: "login")
  internal static let logoBlue = ImageAsset(name: "logoBlue")
  internal static let pin = ImageAsset(name: "pin")
  internal static let pinBlue = ImageAsset(name: "pinBlue")
  internal static let previous = ImageAsset(name: "previous")
  internal static let profileDoctor = ImageAsset(name: "profileDoctor")
  internal static let settings = ImageAsset(name: "settings")
  internal static let share = ImageAsset(name: "share")
  internal static let sheet = ImageAsset(name: "sheet")
  internal static let showdataarrow = ImageAsset(name: "showdataarrow")
  internal static let textBG = ImageAsset(name: "textBG")
  internal static let underline = ImageAsset(name: "underline")
  internal static let userSetting = ImageAsset(name: "userSetting")
  internal static let worning = ImageAsset(name: "worning")
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
}

internal extension ImageAsset.Image {
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
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
