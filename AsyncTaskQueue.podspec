
Pod::Spec.new do |s|
  s.name             = "AsyncTaskQueue"
  s.version          = "0.1.0"
  s.summary          = "A toolbox of NSOperation subclasses and NSOperationQueue wrapper for a variety of asynchronous programming needs."
  s.description      = "A toolbox of NSOperation subclasses and NSOperationQueue wrapper for a variety of asynchronous programming needs."
  s.homepage         = "https://github.com/suxinde2009/AsyncTaskQueue"
  s.license          = 'MIT'
  s.author           = { "suxinde" => "suxinde2009@126.com" }
  s.source           = { :git => "https://github.com/suxinde2009/AsyncTaskQueue.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.frameworks = 'Foundation'
  s.source_files = 'AsyncTaskQueue/*.swift'
  s.swift_version = '4.0'
end
