
class FightMenu
	constructor: (@game) ->

    #window.WebFontConfig = 
    #  active: ()=>
    #    console.log 'loaded'
    #    game.time.events.add Phaser.Timer.SECOND, @createText, this
    #  google: 
    #    families: ['VT323::latin']

    @cursors = @game.input.keyboard.createCursorKeys()
    @sprite_bg = @game.add.sprite 0, 192, 'fightmenu'
    
    @style =
      font: '23px VT323'
      fill: '#FFFFFF'
      #stroke: '#000000'
      #strokeThickness: 2
      shadow: 4

    @createText()

  createText: ->
    

    attack_old = @game.add.text 40, 220, "Attack", @style
    attack_old.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    attack = @game.add.text 40, 220, "Attack", @style
    attack.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    attack_old.destroy()

    magic = @game.add.text 40, 260, "Magic", @style
    magic.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    items = @game.add.text 40, 300, "Items", @style
    items.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    hero1 = @game.add.text 270, 220, "Hero", @style
    hero1.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    hero2 = @game.add.text 270, 260, "Hero 2", @style
    hero2.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    hero3 = @game.add.text 270, 300, "Hero 3", @style
    hero3.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    h1hpmp = @game.add.text 390, 220, "189/1300 HP   2/78 MP", @style
    h1hpmp.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    h2hpmp = @game.add.text 390, 260, "189/1300 HP   2/78 MP", @style
    h2hpmp.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

    h3hpmp = @game.add.text 390, 300, "189/1300 HP   2/78 MP", @style
    h3hpmp.setShadow 2, 2, 'rgba(0,0,0,0.9)', 0

  update: ->
    
    if @cursors.down.isDown
      null
      #@game.state.start 'mapState'
      