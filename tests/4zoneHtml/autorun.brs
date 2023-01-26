Sub Main()

vm = CreateObject("roVideoMode")
vm.SetMode("3840x2160x60p")

msgPort = CreateObject("roMessagePort")
r = CreateObject("roRectangle", 0, 0, 960,540)
  
config = {
url: "file:///html/zone1.html",
}
h = CreateObject("roHtmlWidget", r, config)
h.SetPort(msgPort)
sleep(10000)
h.Show()
while true
    msg = wait(0, msgPort)
    print "type(msg)=";type(msg)
    if type(msg) = "roHtmlWidgetEvent" then
        eventData = msg.GetData()
        if type(eventData) = "roAssociativeArray" and type(eventData.reason) = "roString" then
            print "reason = ";eventData.reason
            if eventData.reason = "load-error" then
                print "message = ";eventData.message
            endif
        endif
    endif
end while
End Sub