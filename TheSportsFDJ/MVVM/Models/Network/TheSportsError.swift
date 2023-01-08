//
//  TheSportsError.swift
//  TheSportsFDJ
//
//  Created by Wajih Benabdessalem on 6/1/2023.
//

public struct TheSportsError: Codable {
    
    // MARK: Public Properties
    
    private(set) var message: String!
    
    // MARK: Constructors
    
    private init() {
        fatalError("You can't use this constructor")
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.message = try container.decode(String.self, forKey: .message)
    }
}
