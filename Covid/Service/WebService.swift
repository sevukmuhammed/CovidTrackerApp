//
//  WebService.swift
//  Covid
//
//  Created by user on 4/22/20.
//  Copyright © 2020 Muhammed Sevuk. All rights reserved.
//

import Foundation

class WebService {
    func downLoadResult(request: NSMutableURLRequest , completion: @escaping (CountryResponse?) -> ()) {

        print("1.Request => \(request)")
        /*
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let cryptoList = try? JSONDecoder().decode([CryptoCurrency].self, from: data)
                print(cryptoList)
                completion(cryptoList)
            }
        }.resume()
 */
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("something wnet wrong")
                return
            }
            var result: CountryResponse?
            do {
                result = try JSONDecoder().decode(CountryResponse.self, from: (data))
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            if let json = result {
                completion(json)
            }
            //print(json.result.self.activeCases)
            /*
            print(json.success)
            for stringCountry in json.result {
                print(stringCountry.country)
                print(stringCountry.totalCases)
            }
            */
        })
            dataTask.resume()
    
    }
    func downLoadTotalResult(request: NSMutableURLRequest , completion: @escaping (TotalResponse?) -> ()) {
        print("2.Request => \(request)")
        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("Something Wrong")
                return
            }
            var result: TotalResponse?
            do {
                result = try JSONDecoder().decode(TotalResponse.self, from: (data))
            }
            catch {
                print("failed to conver \(error.localizedDescription)")
            }
            if let json = result {
                completion(json)
            }
        })
        dataTask.resume()
    }
    func downLoadContinentResult(request: NSMutableURLRequest , completion: @escaping (ContinentResponse?) -> ()) {

           print("3.Request => \(request)")
           

           let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
               guard let data = data, error == nil else {
                   print("something wnet wrong")
                   return
               }
               var result: ContinentResponse?
               do {
                   result = try JSONDecoder().decode(ContinentResponse.self, from: (data))
               }
               catch {
                   print("failed to convert \(error.localizedDescription)")
               }
               
               if let json = result {
                   completion(json)
               }
               //print(json.result.self.activeCases)
               /*
               print(json.success)
               for stringCountry in json.result {
                   print(stringCountry.country)
                   print(stringCountry.totalCases)
               }
               */
           })
               dataTask.resume()
       
       }
    func downLoadNewsResult(request: NSMutableURLRequest , completion: @escaping (NewsResponse?) -> ()) {

        print("3.Request => \(request)")
        

        let dataTask = URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            guard let data = data, error == nil else {
                print("something wnet wrong")
                return
            }
            var result: NewsResponse?
            do {
                result = try JSONDecoder().decode(NewsResponse.self, from: (data))
            }
            catch {
                print("failed to convert \(error.localizedDescription)")
            }
            
            if let json = result {
                completion(json)
            }
            //print(json.result.self.activeCases)
            /*
            print(json.success)
            for stringCountry in json.result {
                print(stringCountry.country)
                print(stringCountry.totalCases)
            }
            */
        })
            dataTask.resume()
    
    }
    
}
