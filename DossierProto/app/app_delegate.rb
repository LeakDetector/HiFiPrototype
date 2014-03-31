class AppDelegate
  attr_accessor :status_menu
  
  # Popup sizing variables
  POPUP_WIDTH = 400
  POPUP_HEIGHT = 600
  ARROW_HEIGHT = 12
  WEB_VIEW_URL = "http://stormy-dawn-3910.herokuapp.com/dossier/1"

  BUTTON_WIDTH = 80
  BUTTON_HEIGHT = 24

  # Runs when the application launches (basically this is "main")
  def applicationDidFinishLaunching(notification)
    @app_name = NSBundle.mainBundle.infoDictionary['CFBundleDisplayName']
    setupMainPanel
  end

  # Helper funciton to create the status bar menu item and specify it's
  # behavior
  def createStatusBarItem
    # Create a status bar item and set it so that it gets highlighted when clicked
    @status_item = NSStatusBar.systemStatusBar.statusItemWithLength(NSVariableStatusItemLength).init
    @status_item.setHighlightMode(true)

    # Note, because we're using NSVariableStatusItemLength above, THERE WILL BE
    # NOTHING DISPLAYED IN THE STATUS BAR if there is not a valid image here
    @status_item.setImage(NSImage.imageNamed "menu_bar_icon.png")
    @status_item.setAlternateImage(NSImage.imageNamed "menu_bar_icon_alt.png")

    # TODO: Make the icon stay highlighted when the menu is open. This can
    # likely be accomplished by following these links:
    # http://undefinedvalue.com/2009/07/07/adding-custom-view-nsstatusitem
    # http://stackoverflow.com/questions/14296522/is-there-any-way-to-highlight-the-status-bar-item-programmatically

    @status_item.setTarget(self) #?

    # Set the function to be called when the app icon is clicked
    @status_item.setAction('showHide:')
  end

  # Heper functionc create the primary web view
  def createWebView
    # Initialize the WebView
    @web_view = WebView.alloc.initWithFrame(CGRectMake(1, 1, POPUP_WIDTH, POPUP_HEIGHT - ARROW_HEIGHT))
    @web_view.setMainFrameURL WEB_VIEW_URL

    @web_view.setFrameLoadDelegate(self) #?
    @web_view.setDrawsBackground(false) #?
  end

  def createButton
    @button = NSButton.alloc.initWithFrame(CGRectMake(POPUP_WIDTH-BUTTON_WIDTH-10, POPUP_HEIGHT-ARROW_HEIGHT-BUTTON_HEIGHT-10, BUTTON_WIDTH, BUTTON_HEIGHT))
    @button.setTitle("Quit")
    @button.setButtonType(NSMomentaryLightButton)
    @button.setBezelStyle(NSRoundedBezelStyle)
    @button.setAction("terminate:")
  end

  # Helper function to create all views and add them to the main window
  def setupMainPanel
    createStatusBarItem
    createWebView
    createButton

    # Setup window and add subviews
    @window = PopupPanel.alloc.initPopup(POPUP_WIDTH + 2, POPUP_HEIGHT + 2)
    @window.contentView.addSubview(@web_view)
    @window.contentView.addSubview(@button);
  end

  def showHide(sender)
    @window.showHide(sender)
  end

  # specify certain behavior for web views
  def webView(sender, didFinishLoadForFrame:frame)
    @js_engine = sender.windowScriptObject
    @js_engine.setValue(self, forKey: "helper")
    @mainScrollView = sender.mainFrame.frameView.documentView.enclosingScrollView
    @mainScrollView.setVerticalScrollElasticity(NSScrollElasticityNone)
    @mainScrollView.setHorizontalScrollElasticity(NSScrollElasticityNone)
  end

  # Handle web view errors
  def webView(sender, didFailProvisionalLoadWithError:error, forFrame:frame)
    puts 'Could not connect to the Internet'
  end

end
