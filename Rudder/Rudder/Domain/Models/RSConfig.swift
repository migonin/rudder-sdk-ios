//
//  RSConfig.swift
//  Rudder
//
//  Created by Pallab Maiti on 04/08/21.
//  Copyright © 2021 Rudder Labs India Pvt Ltd. All rights reserved.
//

import Foundation

@objc open class RSConfig: NSObject {
    var dataPlaneUrl: String
    var flushQueueSize: Int
    var dbCountThreshold: Int
    var sleepTimeOut: Int
    var logLevel: RSLogLevel
    var configRefreshInterval: Int
    var trackLifecycleEvents: Bool
    var recordScreenViews: Bool
    var controlPlaneUrl: String
    var factories: [RSIntegrationFactory]
    
    public override init() {
        dataPlaneUrl = Constants.RSDataPlaneUrl
        flushQueueSize = Constants.RSFlushQueueSize
        dbCountThreshold = Constants.RSDBCountThreshold
        sleepTimeOut = Constants.RSSleepTimeout
        logLevel = .error
        configRefreshInterval = Constants.RSConfigRefreshInterval
        trackLifecycleEvents = Constants.RSTrackLifeCycleEvents
        recordScreenViews = Constants.RSRecordScreenViews
        controlPlaneUrl = Constants.RSControlPlaneUrl
        factories = [RSIntegrationFactory]()
    }
    
    init(dataPlaneUrl: String, flushQueueSize: Int, dbCountThreshold: Int, sleepTimeOut: Int, logLevel: RSLogLevel, configRefreshInterval: Int, trackLifecycleEvents: Bool, recordScreenViews: Bool, controlPlaneUrl: String) {
        self.dataPlaneUrl = dataPlaneUrl
        self.flushQueueSize = flushQueueSize
        self.dbCountThreshold = dbCountThreshold
        self.sleepTimeOut = sleepTimeOut
        self.logLevel = logLevel
        self.configRefreshInterval = configRefreshInterval
        self.trackLifecycleEvents = trackLifecycleEvents
        self.recordScreenViews = recordScreenViews
        self.controlPlaneUrl = controlPlaneUrl
        self.factories = [RSIntegrationFactory]()
    }
    
    @objc public func withDataPlaneUrl(_ dataPlaneUrl: String) -> RSConfig {
        if let url = URL(string: dataPlaneUrl) {
            if let scheme = url.scheme, let host = url.host {
                if let port = url.port {
                    self.dataPlaneUrl = "\(scheme)://\(host):\(port)"
                } else {
                    self.dataPlaneUrl = "\(scheme)://\(host)"
                }
            }
        }
        return self
    }
    
    @objc public func withDataPlaneURL(_ dataPlaneURL: URL) -> RSConfig {
        if let scheme = dataPlaneURL.scheme, let host = dataPlaneURL.host {
            if let port = dataPlaneURL.port {
                self.dataPlaneUrl = "\(scheme)://\(host):\(port)"
            } else {
                self.dataPlaneUrl = "\(scheme)://\(host)"
            }
        }
        return self
    }
    
    @objc public func withFlushQueueSize(_ flushQueueSize: Int) -> RSConfig {
        self.flushQueueSize = flushQueueSize
        return self
    }
    
    @objc public func withDebug(_ debug: Bool) -> RSConfig {
        self.logLevel = .verbose
        return self
    }
    
    @objc public func withLoglevel(_ logLevel: RSLogLevel) -> RSConfig {
        self.logLevel = logLevel
        return self
    }
    
    @objc public func withDBCountThreshold(_ dbCountThreshold: Int) -> RSConfig {
        self.dbCountThreshold = dbCountThreshold
        return self
    }
    
    @objc public func withSleepTimeOut(_ sleepTimeOut: Int) -> RSConfig {
        self.sleepTimeOut = sleepTimeOut
        return self
    }
    
    @objc public func withConfigRefreshInteval(_ configRefreshInterval: Int) -> RSConfig {
        self.configRefreshInterval = configRefreshInterval
        return self
    }
    
    @objc public func withTrackLifecycleEvens(_ trackLifecycleEvents: Bool) -> RSConfig {
        self.trackLifecycleEvents = trackLifecycleEvents
        return self
    }
    
    @objc public func withRecordScreenViews(_ recordScreenViews: Bool) -> RSConfig {
        self.recordScreenViews = recordScreenViews
        return self
    }
    
    @objc public func withControlPlaneUrl(_ controlPlaneUrl: String) -> RSConfig {
        if let url = URL(string: controlPlaneUrl) {
            if let scheme = url.scheme, let host = url.host {
                if let port = url.port {
                    self.controlPlaneUrl = "\(scheme)://\(host):\(port)"
                } else {
                    self.controlPlaneUrl = "\(scheme)://\(host)"
                }
            }
        }
        return self
    }
    
    @objc public func withControlPlaneURL(_ controlPlaneURL: URL) -> RSConfig {
        if let scheme = controlPlaneURL.scheme, let host = controlPlaneURL.host {
            if let port = controlPlaneURL.port {
                self.controlPlaneUrl = "\(scheme)://\(host):\(port)"
            } else {
                self.controlPlaneUrl = "\(scheme)://\(host)"
            }
        }
        return self
    }
    
    @objc public func withFactory(_ factory: RSIntegrationFactory) -> RSConfig {
        factories.append(factory)
        return self
    }
}
