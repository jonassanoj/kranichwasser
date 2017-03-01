wifi.setmode(wifi.STATION)
wifi.sta.config("horstnet","datensalat")
print(wifi.sta.getip())
valve1 = 1
valve2 = 2
valve3 = 3
valve4 = 4
valve5 = 5
valve6 = 6
valve7 = 7
valve8 = 8
gpio.mode(valve1, gpio.OUTPUT)
gpio.mode(valve2, gpio.OUTPUT)
gpio.mode(valve3, gpio.OUTPUT)
gpio.mode(valve4, gpio.OUTPUT)
gpio.mode(valve5, gpio.OUTPUT)
gpio.mode(valve6, gpio.OUTPUT)
gpio.mode(valve7, gpio.OUTPUT)
gpio.mode(valve8, gpio.OUTPUT)
srv=net.createServer(net.TCP)
srv:listen(80,function(conn)
    conn:on("receive", function(client,request)
        local buf = "";
        local _, _, method, path, vars = string.find(request, "([A-Z]+) (.+)?(.+) HTTP");
        if(method == nil)then
            _, _, method, path = string.find(request, "([A-Z]+) (.+) HTTP");
        end
        local _GET = {}
        if (vars ~= nil)then
            for k, v in string.gmatch(vars, "(%w+)=(%w+)&*") do
                _GET[k] = v
            end
        end
        buf = buf.."<h1> ESP8266 Web Server</h1>";
        buf = buf.."<p>GPIO5 <a href=\"?pin=ON1\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF1\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO4 <a href=\"?pin=ON2\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF2\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO0 <a href=\"?pin=ON3\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF3\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO2 <a href=\"?pin=ON4\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF4\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO14 <a href=\"?pin=ON5\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF5\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO12 <a href=\"?pin=ON6\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF6\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO13 <a href=\"?pin=ON7\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF7\"><button>OFF</button></a></p>";
        buf = buf.."<p>GPIO15 <a href=\"?pin=ON8\"><button>ON</button></a>&nbsp;<a href=\"?pin=OFF8\"><button>OFF</button></a></p>";
        local _on,_off = "",""
        if(_GET.pin == "ON1")then
              gpio.write(valve1, gpio.HIGH);
        elseif(_GET.pin == "OFF1")then
              gpio.write(valve1, gpio.LOW);
        elseif(_GET.pin == "ON2")then
              gpio.write(valve2, gpio.HIGH);
        elseif(_GET.pin == "OFF2")then
              gpio.write(valve2, gpio.LOW);
        elseif(_GET.pin == "ON3")then
              gpio.write(valve3, gpio.HIGH);
        elseif(_GET.pin == "OFF3")then
              gpio.write(valve3, gpio.LOW);
        elseif(_GET.pin == "ON4")then
              gpio.write(valve4, gpio.HIGH);
        elseif(_GET.pin == "OFF4")then
              gpio.write(valve4, gpio.LOW);
        elseif(_GET.pin == "ON5")then
              gpio.write(valve5, gpio.HIGH);
        elseif(_GET.pin == "OFF5")then
              gpio.write(valve5, gpio.LOW);
        elseif(_GET.pin == "ON6")then
              gpio.write(valve6, gpio.HIGH);
        elseif(_GET.pin == "OFF6")then
              gpio.write(valve6, gpio.LOW);
        elseif(_GET.pin == "ON7")then
              gpio.write(valve7, gpio.HIGH);
        elseif(_GET.pin == "OFF7")then
              gpio.write(valve7, gpio.LOW);
        elseif(_GET.pin == "ON8")then
              gpio.write(valve8, gpio.HIGH);
        elseif(_GET.pin == "OFF8")then
              gpio.write(valve8, gpio.LOW);
        end
        client:send(buf);
        client:close();
        collectgarbage();
    end)
end)
