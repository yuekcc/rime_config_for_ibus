-- 文档见 https://github.com/hchunhui/librime-lua/wiki/Scripting

function date_translator(input, seg)
    local config = env.engine.schema.config
    local date = config:get_string(env.name_space .. "/date") or "rq"
    local time = config:get_string(env.name_space .. "/time") or "sj"


    if (input == date) then
       --- Candidate(type, start, end, text, comment)
       local cand = Candidate("date", seg.start, seg._end, os.date("%Y-%m-%d"), "")
       cand.quality = 100
       yield(cand)
    end

    if (input == time) then
        local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M"), "")
        cand.quality = 100
        yield(cand)
        local cand = Candidate("time", seg.start, seg._end, os.date("%H:%M:%S"), "")
        cand.quality = 100
        yield(cand)
    end
 end