function initeverything()
  curstate="menu"
  menupointer=1
  menunewpointer=1
  draw_textinput_in_new=0
  textshow="Please name yourself: "
  love.keyboard.setKeyRepeat(true)
  utf8 = require("utf8")
  filetoload={}
  dxworld=100
  dyworld=100
  mainchar={}
  maincharfps=1
  ww=love.window.getWidth()
  wh=love.window.getHeight()
  abilityUI=love.graphics.newImage("assets/UI/skill.png")
  tiletexture=love.graphics.newImage("assets/texture/texture_meat.png")
  minimapUI=love.graphics.newImage("assets/UI/minimap.png")
  bulletspd=12
  bulletnum=0
  bullet={}
end	