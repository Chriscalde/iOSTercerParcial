//
//  AuthenticationViewController.swift
//  Tercer Parcial
//
//  Created by Christian Calderón on 10/05/20.
//  Copyright © 2020 Christian Calderón. All rights reserved.
//

import UIKit
import LocalAuthentication

class AuthenticationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func AuthenticateBtn(_ sender: Any) {
        authenticateUser()
    }
    

   func authenticateUser() {

        let touchIDManager : PITouchIDManager = PITouchIDManager()

        touchIDManager.authenticateUser(success: { () -> () in

            OperationQueue.main.addOperation({ () -> Void in

                    print("SI ESTUVO CORRECTO")
                
                
                
            })

        }, failure: { (evaluationError: NSError) -> () in

            switch evaluationError.code {

            case LAError.Code.systemCancel.rawValue:

                print("Authentication cancelled by the system")

            case LAError.Code.userCancel.rawValue:

                print("Authentication cancelled by the user")

            case LAError.Code.userFallback.rawValue:

                print("User wants to use a password")

                OperationQueue.main.addOperation({ () -> Void in

                })

            case LAError.Code.touchIDNotEnrolled.rawValue:

                print("TouchID not enrolled")

            case LAError.Code.passcodeNotSet.rawValue:

                print("Passcode not set")

            default:

                print("Authentication failed")

                OperationQueue.main.addOperation({ () -> Void in

                })

            }

        })

    }
}
