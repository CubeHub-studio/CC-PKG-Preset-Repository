local id,msg,proto=rednet.receive(10); print("ID: "..tostring(id)); print("Message: "..tostring(msg)); print("Protocol: "..tostring(proto))
