local MIN_ALPHA = .5
local MAP_SCALE = .8

-- we dont care about cvar mapFade, dont fade when mouseovering
PlayerMovementFrameFader.AddDeferredFrame(WorldMapFrame, MIN_ALPHA, 1, .5, function() return not WorldMapFrame:IsMouseOver() end)

WorldMapFrame.BlackoutFrame:Hide()
WorldMapFrame:SetScale(MAP_SCALE)
-- fix cursor position from scaling https://www.wowinterface.com/forums/showthread.php?t=57176#8
WorldMapFrame.ScrollContainer.GetCursorPosition = function(frame)
    local x, y = MapCanvasScrollControllerMixin.GetCursorPosition(frame)
    local s = WorldMapFrame:GetScale()
    return x/s, y/s
end
