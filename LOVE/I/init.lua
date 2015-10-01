function initeverything()
  bodytimer=-100
  bodycount=10

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

  bodyUI=love.graphics.newImage("assets/body/parchment_alpha.png")
  preloadimage("assets/monsters/slum/",24,mainchar)

  bulletspd=12
  bulletnum=0
  bullet={}


  body={}
  
  body[1]=false --could fire or not

  humanhead=love.graphics.newImage("assets/body/main_char_head.png")
  head_now=humanhead
  
  humanbody=love.graphics.newImage("assets/body/main_char_body.png")
  body_now=humanbody
  
  humanlh=love.graphics.newImage("assets/body/main_char_hand_left.png")
  lh_now=humanlh
  humanrh=love.graphics.newImage("assets/body/main_char_hand_right.png")
  rh_now=humanrh
  humanf=love.graphics.newImage("assets/body/main_char_lower.png")
  f_now=humanf
 

  listedbody={}
  gunrh=love.graphics.newImage("assets/body/gun_char_hand_right.png")
  listedbody[1]=gunrh
end	