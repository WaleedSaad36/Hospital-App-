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
  internal static let component111 = ImageAsset(name: "Component 11 – 1")
  internal static let component411Copy = ImageAsset(name: "Component 41 – 1 copy")
  internal static let component411 = ImageAsset(name: "Component 41 – 1")
  internal static let component61 = ImageAsset(name: "Component 6 – 1")
  internal static let group1Copy = ImageAsset(name: "Group 1 copy")
  internal static let group1164 = ImageAsset(name: "Group 1164")
  internal static let group233Copy = ImageAsset(name: "Group 233 copy")
  internal static let group233 = ImageAsset(name: "Group 233")
  internal static let group = ImageAsset(name: "Group")
  internal static let path1574 = ImageAsset(name: "Path 1574")
  internal static let rectangle1796 = ImageAsset(name: "Rectangle 1796")
  internal static let about = ImageAsset(name: "about")
  internal static let arrow = ImageAsset(name: "arrow")
  internal static let at = ImageAsset(name: "at")
  internal static let back2 = ImageAsset(name: "back2")
  internal static let backButton = ImageAsset(name: "backButton")
  internal static let calendar3Copy2 = ImageAsset(name: "calendar-3 copy 2")
  internal static let calendar3Copy3 = ImageAsset(name: "calendar-3 copy 3")
  internal static let calendar3 = ImageAsset(name: "calendar-3")
  internal static let calendarBar = ImageAsset(name: "calendarBar")
  internal static let care = ImageAsset(name: "care")
  internal static let clock = ImageAsset(name: "clock")
  internal static let clockIcon = ImageAsset(name: "clockIcon")
  internal static let close = ImageAsset(name: "close")
  internal static let companyIcon = ImageAsset(name: "companyIcon")
  internal static let component171 = ImageAsset(name: "component171")
  internal static let component181 = ImageAsset(name: "component181")
  internal static let component22 = ImageAsset(name: "component22")
  internal static let contact = ImageAsset(name: "contact")
  internal static let ctScan = ImageAsset(name: "ct-scan")
  internal static let doctor2 = ImageAsset(name: "doctor-2")
  internal static let doctor = ImageAsset(name: "doctor")
  internal static let doctorWhite = ImageAsset(name: "doctorWhite")
  internal static let dollar = ImageAsset(name: "dollar")
  internal static let fav = ImageAsset(name: "fav")
  internal static let fav1 = ImageAsset(name: "fav1")
  internal static let feesIcon = ImageAsset(name: "feesIcon")
  internal static let forgot = ImageAsset(name: "forgot")
  internal static let group234 = ImageAsset(name: "group234")
  internal static let heartCopy3 = ImageAsset(name: "heart copy 3")
  internal static let heartCopy = ImageAsset(name: "heart copy")
  internal static let heart = ImageAsset(name: "heart")
  internal static let heartBar = ImageAsset(name: "heartBar")
  internal static let lifeCopy = ImageAsset(name: "life copy")
  internal static let life = ImageAsset(name: "life")
  internal static let lifeWhite = ImageAsset(name: "lifeWhite")
  internal static let loginCopy = ImageAsset(name: "login copy")
  internal static let login = ImageAsset(name: "login")
  internal static let main = ImageAsset(name: "main")
  internal static let nurse = ImageAsset(name: "nurse")
  internal static let phone = ImageAsset(name: "phone")
  internal static let pinCopy2 = ImageAsset(name: "pin copy 2")
  internal static let pinCopy3 = ImageAsset(name: "pin copy 3")
  internal static let pinCopy = ImageAsset(name: "pin copy")
  internal static let pin = ImageAsset(name: "pin")
  internal static let pinIcon = ImageAsset(name: "pinIcon")
  internal static let rate = ImageAsset(name: "rate")
  internal static let rateYallow = ImageAsset(name: "rateYallow")
  internal static let searchBar = ImageAsset(name: "searchBar")
  internal static let settings = ImageAsset(name: "settings")
  internal static let share = ImageAsset(name: "share")
  internal static let sheet = ImageAsset(name: "sheet")
  internal static let `switch` = ImageAsset(name: "switch")
  internal static let user2 = ImageAsset(name: "user-2")
  internal static let user = ImageAsset(name: "user")
  internal static let veterinary = ImageAsset(name: "veterinary")
  internal static let whiteStar = ImageAsset(name: "white star")
  internal static let whiteHeart = ImageAsset(name: "whiteHeart")
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
