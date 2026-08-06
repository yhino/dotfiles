local sleepDebug = {}

sleepDebug.baseDir = os.getenv("HOME") .. "/Library/Logs/sleep-debug"
sleepDebug.currentDir = nil
sleepDebug.sleepStart = nil

local function mkdir(path)
    hs.fs.mkdir(path)
end

local function append(path, text)
    local file = assert(io.open(path, "a"))
    file:write(text)
    file:close()
end

local function timestamp()
    return os.date("%Y%m%d-%H%M%S")
end

local function run(command)
    local task = hs.task.new("/bin/sh", nil, {
        "-c",
        command,
    })

    if task then
        task:start()
    else
        hs.printf("[sleep-debug] Failed to start task: %s", command)
    end
end

local watcher = hs.caffeinate.watcher.new(function(event)
    if event == hs.caffeinate.watcher.systemWillSleep then
        sleepDebug.sleepStart = os.time()

        sleepDebug.currentDir = string.format(
            "%s/%s",
            sleepDebug.baseDir,
            timestamp()
        )

        mkdir(sleepDebug.baseDir)
        mkdir(sleepDebug.currentDir)

        append(
            sleepDebug.currentDir .. "/metadata.txt",
            string.format(
                "Sleep requested: %s\n",
                os.date("%Y-%m-%d %H:%M:%S %Z")
            )
        )

        run(string.format(
            "pmset -g assertions > %q",
            sleepDebug.currentDir .. "/sleep-assertions.txt"
        ))

    elseif event == hs.caffeinate.watcher.systemDidWake then
        if not sleepDebug.currentDir then
            return
        end

        append(
            sleepDebug.currentDir .. "/metadata.txt",
            string.format(
                "Wake callback : %s\n",
                os.date("%Y-%m-%d %H:%M:%S %Z")
            )
        )

        run(string.format(
            "pmset -g assertions > %q",
            sleepDebug.currentDir .. "/wakeup-assertions.txt"
        ))

        run(string.format(
            "pmset -g log | tail -300 > %q",
            sleepDebug.currentDir .. "/pmset.log"
        ))

        local minutes = 15

        if sleepDebug.sleepStart then
            local elapsed = math.ceil((os.time() - sleepDebug.sleepStart) / 60)
            minutes = math.max(10, elapsed + 5)
        end

        run(string.format(
            "/usr/bin/log show --last %dm --style compact --info > %q",
            minutes,
            sleepDebug.currentDir .. "/unified.log"
        ))

        sleepDebug.currentDir = nil
        sleepDebug.sleepStart = nil
    end
end)

watcher:start()
