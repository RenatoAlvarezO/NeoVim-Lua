local status_ok, diaglist = pcall(require, "diaglist")
if not status_ok then
  return
end

diaglist.init({
    -- optional settings
    -- below are defaults
    debug = false, 

    -- increase for noisy servers
    debounce_ms = 150,
})

