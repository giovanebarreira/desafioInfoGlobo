//
//  WarningView.swift
//  DesafioInfoGlobo
//
//  Created by Giovane Barreira on 12/18/20.
//

import UIKit

struct WarningView {
  static func showWarning(viewController: UIViewController) {
        let alert = UIAlertController(title: "Erro", message: "Ocorreu um erro no carregamento das noticias.", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        
        DispatchQueue.main.async {
            viewController.present(alert, animated: true, completion: nil)
        }
        
    }
}
