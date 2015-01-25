
class FightMenu
	constructor: (@game) ->

    @onProceed = () ->

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

    @audio_menu_cursor.volume = 0.5
    @audio_menu_disabled.volume = 0.5

    @sprite_bg = @game.add.sprite 0, 192, 'fightmenu'

    @cursor_text = @game.add.text 0, 0, '>', @style
    @cursor_text.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    @setMainMode()

  fadeOut: (callback) ->
    @game.add.tween(@sprite_bg).to( { alpha: 0 }, 6000, "Power0").start()
    @game.add.tween(@cursor_text).to( { alpha: 0 }, 6000, "Power0").start()
    for text in @texts
      @game.add.tween(text).to( { alpha: 0 }, 6000, "Power0").start()

  #
  # Text Functions
  #
  addText: (x, y, text) ->
    textSprite = @game.add.text x, y, text, @style
    textSprite.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0
    @texts.push textSprite
  clearText: ->
    @removeText text for text in @texts
    @texts = []
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
          when 0 then @action()
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

    @addText 45, 220, "Attack"
    @addText 45, 265, "Magic"
    @addText 45, 310, "Items"
    @addText 190, 220, "Naruto"
    @addText 190, 265, "Sasuke"
    @addText 190, 310, "Sakura"
    @addText 320, 220, "HP 189/1450"
    @addText 320, 265, "HP 0/2390"
    @addText 320, 310, "HP 0/1100"
    @addText 480, 220, "MP 2/78 "
    @addText 480, 265, "MP 19/33"
    @addText 480, 310, "MP 89/182"

  createMagicText: ->
    @clearText()
    @addText 45, 220, "Attack"
    @addText 45, 265, "Magic"
    @addText 45, 310, "Items"
    @addText 190, 220, "Omega Blast"
    @addText 190, 265, "Thunder Strike"
    @addText 190, 310, "Band-aid"
    @addText 380, 220, "Omega Blast"
    @addText 380, 265, "Thunder Strike"
    @addText 380, 310, "Band-aid"

  createItemsText: ->
    @clearText()
    @addText 45, 220, "Attack"
    @addText 45, 265, "Magic"
    @addText 45, 310, "Items"
    @addText 190, 220, "Potion"
    @addText 190, 265, "Ether"
    @addText 190, 310, "Elixir"

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

  action: ->
    #remove cursor
    @cursor_text.alpha = 0
    #disable input
    @game.input.keyboard.reset true
    @audio_menu_cursor.play()
    @onProceed()
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
        @cursor_text.y = 220 + @cursor[1] * 45
      when "magic"
        @cursor_text.x = 170 + @cursor[0] * 190
        @cursor_text.y = 220 + @cursor[1] * 45
      when "items"
        @cursor_text.x = 170 + @cursor[0] * 190
        @cursor_text.y = 220 + @cursor[1] * 45

  update: ->

      #
