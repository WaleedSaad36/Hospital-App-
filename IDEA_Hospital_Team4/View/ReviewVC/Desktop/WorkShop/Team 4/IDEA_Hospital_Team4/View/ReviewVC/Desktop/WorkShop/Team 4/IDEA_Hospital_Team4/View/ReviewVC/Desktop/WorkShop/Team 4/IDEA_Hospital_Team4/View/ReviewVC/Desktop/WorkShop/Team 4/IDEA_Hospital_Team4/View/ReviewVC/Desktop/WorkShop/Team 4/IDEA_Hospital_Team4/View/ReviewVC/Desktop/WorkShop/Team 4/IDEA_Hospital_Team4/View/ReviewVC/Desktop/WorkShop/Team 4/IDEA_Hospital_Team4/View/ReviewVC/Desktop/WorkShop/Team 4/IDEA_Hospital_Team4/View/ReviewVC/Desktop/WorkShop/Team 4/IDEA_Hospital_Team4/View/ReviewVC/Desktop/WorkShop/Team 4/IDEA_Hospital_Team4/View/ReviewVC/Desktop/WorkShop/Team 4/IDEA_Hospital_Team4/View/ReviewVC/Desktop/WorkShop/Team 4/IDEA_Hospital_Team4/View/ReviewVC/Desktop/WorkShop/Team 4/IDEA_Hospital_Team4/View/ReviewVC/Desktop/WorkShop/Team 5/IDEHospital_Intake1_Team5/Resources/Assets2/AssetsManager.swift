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
  internal static let users = ImageAsset(name: "users")
  internal static let whiteClose = ImageAsset(name: "white_close")
  internal static let path = ImageAsset(name: "Path")
  internal static let rectangle = ImageAsset(name: "Rectangle")
  internal static let about = ImageAsset(name: "about")
  internal static let at = ImageAsset(name: "at")
  internal static let back = ImageAsset(name: "back")
  internal static let bar = ImageAsset(name: "bar")
  internal static let bar2 = ImageAsset(name: "bar_2")
  internal static let xImg = ImageAsset(name: "x_img")
  internal static let blueHeart = ImageAsset(name: "blueHeart")
  internal static let calendar = ImageAsset(name: "calendar")
  internal static let calendarBar = ImageAsset(name: "calendarBar")
  internal static let care = ImageAsset(name: "care")
  internal static let clock = ImageAsset(name: "clock")
  internal static let arrow = ImageAsset(name: "arrow")
  internal static let component22 = ImageAsset(name: "component22")
  internal static let group1 = ImageAsset(name: "group1")
  internal static let group234 = ImageAsset(name: "group234")
  internal static let nurse = ImageAsset(name: "nurse")
  internal static let path21 = ImageAsset(name: "path21")
  internal static let path22 = ImageAsset(name: "path22")
  internal static let path29 = ImageAsset(name: "path29")
  internal static let pin = ImageAsset(name: "pin")
  internal static let component411 = ImageAsset(name: "Component 41 – 1")
  internal static let calendar3 = ImageAsset(name: "calendar-3")
  internal static let heart = ImageAsset(name: "heart")
  internal static let contact = ImageAsset(name: "contact")
  internal static let ctScan = ImageAsset(name: "ct-scan")
  internal static let doctor = ImageAsset(name: "doctor")
  internal static let doctorWhite = ImageAsset(name: "doctor_white")
  internal static let forgot = ImageAsset(name: "forgot")
  internal static let whiteHeart = ImageAsset(name: "white_heart")
  internal static let heartRed = ImageAsset(name: "heart-red")
  internal static let heartBar = ImageAsset(name: "heartBar")
  internal static let whiteHeartBig = ImageAsset(name: "white_heart_big")
  internal static let heartBlue = ImageAsset(name: "heart_blue")
  internal static let heartWhite = ImageAsset(name: "heart_white")
  internal static let life = ImageAsset(name: "life")
  internal static let lifeWhite = ImageAsset(name: "life_white")
  internal static let login = ImageAsset(name: "login")
  internal static let login1 = ImageAsset(name: "login1")
  internal static let main = ImageAsset(name: "main")
  internal static let mainBar = ImageAsset(name: "mainBar")
  internal static let money3 = ImageAsset(name: "money-3")
  internal static let phone = ImageAsset(name: "phone")
  internal static let pinPink = ImageAsset(name: "pin_Pink")
  internal static let pinWhite = ImageAsset(name: "pin_white")
  internal static let rateYallow = ImageAsset(name: "rate_yallow")
  internal static let clockIcon = ImageAsset(name: "clockIcon")
  internal static let close = ImageAsset(name: "close")
  internal static let companyIcon = ImageAsset(name: "companyIcon")
  internal static let feesIcon = ImageAsset(name: "feesIcon")
  internal static let pinIcon = ImageAsset(name: "pinIcon")
  internal static let searchBar = ImageAsset(name: "searchBar")
  internal static let settings = ImageAsset(name: "settings")
  internal static let share = ImageAsset(name: "share")
  internal static let sheetBlue = ImageAsset(name: "sheet_blue")
  internal static let switchOff = ImageAsset(name: "switch_off")
  internal static let userWhite = ImageAsset(name: "user-white")
  internal static let userBlue = ImageAsset(name: "user_blue")
  internal static let veterinary = ImageAsset(name: "veterinary")
  internal static let whiteStars = ImageAsset(name: "whiteStars")
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
