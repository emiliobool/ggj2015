class FightMenu
	constructor: (@game) ->
    @cursors = @game.input.keyboard.createCursorKeys()
    @sprite_bg = @game.add.sprite 0, 192, 'fightmenu'

    style =
      font: '24px VT323'
      fill: '#FFFFFF'
      #stroke: '#000000'
      #strokeThickness: 2
      shadow: 4

    text = @game.add.text 10, 210, "Menu 1", style
    text.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

  update: ->
    if @cursors.down.isDown
      @game.state.start 'mapState'