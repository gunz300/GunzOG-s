local a = LoadActor("614_JumpBack.mpg") .. {
	OnCommand= function(self)
		self:blend("BlendMode_Add"):cropto(SCREEN_WIDTH/2,SCREEN_HEIGHT/2):zoomx(self:GetZoomX()*-1):zoomy(self:GetZoomY()*-1):effectclock("music")
		-- Explanation in StretchNoLoop.lua.
		if self.GetTexture then
			self:GetTexture():rate(self:GetParent():GetUpdateRate())
		end
	end,
	GainFocusCommand=cmd(play);
	LoseFocusCommand=cmd(pause);
};

local t = Def.ActorFrame {
	a .. { OnCommand=function(self)
					self:LoadFromCurrentSongBackground()
					self:scale_or_crop_background()
					self:effectclock("music")
					-- Explanation in StretchNoLoop.lua.
					if self.GetTexture then
					self:GetTexture():rate(self:GetParent():GetUpdateRate())
				end
			end };
	a .. { OnCommand=cmd(x,scale(1,0,4,SCREEN_LEFT,SCREEN_RIGHT);y,scale(1,0,4,SCREEN_TOP,SCREEN_BOTTOM)); };
	a .. { OnCommand=function(self)
					 self:x(scale(3,0,4,SCREEN_LEFT,SCREEN_RIGHT)):y(scale(1,0,4,SCREEN_TOP,SCREEN_BOTTOM))
					 if self.SetDecodeMovie then self:SetDecodeMovie(false) end
			 end };
	a .. { OnCommand=function(self)
					 self:x(scale(1,0,4,SCREEN_LEFT,SCREEN_RIGHT)):y(scale(3,0,4,SCREEN_TOP,SCREEN_BOTTOM))
					 if self.SetDecodeMovie then self:SetDecodeMovie(false) end
			 end };
	a .. { OnCommand=function(self)
					 self:x(scale(3,0,4,SCREEN_LEFT,SCREEN_RIGHT)):y(scale(3,0,4,SCREEN_TOP,SCREEN_BOTTOM))
					 if self.SetDecodeMovie then self:SetDecodeMovie(false) end
			 end };
};

return t;
