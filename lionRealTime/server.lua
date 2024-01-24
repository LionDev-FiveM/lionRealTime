RegisterNetEvent("lionRealTime:event")
AddEventHandler("lionRealTime:event", function()
    local time = os.date("!*t")
    if Config.TimeZone == 'cet' then
        time = os.date("*t", os.time(time) + 3600*2) --Central European Time (CET)
    elseif Config.TimeZone == 'cewt' then
        time = os.date("*t", os.time(time) + 3600*1) --Central European Winter Time (CEWT)
    elseif Config.TimeZone == 'gmt' then
        time = os.date("*t", os.time(time) - 3600*0) --Greenwich Mean Time (GMT)
    elseif Config.TimeZone == 'et' then
        time = os.date("*t", os.time(time) - 3600*5) --Eastern Time (ET)
    elseif Config.TimeZone == 'ct' then
        time = os.date("*t", os.time(time) - 3600*6) --Central Time (CT)
    elseif Config.TimeZone == 'mt' then
        time = os.date("*t", os.time(time) - 3600*7) --Mountain Time (MT)
    elseif Config.TimeZone == 'pt' then
        time = os.date("*t", os.time(time) - 3600*8) --Pacific Time (PT)
    end
        TriggerClientEvent("lionRealTime:event", source, time.hour, time.min, time.sec)
end)

Citizen.CreateThread(function()
    local vRaw = LoadResourceFile(GetCurrentResourceName(), 'version.json')
    if vRaw and Config.VersionCheck then
        local v = json.decode(vRaw)
        local url = 'https://raw.githubusercontent.com/LionDev-FiveM/lionRealTime/main/lionRealTime/version.json'
        PerformHttpRequest(url, function(code, res)
            if code == 200 then
                local rv = json.decode(res)
                if rv.version ~= v.version then
                    print(([[
 _      _               _____                 _                                  _   
| |    (_)             |  __ \               | |                                | |  
| |     _  ___  _ __   | |  | | _____   _____| | ___  _ __  _ __ ___   ___ _ __ | |_ 
| |    | |/ _ \| '_ \  | |  | |/ _ \ \ / / _ \ |/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __|
| |____| | (_) | | | | | |__| |  __/\ V /  __/ | (_) | |_) | | | | | |  __/ | | | |_ 
|______|_|\___/|_| |_| |_____/ \___| \_/ \___|_|\___/| .__/|_| |_| |_|\___|_| |_|\__|
                                                     | |                             
                                                     |_|                             
Script: lionRealTime
UPDATE: %s AVAILABLE
CHANGELOG: %s
Download: https://github.com/LionDev-FiveM/lionRealTime
If you need help, join our Discord: https://dsc.gg/lion-dev
]]):format(rv.version, rv.changelog))
                end
            else
                print('Error in versioncheck')
            end
        end, 'GET')
    end
end)