import Foundation

/// Factory building SOCKS5 adapter.
open class SOCKS5AdapterFactory: ServerAdapterFactory {
    override public init(serverHost: String, serverPort: Int) {
        super.init(serverHost: serverHost, serverPort: serverPort)
    }

    /**
     Get a SOCKS5 adapter.

     - parameter session: The connect session.

     - returns: The built adapter.
     */
    override open func getAdapterFor(session: ConnectSession) -> AdapterSocket {
        let adapter = SOCKS5Adapter(serverHost: serverHost, serverPort: serverPort)
        adapter.socket = RawSocketFactory.getRawSocket()
        return adapter
    }
}


/// Factory building SOCKS5 Authen adapter.
open class SOCKS5AuthenAdapterFactory: ServerAdapterFactory {
    
    let userName: String
    let passWord: String
    
    required public init(serverHost: String, serverPort: Int, userName: String, passWord: String)
    {
        self.userName = userName
        self.passWord = passWord
        
        super.init(serverHost: serverHost, serverPort: serverPort)
    }
    
    /**
     Get a SOCKS5 adapter.
     
     - parameter session: The connect session.
     
     - returns: The built adapter.
     */
    override open func getAdapterFor(session: ConnectSession) -> AdapterSocket {
        let adapter = SOCKS5Adapter(serverHost: serverHost, serverPort: serverPort, userName: userName, passWord: passWord)
        
        adapter.socket = RawSocketFactory.getRawSocket()
        return adapter
    }
}
