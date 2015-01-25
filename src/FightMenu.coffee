
class FightMenu
	constructor: (@game) ->

    @style =
      font: '23px VT323'
      fill: '#FFFFFF'
      #stroke: '#000000'
      #strokeThickness: 2
      shadow: 4
    
    @texts = []

    @keys = @game.input.keyboard.createCursorKeys()
    @keys.A = @game.input.keyboard.addKey Phaser.Keyboard.A
    
    @keys.up.onDown.add @keyUp, this
    @keys.down.onDown.add @keyDown, this
    @keys.left.onDown.add @keyLeft, this
    @keys.right.onDown.add @keyRight, this
    @keys.A.onDown.add @keyA, this

    @cursor = [0, 0]
    @audio_menu_cursor = game.add.audio('menu_cursor')
    @audio_menu_disabled = game.add.audio('menu_disabled')

    @sprite_bg = @game.add.sprite 0, 192, 'fightmenu'
   
    @cursor_text = @game.add.text 0, 0, '>', @style
    @cursor_text.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    @setMainMode()


  #
  # Text Functions
  # 
  addText: (x, y, text) ->
    textSprite = @game.add.text x, y, text, @style
    textSprite.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0
    @texts.push textSprite
  clearText: ->
    @removeText text for text in @texts
  removeText: (text) ->
    text.destroy()
  #
  # Keys
  #
  keyUp: ->
    @cursor[1]--;
    if @cursor[1] < 0
      @cursor[1] = 0
      @actionDisabled()
    else
      @cusorMoved()

  keyDown: ->
    @cursor[1]++;
    if @cursor[1] > 2
      @cursor[1] = 2
      @actionDisabled()
    else
      @cusorMoved()

  keyLeft: ->
    if @mode == "main"
      @actionDisabled()
      return
    @cursor[0]--;
    if @cursor[0] < 0
      @cursor[0] = 0
      if @mode != "main"
        @setMainMode()
      else
        @actionDisabled()
    else
      @cusorMoved()
  
  keyRight: ->
    if @mode == "main"
      @actionDisabled()
      return
    @cursor[0]++;
    if @cursor[0] > 2
      @cursor[0] = 2
      @actionDisabled()
    else
      @cusorMoved()

  keyA: ->
    switch @mode
      when "main"
        switch @cursor[1]
          when 0 then @game.state.start 'mapState'
          when 1 then @setMagicMode()
          when 2 then @setItemsMode()
      when "magic"
        @actionDisabled()
      when "items"
        @actionDisabled()
  #
  # Create Text
  #
  createMainText: ->
    
    @addText 40, 220, "Attack"
    @addText 40, 260, "Magic"
    @addText 40, 300, "Items"
    @addText 270, 220, "Hero"
    @addText 270, 260, "Hero 2"
    @addText 270, 300, "Hero 3"
    @addText 390, 220, "189/1300 HP   2/78 MP"
    @addText 390, 260, "189/1300 HP   2/78 MP"
    @addText 390, 300, "189/1300 HP   2/78 MP"

  createMagicText: ->
    @clearText()
    @addText 40, 220, "Attack"
    @addText 40, 260, "Magic"
    @addText 40, 300, "Items"

  createItemsText: ->
    @clearText()
    @addText 40, 220, "Attack"
    @addText 40, 260, "Magic"
    @addText 40, 300, "Items"

  #
  # Set Menu Mode
  #
  setMainMode: ->
    @mode = "main"
    @clearText()
    @createMainText()
    @cursor = [0, 0]
    @updateCursor()

  setMagicMode: ->
    @mode = "magic"
    @clearText()
    @createMagicText()
    @cursor = [0, 0]
    @updateCursor()

  setItemsMode: ->
    @mode = "items"
    @clearText()
    @createItemsText()
    @cursor = [0, 0]
    @updateCursor()


  #
  # Update Cursor
  #
  actionDisabled: ->
    @audio_menu_disabled.play()
  cusorMoved: ->
    @audio_menu_cursor.play()
    @updateCursor()

  updateCursor: ->
    switch @mode
      when "main" 
        @cursor_text.x = 20
        @cursor_text.y = 220 + @cursor[1] * 40
      when "magic"
        @cursor_text.x = 260 + @cursor[0] * 60
        @cursor_text.y = 220 + @cursor[1] * 40
      when "items"
        @cursor_text.x = 260 + @cursor[0] * 60
        @cursor_text.y = 220 + @cursor[1] * 40

  update: ->
      
      #@game.state.start 'mapState'
      