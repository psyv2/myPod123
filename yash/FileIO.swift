//
//  FileIO.swift
//  NimbleNetiOS
//
//  Created by Naman Anand on 15/02/24.
//

import Foundation

@objc public class FileIO:NSObject {
    @objc public static let shared = FileIO()

    @objc public func performDiskCleanup(
        commonFolderName: String,
        tagFolderName: String
    ) -> Bool {
        do {
            let nimbleSdkFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("nimbleSDK")
            let commonFolderAbsolutePath = URL(fileURLWithPath: commonFolderName).path
            let tagFolderNameAbsolutePath = URL(fileURLWithPath: tagFolderName).path
            let nimbleSdkAbsolutePath = nimbleSdkFolder.path

            try FileManager.default.enumerator(at: nimbleSdkFolder, includingPropertiesForKeys: nil)?.forEach { url in
                guard let fileURL = url as? URL else { return }
                let fileAbsolutePath = fileURL.path

                if fileAbsolutePath == nimbleSdkAbsolutePath || fileAbsolutePath.contains(commonFolderAbsolutePath) || fileAbsolutePath.contains(tagFolderNameAbsolutePath) {
                    return
                }
                try FileManager.default.removeItem(at: fileURL)
            }

            return true

        } catch {
            return false
        }
    }
}
