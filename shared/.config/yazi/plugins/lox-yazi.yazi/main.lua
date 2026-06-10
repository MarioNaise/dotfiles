--- @since 25.5.28

local M = {}

local function preview_error(job, msg)
	ya.preview_widget(job, ui.Text(msg):area(job.area):wrap(ui.Wrap.YES))
end

function M:peek(job)
	if not job.file then
		return
	end

	local start = job.skip + 1
	local finish = job.skip + job.area.h

	local output, err = Command("bat")
		:arg("--color=always")
		:arg("--paging=never")
		:arg("--style=numbers")
		:arg("--line-range=" .. start .. ":" .. finish)
		:arg(tostring(job.file.url))
		:output()

	if not output then
		return preview_error(job, "bat failed: " .. tostring(err))
	end

	local text = output.stdout or ""
	text = text:gsub("\t", string.rep(" ", rt.preview.tab_size))

	if job.skip > 0 and text == "" then
		ya.emit("peek", {
			math.max(0, job.skip - job.area.h),
			only_if = job.file.url,
			upper_bound = false,
		})
		return
	end

	local wrap = rt.preview.wrap == "yes" and ui.Wrap.YES or ui.Wrap.NO

	ya.preview_widget(job, ui.Text.parse(text):area(job.area):wrap(wrap))
end

function M:seek(job)
	local h = cx.active.current.hovered
	if h and h.url == job.file.url then
		ya.emit("peek", {
			math.max(0, cx.active.preview.skip + job.units),
			only_if = job.file.url,
		})
	end
end

return M
