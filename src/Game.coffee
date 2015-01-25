

class Game extends Phaser.State

  constructor: ->
    @game = new Phaser.Game 640, 360, Phaser.AUTO, 'game', this
    @game.scale.fullScreenScaleMode = Phaser.ScaleManager.SHOW_ALL

  preload: ->
    @game.load.tilemap 'map', 'assets/tilemaps/csv/catastrophi_level2.csv', null, Phaser.Tilemap.CSV
    @game.load.image 'tiles', 'assets/tilemaps/tiles/catastrophi_tiles_16.png'
    @game.load.image 'fightbg', 'assets/bg/bg.png'
    @game.load.image 'fightboss', 'assets/sprites/dragon.png'
    @game.load.image 'fightmenu', 'assets/bg/menu2.png'
    @game.load.spritesheet 'player', 'assets/sprites/artemis.png', 32, 32
    @game.load.spritesheet 'button', 'assets/buttons/button_sprite_sheet.png', 193, 71
    #@game.load.script 'webfont', '//ajax.googleapis.com/ajax/libs/webfont/1.5.10/webfont.js'
    WebFont.load({
      active: ()=>
        #console.log 'loaded', @game
        @game.state.start 'fightState'
      google: {
        families: ['VT323::latin']
      }
    })
  
  create: ->
    

    @game.state.add 'fightState', new FightState
    @game.state.add 'creditsState', new CreditsState 
    @game.state.add 'mapState', new MapState
       
    @game.add.button @game.world.Width - 100, 0, 'button', @fullscreen, this, 2, 1, 0
   
  update: ->

  render: ->


  fullscreen: ->
    if @game.scale.isFullScreen
      @game.scale.stopFullScreen()
    else
      @game.scale.startFullScreen false
    
window.onload = ()->
  new Game