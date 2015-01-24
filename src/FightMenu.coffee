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

    text = self.game.add.text x, y, "- phaser -\nrocking with\ngoogle web fonts", style
    text.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0
