local log = hs.logger.new("bluetooth", "info")

local function runShortcut(name)
    local task = hs.task.new("/usr/bin/shortcuts",
        function(exitCode, stdOut, stdErr)
            if exitCode == 0 then
                log.i(("Shortcut '%s' completed"):format(name))
            else
                log.e(("Shortcut '%s' failed (%d): %s"):format(
                    name,
                    exitCode,
                    stdErr or ""
                ))
            end
        end,
        { "run", name })

    if not task then
        log.e("Failed to create shortcuts task")
        return
    end

    task:start()
end

local watcher = hs.caffeinate.watcher.new(function(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        log.i("System will sleep")
        runShortcut("Bluetooth Off")

    elseif event == hs.caffeinate.watcher.systemDidWake then
        log.i("System did wake")

        hs.timer.doAfter(1, function()
            runShortcut("Bluetooth On")
        end)
    end
end)

watcher:start()
